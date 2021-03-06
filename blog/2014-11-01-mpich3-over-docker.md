---
title: Distributed High Performance Computing Fortran applications over Docker
---

I will use this page as a notepad for my thoughts and notes for participating in
Docker's Global Hackday event in Tokyo [1].

I'll be using MPICH [2] and try to run an mpi-based app over containers.  Code
will be posted on Github
([aespinosa/mpich-docker](http://github.com/aespinosa/mpich-docker))

## Update: 2014-11-03 15:05

Working demo in <http://mpich-demo.allan.wikonec.com>.  Click on the
`Launch_Node` job first. Then launch all the compute nodes by clicking each
job's `Build` button.


## Workflow

* Building dependencies for a lean docker container
 <https://packages.debian.org/jessie/mpich>.

* Prepare the docker image with the your MPI program.  I write a sample in [4].
```
mpif90 /src/hello.f90 -o /app/hello
```

## Running mpi

Two parts of an mpich run [3]:

1. Launch node runs *UI Process* via mpiexec.  This listens to a *control port*
```
docker run --rm=true \
  -e MPIEXEC_PORT_RANGE=1000:1000 --expose=1000 \
  -h master --name master test \
  mpiexec -hosts one,two  -launcher manual -n 2 /hello
```

2. Compute node runs *Proxy Executable* and connects to UI Process (where the
   jobs are actually run) via `hydra_pmi_proxy`
```
$ docker run --rm=true --link master:master -h one test \
  hydra_pmi_proxy --control-port master:1000 \
  --rmk user --launcher manual --demux poll --pgid 0 --retries 10 --usize -2 \
  --proxy-id 0
$ docker run --rm=true --link master:master -h two test \
  hydra_pmi_proxy --control-port master:1000 \
  --rmk user --launcher manual --demux poll --pgid 0 --retries 10 --usize -2 \
  --proxy-id 1
```

## Next steps

Write a custom hydra launcher instead of the manual one. Maybe a worthwhile
project to work one.

## Abstract write-up for Hackday entry

I demonstrate how to run a distributed Fortran application in Docker. For this
demo, I will show how to build and run a Fortran90 program that computes the
value of Pi using a distributed monte carlo computation implemented in MPI.  I
go into the details on how the mpich implementation of MPI works and how to get
it running on Docker by descriptiong mpich (hydra)'s architecture.  I then show
the  sourcecode contains in GitHub that Dockerfiles to build the application
that uses the mpich MPI implementaton.

Full description of this hackday entry is in
<http://aespinosa.github.io/blog/2014-11-01-mpich3-over-docker.html>.

## References

1. <http://connpass.com/event/9491/>
2. <http://www.mpich.org>
3. <http://wiki.mpich.org/mpich/index.php/Hydra_Process_Management_Framework>
4. <https://github.com/aespinosa/mpich-docker/tree/master/test>
