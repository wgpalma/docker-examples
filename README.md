


# Docker commands

## download an image

`docker pull [image-name][:tag]`

for example:

`docker pull nginx:1.23.1`

or you can ommit the tag:

`docker pull nginx ` 

  *note: by default tag is latest*

## To see images

`docker images`

## Parameterscreate a container

`docker run  [parameters] [image-name][:tag]`


## To see running containers 

`docker ps`

## To see all containers

`docker ps -a`

# Parameters

## To run a container un background

You have to use the following parammeter to run a container in background mode.

`-d`

for example:

`docker run  -d [image-name][:tag]`



## To expose image ports

If you want to expose some ports from your container to your computer you need to use:

`-p [host-port]:[container-port]`

In that case host port is the port where you are going to acces to the applicaction or service or anything that you have exposed in container port.

for example if you want to expose the port 3000 on the port 4000 you have to write the parameter:

`-p 4000:3000`


## Assing a name to containers

`--name [my-name]`

for example

`--name  nginx-app`

## Evironment Variables

`-e "key=value"`



## Container resources

By default, docker assings all valilable resources to containers but you can limit they if you want.

## How to limit memory?

You can limit memory by adding the next parameter in docker run:

`-m "[memory]"`

for example

`-m  "500mb"`

or

`-m  "3gb"`

## How to limit CPU?

You can limit CPU by adding the following parameter in docker run:

`--cpuset-cpus #o-#f`

in that case #o and #f are numbers that refer to how many CPU's you will permit docker uses in this container. For example if your host has 4 CPU's  for docker your host has CPU's number 0, 1, 2 and 3 then if you only will permit two CPU's you will have to write: 

`--cpuset-cpus 0-1`

because your are including CPU number cero (0) and CPU nomber one (1).



## Example with all parameters:

`docker run -d --cpuset-cpus 0-1 -m  "40mb" -e "hello=world" -e "name=wilson" --name my-name-app -p 3000:3000 my-app:latest`




# Rename a container

`docker rename [old-name] [new-name]`;

for example

`docker rename my-updated-app my-app`

*note: The name must be unique.*


# Stop, Start and restart Containers

## Stop containers

`docker stop [container-id | container-name]`

for example:

`docker stop my-app`

*note: This command doesn't delete container, only stops the execution.*


## Start containers

`docker start [container-id | container-name]`

for example:

`docker start my-app`

Then you will have your container running again.


## Restart containers

Restart a container is useful when something happened in your continer and you have to restart it avoiding running it again.

`docker restart [container-id | container-name]`

for example:

`docker restart my-app`




# Delete containers

To delete a container you can use the next command:

`docker rm [-f] [list-of-names-or-ids]`

If the container is running `-f` is necesary, it indicates *force*.

example:

`docker rm -f nginx-app 64afs 32p011`


*Note: you can get container ids and container names by commands `docker ps` and `docker ps -a` using CONTAINER ID and NAME columns.*


# How to execute a CLI in a docker container

You can do that by using the following command:

`docker exec -ti [container-id | container-name] bash`


1. **exec**: to execute
2. **-ti**:  *t* is for a terminar and *i* to be iterative


if you want to enter as root or any other user add `-u [usernamer]`

for example:

`docker exec -u root -ti [container-id | container-name] bash`



## How to self delete a container.

A container can be self deleted by using **--rm** flag in docker run for example:

`docker run --rm -ti centos bash`

then when you will exit of the container, the container will be destroyed.

### Other docker commands:

* To list only containers id's:

`docker ps -q`


* To delete all the containers:

`docker ps -q | xargs docker rm -f`

* To list the last container created:

`docker ps -l`

* To see container logs 

`docker logs -f [container-id | container-name]`

* To see information about containet (IP, id, args...)

`docker inspect [container-id | container-name]`

* To see statistics of your container

`docker stats [container-id | container-name]`


# How to copy files betwen container and host

## How to copy external files into containers?

`docker cp [filename] [container-name | container-id]:[route]`

for example

`docker cp index.html apache:/tmp`

## How to copy internal files into host machine?

`docker cp  [container-name | container-id]:[route] [directory]`

for example

`docker cp apache:/var/log .`


# How to container to image

It is usefull if you modified something in your container and you want the changes that you did persist in an image.

*Warning: If you did some change in your valume folder those change won't be saved in the resulting image*

`docker commit [container-name | conatiner-id] [image-name-result]`

for example

`docker commit actual-container resulting-image`

