---
title: Jenkins Plugin Management in Groovy
---

In conjuction with Habit#4 (Tend your Plugin Garden) in [1] . I want to just
have the plugins I want on my Jenkins deployment. For my use case, I don't want
to have vanilla deployed plugins like the CVS plugin.  Here is a way to disable
all plugins at the start.

```
plugins = Jenkins.instance.pluginManager.plugins
plugins.each {
  it.disable()
}
```

## Plugin Installation

Instead of having your outer config management download the .hpi/ .jpi and
wrangle with dependencies yourself, you can take advantage of Jenkin's builtin
Java calls to do exactly the same thing.  With this, you can install a plugin
from the script console.

```
Jenkins.instance.updateCenter.getPlugin("git").deploy()
```

## Enable a plugin's dependencies

In the previous section, some of the dependencies will be disabled even though
they got updated to the version required by the Git plugin because of the first
step we did to disable all plugins.  Here, we get all the plugin's dependencies,
and sub dependencies to enable all of them.

```
git = pm.getPlugin("git")

def deployPlugin(plugin) {
  if (! plugin.isEnabled() ) {
    plugin.enable()
  }
  plugin.getDependencies().each { 
    deployPlugin(pm.getPlugin(it.shortName)) 
  }
}

deployPlugin(git)
```

[1] <http://www.slideshare.net/andrewbayer/seven-habits-of-highly-effective-jenkins-users-2014-edition>

