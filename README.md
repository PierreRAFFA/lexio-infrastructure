# Wordz Infrastructure

Infrastructure using docker-compose to build all containers.  
Before executing any commands, make sure each microservice has been cloned and placed at the same level as the infrastructure:  
    - wordz-infrastructure  
    - wordz-api  
    - wordz-purchase  
    - ...  

```sh
$ docker-compose rm -fv wordz-api-mongo && rm -rf /opt/wordz-api-mongo
$ docker-compose up --build
```