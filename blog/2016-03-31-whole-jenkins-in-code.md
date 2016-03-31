---
title: Your whole Jenkins configuration in Code.. no XML!!
---

There various pieces in configuration management to manage a Jenkins
installation. You have the Job DSL plugin [^1], a Chef cookbook [^2], the
Script Console [^3]. There are others you can use, but I will focus on using
the three to provide a zero-to-Jenkins setup without clicking on forms or
writing XML files. I will make details on the following steps to get it done:

1. Secure Jenkins
2. Update plugins
3. Disable unnecessary plugins
4. Install other plugins
5. Create a seed job

## Secure Jenkins

First we setup Chef to load a private key so that the chef-client can be
authenticated when connecting to Jenkins. In the code below, this uses the
chef-client's client key:

```
ruby_block 'load jenkins credential' do
  block do
    require 'openssl'
    require 'net/ssh'

    key = ::OpenSSL::PKey::RSA.new ::File.read Chef::Config[:client_key]

    node.run_state[:jenkins_private_key] = key.to_pem

    jenkins = resources('jenkins_user[chef]')
    jenkins.public_keys ["#{key.ssh_type} #{[key.to_blob].pack('m0')}"]
  end
end
```

Next is to create a Jenkins user for the chef-client by and specify its public
key from the private key above.

```
jenkins_user 'chef' do
  id "chef@#{Chef::Config[:node_name]}"
  full_name "Chef"
end
```

Finally we lock down Jenkins to authenticate with GitHub:

```
import jenkins.model.Jenkins;
import org.jenkinsci.plugins.GithubSecurityRealm;

Jenkins.instance.securityRealm = new GithubSecurityRealm(
    'https://github.com', 'https://api.github.com', 'x', 'y')

permissions = new hudson.security.GlobalMatrixAuthorizationStrategy()

permissions.add(Jenkins.ADMINISTER, 'aespinosa')
permissions.add(Jenkins.ADMINISTER, '#{resources('jenkins_user[chef]').id}')
permissions.add(hudson.model.View.READ, 'anonymous')
permissions.add(hudson.model.Item.READ, 'anonymous')
permissions.add(Jenkins.READ, 'anonymous')

Jenkins.instance.authorizationStrategy = permissions

Jenkins.instance.save()
```

## Update plugins

When using the LTS version of Jenkins, some of the plugins are out of date. The
following Groovy script:

First, we have to get the list of latest packages from the update center. The
`not_if` guard makes sure that we only check for updates once a day even if the
chef-client tried to converge every 30 minutes.

```
jenkins_script 'get list of latest plugins' do
  command <<-eos.gsub(/^\s+/, '')
    pm = jenkins.model.instance.pluginManager
    pm.doCheckUpdatesServer()
  eos

  not_if do
    update_frequency = 86_400 # daily
    update_file = '/var/lib/jenkins/updates/default.json'
    ::File.exists?(update_file) &&
      ::File.mtime(update_file) > Time.now - update_frequency
  end
end
```

Next, we finally download the plugins. Note the check between the version in
the `updateCenter` and the `pluginManager` so that updates are made
idempotently.

```
import jenkins.model.Jenkins;

pm = Jenkins.instance.pluginManager

uc = Jenkins.instance.updateCenter
updated = false
pm.plugins.each { plugin ->
  if (uc.getPlugin(plugin.shortName).version != plugin.version) {
    update = uc.getPlugin(plugin.shortName).deploy(true)
    update.get()
    updated = true
  }
}
if (updated) {
  Jenkins.instance.restart()
}
```

## Install plugins

Next in the plugin setup phase, we disable the plugins we don't need and
install only the plugins we need. This is similar to what I described earlier
in a [previous post](/blog/2014-10-17-jenkins-plugin-management-in-groovy.html).

```
import jenkins.model.Jenkins;

pm = Jenkins.instance.pluginManager

uc = Jenkins.instance.updateCenter
pm.plugins.each { plugin ->
plugin.disable()
}

deployed = false
def activatePlugin(plugin) {
if (! plugin.isEnabled()) {
  plugin.enable()
  deployed = true
}

plugin.getDependencies().each {
  activatePlugin(pm.getPlugin(it.shortName))
}
}

["git", "workflow-aggregator", "github-oauth", "job-dsl", "extended-read-permission"].each {
if (! pm.getPlugin(it)) {
  deployment = uc.getPlugin(it).deploy(true)
  deployment.get()
}
activatePlugin(pm.getPlugin(it))
}

if (deployed) {
Jenkins.instance.restart()
}
```

## Create the Seed job

The Job DSL plugin lets us specify our Jenkins job. But how to you set up the
seed job automatically? The Groovy script below uses the Script console to
create the Seed Job.  The `samples.groovy` file can then be deployed in any way
you see fit like Git or as a Chef File resource.

```
import jenkins.model.Jenkins;
import hudson.model.FreeStyleProject;

job = Jenkins.instance.createProject(FreeStyleProject, 'seed-job')
job.displayName = 'Seed Job'

builder = new javaposse.jobdsl.plugin.ExecuteDslScripts(
  new javaposse.jobdsl.plugin.ExecuteDslScripts.ScriptLocation(
      'false',
      'samples.groovy',
      null),
  false,
  javaposse.jobdsl.plugin.RemovedJobAction.DELETE, 
  javaposse.jobdsl.plugin.RemovedViewAction.DELETE, 
  javaposse.jobdsl.plugin.LookupStrategy.JENKINS_ROOT
)
job.buildersList.add(builder)

job.save()
```

[^1]: <https://wiki.jenkins-ci.org/display/JENKINS/Job+DSL+Plugin
[^2]: https://supermarket.chef.io/cookbooks/jenkins
[^3]: https://wiki.jenkins-ci.org/display/JENKINS/Jenkins+Script+Console
