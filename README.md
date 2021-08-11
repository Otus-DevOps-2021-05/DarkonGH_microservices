# DarkonGH_microservices
DarkonGH microservices repository

## Домашнее задание №15 Docker контейнеры. Docker под капотом

*13 ДЗ: Запуск VM с установленным Docker Engine при помощи Docker Machine. Написание Dockerfile и сборка образа с тестовым приложением. Сохранение образа на DockerHub.*

### Установка Docker

Выполним установку Docker:

```bash
sudo snap install docker
```

### Запуск первого докер контейнера Hello-World

```
darkon@darkonVM:~/DarkonGH_microservices (docker-2)$ sudo docker run hello-world
[sudo] пароль для darkon:
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
b8dfde127a29: Pull complete
Digest: sha256:776b0895d5e2fcd5e80bcdd607adc45461ba11143ef3df531174bf00679f43fe
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
 ```

### Основные команды

Список запущенных контейнеров

```bash
docker ps
```

Список всех контейнеров

```bash
docker ps -a
```

Список сохранненных образов

```bash
docker images
```

Команда run создает и запускает контейнер из image

```bash
docker run -it ubuntu:18.04 /bin/bash
```

Сортировка контейнеров по дате создания

```bash
docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.CreatedAt}}\t{{.Names}}"
```

Запуск остановленного контейнера

```bash
docker start <u_container_id>
```

attach подсоединяет терминал к созданному контейнеру

```
docker attach <u_container_id>
```

Запуск процесса внутри контенера

```
docker exec -it <u_container_id> bash
```

Создание image из контейнера

```
docker commit <u_container_id> yourname/ubuntu-tmp-file
```

### Создадим image из контейнера

создание image

```bash
darkon@darkonVM:~ $ sudo docker commit 4babfbfd5179 denis_petrov/ubuntu-tmp-file
sha256:a46f338a8d593c3c1a3f6d94a93e6a3f119e17965f6f02ebc61a5dd041ef4de5
```

выведем список образов

```bash
darkon@darkonVM:~ $ sudo docker images
REPOSITORY                     TAG       IMAGE ID       CREATED              SIZE
denis_petrov/ubuntu-tmp-file   latest    a46f338a8d59   About a minute ago   63.1MB
darkon/ubuntu-tmp-file         latest    e5687d68e9ca   30 minutes ago       63.1MB
ubuntu                         18.04     39a8cfeef173   2 weeks ago          63.1MB
nginx                          latest    08b152afcfae   2 weeks ago          133MB
hello-world                    latest    d1165f221234   5 months ago         13.3kB
```
