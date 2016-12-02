Cloud9 IDE SDK - non-root
==============

## Docker hub
An alternative automated build is available at the [Docker registry](https://hub.docker.com/r/perara/c9ide/).

  * Fedora 25:
    `docker pull perara/c9ide:fedora25-nr`
  * CentOS 7:
    `docker pull perara/c9ide:centos7-nr`
  * Ubuntu 16.04 (xenial):
    `docker pull gbraad/c9ide:ubuntu1604-nr`

Usage
-----

### Setup an alias
```
$ alias c9ide='docker run -it --rm -v `pwd`:/workspace perara/c9ide:ubuntu1604-nr'
```

### Invoke C9 IDE

```
$ cd ~/Projects/[something]
$ c9ide
```

and open your browser to [localhost:8181](http://localhost:8181/)