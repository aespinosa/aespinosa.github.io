---
title: Integration testing with the Kubernetes Java Client
---

Frameworks for writing Kubernetes controllers in native Golang has
[envtest](https://pkg.go.dev/sigs.k8s.io/controller-runtime/pkg/envtest).  It is
well documented and various frameworks like Kubebuilder and Operator SDK shows a
lot of example how to use it.

controller-runtime/envtest sets up an integration test for a controller by
spinning up the Kubernetes Control plane with your custom CRDs.  We can do the
same with Java using popular libraries and integrate them with the process of
spinning up a Kubernetes Control Plane.  This post shows how to do it with 
[K3s](https://k3s.io) but it can be adopted to use other micro-Kubernetes
distributions like [kind](https://kind.sigs.k8s.io/),
[MicroK8s](https://microk8s.io/), etc.  We can even make a port of
controller-runtime/envtest by spinning up Etcd and kube-apiserver ourselves!

An integration test basically consists of three parts:

1.  Spin up a Kubernetes Cluster.  In most cases for building controllers/
    operators, the control plane (kube-apiserver) is usually enough.
2.  Interact with the new Kube cluster by preparing CRDs, running the controller
    to test and asserting expected behavior.
3.  Stop and delete the Kubernetes cluster.

In this post, we replicate the integration test structure in Java using the
[Kubernetes Java Client](https://github.com/kubernetes-client/java).

## 1.  Start Kubernetes cluster

First we start our Kubernetes Control plane.  Here we will spin up the k3s
control plane with the command `k3s server --disable-agent` as a background
process in Java:

```
Path tempDir = Files.createTempDirectory("kube-cluster");
File kubeConfig = new File(tempDir.toFile(), "k3s.yaml");

Process k3sServer = new ProcessBuilder("k3s", "server",
  "--disable-agent",
  "--bind-address", "127.0.0.1",
  "--data-dir", tempDir.toString(),
  "--write-kubeconfig", kubeConfig.toString())
  .start();
```

We create the data that k3s stores in a temporary directory so that our tests
are isolated from each other.  We specify this temporary directory with the
`--data-dir` flag.  This also guarantees that each test starts with a clean
state of the kubernetes cluster.

The next step is we wait until our control plane is ready.  

First we need to figure out how to connect to this new Kubernetes cluster.  k3s
generates a `KUBECONFIG` file that specifies an admin account to connect to the
kubernetes cluster.  In our test suite, we store this file in our temporary
directory.  We wait until k3s create this `KUBECONFIG` file before initializing
our Java client:


```
while (true) {
  if (kubeConfig.exists()) break;
  Thread.sleep(500);
}

KubeConfig config = KubeConfig.loadKubeConfig(new FileReader(kubeConfig));
ApiClient admin = ClientBuilder.kubeconfig(config).build();
```

Now that we have the `ApiClient` object initialize, we use this to query the
kube-apiserver if it is ready to server requests.  We poll the
[`/readyz`](https://kubernetes.io/docs/reference/using-api/health-checks/)
endpoint and block until it gives us a 200 response.  This indicates that our
control plane is ready.

```
while (true) {
  int code = admin.buildCall("/readyz", "GET",
      null, null, null, Map.of(), Map.of(), null,
      new String[]{"BearerToken"}, null)
    .execute().code();
  if (code == 200) break;
  Thread.sleep(500);
}
```

## 2.  Run test suite

At this point, we are now ready to run our controller like
[`ControllerExample.java`](https://github.com/kubernetes-client/java/blob/master/examples/examples-release-12/src/main/java/io/kubernetes/client/examples/ControllerExample.java).
In the snippet below we just run some sample code to interact with the
kube-apiserver:

```
CoreV1Api core = new CoreV1Api(admin);
V1NamespaceList namespaces = core.listNamespace(null, null, null, null,
    null,
    null, null, null, null, null);
System.out.println(namespaces);
```

## 3. Shutdown and delete the cluster

Now that our tests are finished, it is time we bring down the cluster and delete
the temporary data it created:

```
k3sServer.destroy();
// Use commons-io:commons-io library to recursively delete the directory
FileUtils.deleteDirectory(tempDir.toFile());
```

## Source code

Full snippet of the implementation can be found in
<https://gist.github.com/aespinosa/10268e7dfc3b2b3661b0daea8e7269ee>.
