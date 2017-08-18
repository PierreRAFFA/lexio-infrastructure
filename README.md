# Wordz Infrastructure

Infrastructure using docker-compose to build all containers.  
Before executing any commands, make sure each microservice has been cloned and placed at the same level as the infrastructure:  
- wordz-infrastructure  
- wordz-api  
- wordz-purchase  
- wordz-push-notification
- ...  

#### Build
```sh
$ docker-compose rm -fv wordz-authentication-mongo && rm -rf /opt/wordz*
$ docker-compose up --build
```


#### Clean up

```sh
# Delete all containers
$ docker rm $(docker ps -a -q)  

# Delete all images
$ docker rmi $(docker images -q)
```