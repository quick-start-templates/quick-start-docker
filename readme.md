# Docker Playground

A playground with a variety of commonly-used tools you could use from time to time. With **Docker Playground**, you don't need to memorize and type tons of Docker commands just to build an environment to test something. 

# How to use

```shell
$ cd /directory/to/play
$ git clone https://github.com/awesome-playground/docker-playground
$ cd docker-playground
```

## How to use MySQL immediately

- Start MySQL server in Docker

```shell
$ docker-compose up mysql -d
```

You can also put your MySQL configuration file into `mysql/conf` and your database initialization script into `mysql/init` directory.

- Connect to MySQL 

Connect to MySQL server with any one of your favorite clients(host `127.0.0.1`), or Docker(host `mysql`).

```shell
$ mysql -h127.0.0.1 -uroot -p
```

Or

```shell
$ docker run --network docker_localhost --rm -it mysql mysql -hmysql -uroot -proot
```

## How to use PostgreSQL immediately

- Start PostgreSQL server in Docker

```shell
$ docker-compose up postgres -d
```

- Connect to PostgreSQL

```shell
$ docker run --network docker_localhost --rm -it postgres psql -h postgres -U postgres # password: postgres
```

## How to use Redis immediately

- Start Redis server in Docker

```shell
$ docker-compose up redis -d
```

- Connect to Redis

```shell
$ docker run --network docker_localhost --rm -it redis redis-cli -h redis
```

## How to use Tomcat immediately

Drop your `.war` file into `tomcat/webapps/`, where there is a `sample.war` file for demostration.

- Start Tomcat server in Docker

```shell
$ docker-compose up tomcat -d
```

- Connect to Tomcat

Open your browser and navigate to http://127.0.0.1:8080/sample , where `sample` is the file name of the `.war` file you dropped into `tomcat/webapps/` without extension.

## How to use Nginx immediately

Put your `nginx.conf` file into `nginx/conf/` directory and/or your static web pages into `nginx/html`, then

- Start Nginx server in Docker

```shell
$ docker-compose up nginx -d
```

- Connect to Nginx

Open your browser and navigate to http://127.0.0.1 .

## How to use multple services together

If you want to proxy your Tomcat server with Nginx, modify or create your own `nginx.conf` that redirect all requests to upstream server `tomcat`, 

```nginx
# ...
server {
    server_name localhost;

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header REMOTE-HOST $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://tomcat:8080$request_uri;
    }
}
```

and start Nginx and Tomcat together,

```shell
$ docker-compose up tomcat nginx -d
```

and you're done!

Enjoy yourself!!

# Contributing

If you found a popular tool that is not included, open an issue, a pull request is also welcome.
