---
title: Import Jenkins Configuration to a dockerized jenkins
date: 2014-03-05 22:57
tags: jenkins, devops, docker
---

I have been maintaining a lightweight docker [container for
Jenkins](https://index.docker.io/u/aespinosa/jenkins/) recently.
Below is a tutorial on how to migrate using it.

First, create a "data volume".  In the following example, I named this source
"jenkins".  From the subsequent management, I will be referring to this
container.

```
docker run -v /jenkins -name jenkins busybox true
```

We then import our jenkins job by linking the volume to a tar command

```
tar -c jobs/*/config.xml | docker run -a stdin -i --volumes-from jenkins busybox tar -xC /jenkins
```

Now that the Jenkins workspace is pre-populated, the same volume can be referred
to when launching a container.

```
docker run --volumes-from jenkins -d aespinosa/jenkins
```
