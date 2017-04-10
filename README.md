![](http://i.imgur.com/GpOR4F5.png)

Simple, easy and replicable Rails dev environment for your Mac - using Docker, Docker-Compose and Docker-Sync
---

### About

This is a boilerplate Docker environment for you Rails App letting you **code on your Mac while running in Docker**, it includes by default:
- **DB container** (PGSQL or MYSQL *uncomment in docker-compose.yml*)
- **Redis container**
- **Web container** (your rails app)
- **Job Container** (Sidekiq instance)

Web/Job containers **sync code base from your Rails App in realtime**, letting you code on you Mac and run in the same time everything from the container

Bundler Gems, DB and Redis data are **persisted accross restart** and you can use **ByeBug or Pry out of the box** with a simple command!

### Pre-requisite

First install:
- [Docker Toolbox](https://www.docker.com/products/docker-toolbox)
- ```gem install docker-sync```
- ```brew install unison```
- ```git clone git@github.com:gmontard/rails-docker-dev-box.git```
- ```cd rails-dev-box && mkdir data/sql```


### Steps

1. Clone you Rails app inside the "my-rails-app" folder (*If you rename it make sure to change the name in the docker-sync file*)

2. Move the ```scripts/``` folder into your Rails App root folder

3. Create a ```data/sql``` folder *(info: adding a .gitkeep inside will make the PG container fail)*

3. Check the *docker-compose.yml* ENV variables for Redis/SQL and setup your *database.yml* in your Rails App file.

4. Run everything

```
docker-sync-stack start
```

### Important Commands

Start all containers:
- ```docker-sync-stack start```

Stop all containers:
- ```docker-sync-stack clear```

Check all containers are stopped
- ```docker ps```

Run command inside a container
- ```docker-compose run CONTAINER COMMAND``` (ex: docker-compose run web rake db:migrate)

Rebuild a container in case the DockerFile change:
- ```docker-compose build CONTAINER```

Need to debug a container?
- ```docker-compose run CONTAINER /bin/bash```

Need to access ByeBug or Pry interactve shell?
- ```docker attach $(docker-compose ps -q web)``` :warning: DO NOT use ```CTRL+C``` here or it will exit the container but use ```CTRL+Q+P```


### Type less with ZSH Alias!

```vi ~/.zshrc```

```
# Add those lines
alias dss="docker-sync-stack"
alias dbe="docker-compose run web bundle exec"
alias dbi="docker-compose run web bundle install"
function ddbug(){
  docker attach $(docker-compose ps -q $1)
}
```

Reload ZSH
```
source ~/.zshrc
```

And now enjoy the simple commands like:
- ```dss start```
- ```dbe rails c```
- ```dbe rails restart```
- ```dbi```
- ```ddbug web```

And obviously create your own!

### Miscs

- Your DB is accessible from your host machine with the 127.0.0.1 IP and using the user/password combination found in *docker-compose.yml* file.


----
Thanks to Jesal Gadhis, this project was inspired by his  [tutorial](https://jes.al/2016/09/setting-up-a-rails-development-environment-using-docker/)
