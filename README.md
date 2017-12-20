# docker

This is my personal collection of Dockerfiles.

The Dockerfiles create images with
* my personal shell look&feel
* my vim settings
* GNU screen settings
* build-essential (gcc, make, ...)
* tree and htop
* curl and wget

The resulting image fits *my* needs. Feel free to use them if you want to.

# About the `dock-py` tool:

This tiny little tool creates is capable of listing all
* docker images along their published volumes
* docker container and which volume they have currently mounted
* create a container, automatically create and mount all published volumes of the 
docker container image.

In order to have this tool running you should install the docker python package 
(https://pypi.python.org/pypi/docker/2.7.0) via:

    $ pip3 install -r requirements.txt

Example usage:

#### List all images:

    $ dock-py images
    dyle71/ubuntu:17.10
        id:               sha256:da2533a68fc65f19242dc6db8a477e13427f8107f8625f724937faffb21e5ae9
        cmd:              /bin/sh -c #(nop)  VOLUME [/home /srv /var]
        entrypoint:       
        published volume: /home
        published volume: /srv
        published volume: /var
        working dir:      /root
    dyle71/ubuntu:17.04
        id:               sha256:88d87a4e0f5cc0535e6031819c3c8998b782fecfb058057dcd96dcfaee6c271c
        cmd:              /bin/sh -c #(nop)  VOLUME [/home /srv /var]
        entrypoint:       
        published volume: /home
        published volume: /srv
        published volume: /var
        working dir:      /root
    dyle71/debian:9
        id:               sha256:37f502b00266349e06c9c282bd069bf36672806972d67f59bf23f71f861a00a8
        cmd:              /bin/sh -c #(nop)  VOLUME [/home /srv /var]
        entrypoint:       
        published volume: /home
        published volume: /srv
        published volume: /var
        working dir:      /root

#### List all containers:

    $ dock-py containers
    ubuntu.17.10                                                                                                                                                                                                                                                                                                
         image:           dyle71/ubuntu:17.10                                                                                                                                                                                                                                                                   
        status:           running                                                                                                                                                                                                                                                                               
         mount:           [host: /var/lib/docker/volumes/ubuntu.17.10.home/_data] -(volume)-> [container: /home]                                                                                                                                                                                                
         mount:           [host: /var/lib/docker/volumes/ubuntu.17.10.srv/_data] -(volume)-> [container: /srv]                                                                                                                                                                                                  
         mount:           [host: /var/lib/docker/volumes/ubuntu.17.10.var/_data] -(volume)-> [container: /var]                                                                                                                                                                                                  
    ubuntu.17.04                                                                                                                                                                                                                                                                                                
         image:           dyle71/ubuntu:17.04                                                                                                                                                                                                                                                                   
        status:           running                                                                                                                                                                                                                                                                               
         mount:           [host: /var/lib/docker/volumes/ubuntu.17.04.home/_data] -(volume)-> [container: /home]                                                                                                                                                                                                
         mount:           [host: /var/lib/docker/volumes/ubuntu.17.04.srv/_data] -(volume)-> [container: /srv]                                                                                                                                                                                                  
         mount:           [host: /var/lib/docker/volumes/ubuntu.17.04.var/_data] -(volume)-> [container: /var]                                                                                                                                                                                                  
    debian.9
         image:           dyle71/debian:9
        status:           running
         mount:           [host: /var/lib/docker/volumes/debian.9.home/_data] -(volume)-> [container: /home]
         mount:           [host: /var/lib/docker/volumes/debian.9.srv/_data] -(volume)-> [container: /srv]
         mount:           [host: /var/lib/docker/volumes/debian.9.var/_data] -(volume)-> [container: /var]


#### Automatically mount all published volumes of a container:

    $ dock-py run dyle71/debian:9 test_debian

Note: the published volumes in the image (`/home`, `/srv` and `/var`) are labeled 
`test_debian.home`, `test_debian.srv` and `test_debian.var`. If they to not exist, 
they will be created.


## dock-py TODOs

* specify docker container restart policy on the command line. This is currently 
"until-stopped".
* specify port binding on the command line. This is currently not supported at all.