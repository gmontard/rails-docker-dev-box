![](http://i.imgur.com/GpOR4F5.png)

Simple, easy and replicable Rails dev environment for your Mac - using Docker, Docker-Compose and Docker-Sync
---

### About

This is a boilerplate Docker environment for you Rails App letting you **code on your Mac while running in Docker**, it includes by default:
- **DB container** (PGSQL or MYSQL *uncomment in docker-compose.yml*)
- **Redis container**
- **Web container** (your rails app)
- **Job Container** (Sidekiq instance)

Bundler Gems, DB and Redis data are **persisted accross restart!**

Web/Job containers **sync code base from your Rails App in realtime**, letting you code on you Mac and run in the same time everything from the container

### Pre-requisite

First install:
- [Docket Toolbox](https://www.docker.com/products/docker-toolbox)
- ```gem install docker-sync```
- ```brew install unison```


### Steps

1. Clone you Rails app inside the "my-rails-app" folder (*If you rename it make sure to change the name in the docker-sync file*)

2. Add the */scripts* folder into your Rails App (or at least the *start-dev.sh* file inside it if you already have one)

3. Check the *docker-compose.yml* ENV variables for Redis/SQL and setup your *database.yml* file.

4. Running everything

```
docker-sync-stack start
```

### Useful Commands

Start all containers:
- ```docker-sync-stack start```

Stop all containers:
- ```docker-sync-stack clear```

Check all containers are stopped
- ```docker ps```

Run command inside a container
- ```docker-compose run CONTAINER COMMAND``` (ex: docker-compose run web rake db:migrate, /bin/bash)

Rebuild a container in case the DockerFile change:
- ```docker-compose build CONTAINER```

Need to debug a container?
- ```docker-compose run CONTAINER /bin/bash```


### Miscs

- Your DB is accessible from your host machine with the 127.0.0.1 IP and using the user/password combination found in *docker-compose.yml* file.


----
Thanks to Jesal Gadhis, this project was inspired by his  [tutorial](https://jes.al/2016/09/setting-up-a-rails-development-environment-using-docker/)
