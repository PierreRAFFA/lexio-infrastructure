# Lexio Infrastructure

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

#### Deploy a service in the production server
This command:  
    - builds a new image based on the version specified on the package.json of the service  
    - pushes the new image to DockerHub  
    - pulls the new image in the production server  
    - replaces the container by new one in the production server  
```sh
$ ./deploy.sh lexio-game
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

#### Connect to a db
```sh
$ docker run -it --rm --net lexioinfrastructure_default --link lexio-authentication-mongo:mongo mongo mongo -u admin -p password --authenticationDatabase admin lexio-authentication-mongo/authentication
$ docker run -it --rm --net lexioinfrastructure_default --link lexio-game-mongo:mongo mongo mongo -u admin -p password --authenticationDatabase admin lexio-game-mongo/game
```

#### Import the prod db to local
```sh
$scp -r lexiolive:/opt/lexio/prod /opt/lexio
```


#### Create/Renew the ssl certificate
[How to create/renew](https://medium.com/@yash.kulshrestha/using-lets-encrypt-with-express-e069c7abe625)

IMPORTANT NOTES:
 Congratulations! Your certificate and chain have been saved at:  
   /etc/letsencrypt/live/api.lexiogame.com/fullchain.pem  
   Your key file has been saved at:  
   /etc/letsencrypt/live/api.lexiogame.com/privkey.pem  
   Your cert will expire on 2018-01-16. To obtain a new or tweaked
   version of this certificate in the future, simply run
   letsencrypt-auto again. To non-interactively renew *all* of your
   certificates, run "letsencrypt-auto renew"  