#!/usr/bin/env bash

service="$1"
serviceDir=$(pwd)/../"$service"
echo "$serviceDir"

if [ -d $serviceDir ]; then
    package="$serviceDir"/package.json

    if [ -f $package ]; then

        version=$(jq .version "$package" | sed 's/"\(.*\)"/\1/')
        dockercompose=$(pwd)/docker-compose.production.yml
        sed -i "" 's/lexio\/'"$service"':.*$/lexio\/'"$service"':'"$version"'/' "$dockercompose"

        echo "Building $1:$version"
        echo "========================"
        docker-compose -f docker-compose.production.yml build "$service"

        echo "Pushing to DockerHub"
        echo "===================="
        docker-compose -f docker-compose.production.yml push "$service"

        echo "Syncing..."
        echo "==========="
        sed -i "" 's/ build: /#build: /' "$dockercompose"
        rsync -avz --delete-after * lexiolive:/var/infrastructure/
        sed -i "" 's/#build:/ build:/' "$dockercompose"

        echo "Deploying..."
        echo "============"
        ssh lexiolive service=$service 'bash -s' <<'ENDSSH'
  cd /var/infrastructure
  docker-compose -f docker-compose.production.yml pull --ignore-pull-failures $service
  docker-compose -f docker-compose.production.yml up -d --no-deps --build $service
ENDSSH
    fi
fi

