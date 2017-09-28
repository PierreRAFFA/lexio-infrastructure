# Wordz Infrastructure

Infrastructure using docker-compose to build all containers.  
Before executing any commands, make sure each microservice has been cloned and placed at the same level as the infrastructure:  
>.  
..  
lexio-infrastructure/    
lexio-authentication/  
lexio-game/  
lexio-purchase/  
lexio-push-notification/  


#### Create a docker machine on AWS
```sh
$ docker-machine create --driver amazonec2  --amazonec2-region eu-west-2 --amazonec2-instance-type "t2.medium" lexio-001
$ eval $(docker-machine env lexio-001)
```

#### Up All
```sh
$ docker-compose -f docker-compose.production.yml up -d
```

#### Build
```sh
$ docker-compose rm -fv lexio-authentication-mongo && rm -rf /opt/lexio*
$ docker-compose up --build
```

#### Clean up

```sh
# Delete all containers
$ docker rm $(docker ps -a -q)  

# Delete all images
$ docker rmi $(docker images -q)
```

#### Deploy a container with the new image
This command:  
    - builds a new image based on the version specified on the package.json of the service  
    - pushes the new image to DockerHub  
    - pulls the new image in the production server  
    - replaces the container by new one in the production server  
```sh
$ ./build.sh lexio-game
```

#### Install Let's Encrypt Client
```bash
$ echo 'deb http://ftp.debian.org/debian jessie-backports main' | sudo tee /etc/apt/sources.list.d/backports.list
$ sudo apt-get update
```

#### Update the infrastructure server-side
```sh
$ scp -r . root@lexiolive:/var/infrastructure
```
