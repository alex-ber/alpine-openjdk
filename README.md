## alpine-openjdk

alpine-openjdk is Apline Linux based Open JDK 8 installation. See CHANGELOG.md for detail description.


## Prerequisites
Tested with

- Docker 18.09.2
- bash 3.2.57

## Contains
- Alpine Linux
- Java Open JDK 8

## Build

Clone repo

```
git clone git@github.com:alex-ber/alpine-openjdk.git
```

Create image

```
docker build . -t alexberkovich/alpine-openjdk
```

Or even, if you run the daemon with experimental features enabled: 

```
docker build --squash . -t alexberkovich/alpine-openjdk
```

In Docker 1.13, a new --squash parameter was added. It can be used to reduce the size of an image by removing files 
which are not present anymore, and reduce multiple layers to a single one between the origin and the latest stage. 



You may want to do some cleanup first:

```
docker rm -f openjdk8; docker rmi alexberkovich/alpine-openjdk
```

## DockerHub

Image available on DockerHub

```
docker pull alexberkovich/alpine-openjdk
```

## Test

`Enusre that you don't have running container

docker rm -f openjdk8; 


Explicitly start the container:

```
docker run -d --name openjdk8 alpine-openjdk
```


You can access bash with the following command

```
docker exec -it openjdk8 bash
```

