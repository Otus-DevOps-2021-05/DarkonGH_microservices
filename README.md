# DarkonGH_microservices

DarkonGH microservices repository

## Домашнее задание №15-№16 Docker контейнеры. Docker под капотом

*12 ДЗ: Установка Docker, запуск контейнера на локальной машине, выполнение команд внутри контейнера, создание образа контейнера на основе запущенного.*
*13 ДЗ: Запуск VM с установленным Docker Engine при помощи Docker Machine. Написание Dockerfile и сборка образа с тестовым приложением. Сохранение образа на DockerHub.*

### Установка Docker

Выполним установку Docker согласно официальной инструкции `https://docs.docker.com/engine/install/ubuntu/`

### Запуск первого докер контейнера Hello-World

```
darkon@darkonVM:~/DarkonGH_microservices (docker-2)$ docker run hello-world
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

Список сохраненных образов

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

```bash
docker attach <u_container_id>
```

Запуск процесса внутри контейнера

```bash
docker exec -it <u_container_id> bash
```

Создание image из контейнера

```bash
docker commit <u_container_id> yourname/ubuntu-tmp-file
```

### Создадим image из контейнера

создание image

```bash
darkon@darkonVM:~ $ docker commit 4babfbfd5179 denis_petrov/ubuntu-tmp-file
sha256:a46f338a8d593c3c1a3f6d94a93e6a3f119e17965f6f02ebc61a5dd041ef4de5
```

выведем список образов

```bash
darkon@darkonVM:~ $ docker images
REPOSITORY                     TAG       IMAGE ID       CREATED              SIZE
denis_petrov/ubuntu-tmp-file   latest    a46f338a8d59   About a minute ago   63.1MB
darkon/ubuntu-tmp-file         latest    e5687d68e9ca   30 minutes ago       63.1MB
ubuntu                         18.04     39a8cfeef173   2 weeks ago          63.1MB
nginx                          latest    08b152afcfae   2 weeks ago          133MB
hello-world                    latest    d1165f221234   5 months ago         13.3kB
```

### Задание со *

Сравнение вывода команд


исследование контейнера:
```
darkon@darkonVM:~/DarkonGH_microservices (docker-2)$ docker inspect 4babfbfd5179
[
    {
        "Id": "4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4",
        "Created": "2021-08-11T07:18:54.9688137Z",
        "Path": "/bin/bash",
        "Args": [],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 3861,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2021-08-11T15:30:35.1039852Z",
            "FinishedAt": "2021-08-11T18:23:28.5649347+03:00"
        },
        "Image": "sha256:39a8cfeef17302cb7ce93cefe12368560fe62ef9d517808855f7bda79a1eb697",
        "ResolvConfPath": "/var/snap/docker/common/var-lib-docker/containers/4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4/resolv.conf",
        "HostnamePath": "/var/snap/docker/common/var-lib-docker/containers/4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4/hostname",
        "HostsPath": "/var/snap/docker/common/var-lib-docker/containers/4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4/hosts",
        "LogPath": "/var/snap/docker/common/var-lib-docker/containers/4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4/4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4-json.log",
        "Name": "/cool_elgamal",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": null,
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {},
            "RestartPolicy": {
                "Name": "no",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "CapAdd": null,
            "CapDrop": null,
            "Capabilities": null,
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "ConsoleSize": [
                0,
                0
            ],
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "KernelMemory": 0,
            "KernelMemoryTCP": 0,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/snap/docker/common/var-lib-docker/overlay2/bf80d30195dc261d894a371e9672949e4044294af1bd99c99549db9a711ca045-init/diff:/var/snap/docker/common/var-lib-docker/overlay2/51024c3a7ac7b0bfc29ac22720cf818e97dc872ac7f926249c3878dc35cabcd1/diff",
                "MergedDir": "/var/snap/docker/common/var-lib-docker/overlay2/bf80d30195dc261d894a371e9672949e4044294af1bd99c99549db9a711ca045/merged",
                "UpperDir": "/var/snap/docker/common/var-lib-docker/overlay2/bf80d30195dc261d894a371e9672949e4044294af1bd99c99549db9a711ca045/diff",
                "WorkDir": "/var/snap/docker/common/var-lib-docker/overlay2/bf80d30195dc261d894a371e9672949e4044294af1bd99c99549db9a711ca045/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [],
        "Config": {
            "Hostname": "4babfbfd5179",
            "Domainname": "",
            "User": "",
            "AttachStdin": true,
            "AttachStdout": true,
            "AttachStderr": true,
            "Tty": true,
            "OpenStdin": true,
            "StdinOnce": true,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "ubuntu:18.04",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "14dc3635995c0076526dc79978f04c267aa41764b54c2bad78d9104f55667464",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {},
            "SandboxKey": "/run/snap.docker/netns/14dc3635995c",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "09a01a02e46cb3ef4be9890b9db8f86c4e6456a92d5f7787bb37871995956f3f",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "f8478e15573c5cb64f4c26283c55dce7595ff896ccc7c948d5819e79a840d0bb",
                    "EndpointID": "09a01a02e46cb3ef4be9890b9db8f86c4e6456a92d5f7787bb37871995956f3f",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
```

Исследование образа:

```
darkon@darkonVM:~/DarkonGH_microservices (docker-2)$ docker inspect a46f338a8d59
[
    {
        "Id": "sha256:a46f338a8d593c3c1a3f6d94a93e6a3f119e17965f6f02ebc61a5dd041ef4de5",
        "RepoTags": [
            "denis_petrov/ubuntu-tmp-file:latest"
        ],
        "RepoDigests": [],
        "Parent": "sha256:39a8cfeef17302cb7ce93cefe12368560fe62ef9d517808855f7bda79a1eb697",
        "Comment": "",
        "Created": "2021-08-11T15:31:45.5264088Z",
        "Container": "4babfbfd51791d8b8506a03bc386c128a208a90488ba203ff94a57d8dfa1afe4",
        "ContainerConfig": {
            "Hostname": "4babfbfd5179",
            "Domainname": "",
            "User": "",
            "AttachStdin": true,
            "AttachStdout": true,
            "AttachStderr": true,
            "Tty": true,
            "OpenStdin": true,
            "StdinOnce": true,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "ubuntu:18.04",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "DockerVersion": "19.03.13",
        "Author": "",
        "Config": {
            "Hostname": "4babfbfd5179",
            "Domainname": "",
            "User": "",
            "AttachStdin": true,
            "AttachStdout": true,
            "AttachStderr": true,
            "Tty": true,
            "OpenStdin": true,
            "StdinOnce": true,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
                "/bin/bash"
            ],
            "Image": "ubuntu:18.04",
            "Volumes": null,
            "WorkingDir": "",
            "Entrypoint": null,
            "OnBuild": null,
            "Labels": {}
        },
        "Architecture": "amd64",
        "Os": "linux",
        "Size": 63137505,
        "VirtualSize": 63137505,
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/snap/docker/common/var-lib-docker/overlay2/51024c3a7ac7b0bfc29ac22720cf818e97dc872ac7f926249c3878dc35cabcd1/diff",
                "MergedDir": "/var/snap/docker/common/var-lib-docker/overlay2/955a9dbbf53a4c00a53e48ab5571e57e26ebfaaceebd8c435b4f5f726eaa6214/merged",
                "UpperDir": "/var/snap/docker/common/var-lib-docker/overlay2/955a9dbbf53a4c00a53e48ab5571e57e26ebfaaceebd8c435b4f5f726eaa6214/diff",
                "WorkDir": "/var/snap/docker/common/var-lib-docker/overlay2/955a9dbbf53a4c00a53e48ab5571e57e26ebfaaceebd8c435b4f5f726eaa6214/work"
            },
            "Name": "overlay2"
        },
        "RootFS": {
            "Type": "layers",
            "Layers": [
                "sha256:21639b09744fc39b4e1fe31c79cdf54470afe4d7239a517c4060bd181f8e3039",
                "sha256:db593922fe3891bd3de6db4b7fc8f9eb7eea34dffdcbc1506f3b867ac9a2786a"
            ]
        },
        "Metadata": {
            "LastTagTime": "2021-08-11T18:31:45.7060852+03:00"
        }
    }
]
```

Отличие контейнера от образа состоит в том:
1. Контейнер это экземпляр образа
2. Контейнер содержит верхний слой доступный для записи. Образ содержит слои только для чтения.

На основе контейнера можно создать образ, в который сохранится текущее состояние контейнера. Таким образом создастся еще слой контейнера поверх исходного образа, тоже неизменный.


### Docker rm & rmi

```bash
docker rm $(docker ps -a -q) # удалит все незапущенные контейнеры

docker rmi $(docker images -q) # удалит все образы
```

### Docker machine

Создание машины:
```
docker-machine create <имя>
```

После создания хоста и установки на нем Docker engine, работать с удаленным Docker'ом можно с помощью команды:

```bash
eval $(docker-machine env <имя>)
```

Эта же команда переключается между разными машинами.

Переключение на локальный докер:
```bash
eval $(docker-machine env --unset)
```

Удаление:
```bash
docker-machine rm <имя>
```

Все докер команды, которые запускаются в той же консоли после *eval $(docker-machine env <имя>)*
работают с удаленным докер демоном на удаленном хосте.



### Сборка образа

```bash
docker build -t reddit:latest .

Sending build context to Docker daemon  7.168kB
Step 1/11 : FROM ubuntu:18.04
18.04: Pulling from library/ubuntu
...
Successfully built cf13a1774b12
Successfully tagged reddit:latest
```

запуск контейнера

``` bash
docker run --name reddit -d --network=host reddit:latest
```

### Работа с Docker HUB

Загрузка образа в Docker HUB

```bash
$ docker push darkonone/otus-reddit:1.0
The push refers to repository [docker.io/darkonone/otus-reddit]
e4e048ed563c: Pushed
ca46dc0c7cc6: Pushed
a1e25ca5487f: Pushed
55824a4df2ed: Pushed
5014ab8f2ab2: Pushed
2f7fcadaa4f7: Pushed
7564b35fe995: Pushed
21639b09744f: Mounted from library/ubuntu
1.0: digest: sha256:a35f39922e33bf594c43b7ab5732012fc4bfe730259a0db81122a776616ab5ad size: 1991
```

Локальный запуск Docker образа из репозитория Docker HUB

```bash
docker run --name reddit -d -p 9292:9292 darkonone/otus-reddit:1.0
Unable to find image 'darkonone/otus-reddit:1.0' locally
1.0: Pulling from darkonone/otus-reddit
feac53061382: Pull complete
e614e9592234: Pull complete
43740465f8e3: Pull complete
d6a26cbe8d16: Pull complete
fc3432e6193e: Pull complete
ecba7f6a0969: Pull complete
58926aaea70a: Pull complete
2148dec6cd50: Pull complete
Digest: sha256:a35f39922e33bf594c43b7ab5732012fc4bfe730259a0db81122a776616ab5ad
Status: Downloaded newer image for darkonone/otus-reddit:1.0
a59244d4da5bcd39ced8093f72958cf5add03e809e035a6f656344a7097c59c1

darkon@darkonVM:~/DarkonGH_microservices/docker-monolith (docker-2)$ docker ps
CONTAINER ID   IMAGE                       COMMAND       CREATED          STATUS          PORTS                                       NAMES
a59244d4da5b   darkonone/otus-reddit:1.0   "/start.sh"   27 minutes ago   Up 27 minutes   0.0.0.0:9292->9292/tcp, :::9292->9292/tcp   reddit
darkon@darkonVM:~/DarkonGH_microservices/docker-monolith (docker-2)$
```

## Домашнее задание №17 Docker образы. Микросервисы

### Разделение приложения на микросервисы и создание докер образов

*14 ДЗ: Разбиение приложения на несколько микросервисов. Выбор базового образа. Подключение volume к контейнеру.*

```
docker build -t darkonone/post:1.0 ./post-py
docker build -t darkonone/comment:1.0 ./comment/
docker build -t darkonone/ui:1.0 ./ui/
```

Создание bridge-сети reddit.
Запуск докер контейнеров с микросервисами и mongodb. Добавление сетевых алиасов контейнерам.

```shell
docker network create reddit

docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db mongo:latest

docker run -d --network=reddit --network-alias=post darkonone/post:1.0

docker run -d --network=reddit --network-alias=comment darkonone/comment:1.0

docker run -d --network=reddit -p 9292:9292 darkonone/ui:1.0
```

Проверка `http://62.84.118.223:9292/`

### Задание со * - изменение сетевых алиасов

Для взаимодействия через другие сетевые алиасы, перекроем запеченые переменные окружения в образе, через явное указание переменных в строке запуска контейнера:

```shell
docker run -d --network=reddit --network-alias=post_db_new --network-alias=comment_db_new mongo:latest
docker run -d --network=reddit --network-alias=post_new -e POST_DATABASE_HOST='post_db_new' darkonone/post:1.0
docker run -d --network=reddit --network-alias=comment_new -e COMMENT_DATABASE_HOST='comment_db_new' darkonone/comment:1.0
docker run -d --network=reddit -e POST_SERVICE_HOST='post_new' -e COMMENT_SERVICE_HOST='comment_new' -p 9292:9292 darkonone/ui:1.0
```
Сервис работает.


Образы:
```shell
docker images
REPOSITORY          TAG             IMAGE ID       CREATED             SIZE
darkonone/comment   1.0             9a1084ce356c   22 minutes ago      769MB
darkonone/post      1.0             b3729dc31fdf   23 minutes ago      62.1MB
darkonone/ui        1.0             4a34cae972c9   About an hour ago   771MB
mongo               latest          ccf4b4ee3bee   3 days ago          685MB
python              3.6.14-alpine   a3c0c6f5214d   3 weeks ago         40.8MB
ruby                2.2             6c8e6f9667b2   3 years ago         715MB
```

Сборка нового образа ui на основе образа ubuntu 16.04

```shell
docker build -t darkonone/ui:2.0 ./ui/

$ docker images
REPOSITORY          TAG             IMAGE ID       CREATED             SIZE
darkonone/ui        2.0             8b290d498ad6   33 seconds ago      462MB
darkonone/comment   1.0             9a1084ce356c   30 minutes ago      769MB
darkonone/post      1.0             b3729dc31fdf   30 minutes ago      62.1MB
darkonone/ui        1.0             4a34cae972c9   About an hour ago   771MB
mongo               latest          ccf4b4ee3bee   3 days ago          685MB
ubuntu              16.04           b6f507652425   3 weeks ago         135MB
python              3.6.14-alpine   a3c0c6f5214d   3 weeks ago         40.8MB
ruby                2.2             6c8e6f9667b2   3 years ago         715MB
```

### Задание со * уменьшение размера образа

Используем образы Alpine Linux для уменьшения размера.
Результат уменьшения размера образов:

```shell
$ docker images
REPOSITORY          TAG             IMAGE ID       CREATED              SIZE
darkonone/ui        3.0             4272d58ca915   About a minute ago   135MB
darkonone/comment   2.0             f344e643ecb8   2 minutes ago        132MB
darkonone/ui        2.0             8b290d498ad6   35 minutes ago       462MB
darkonone/comment   1.0             9a1084ce356c   About an hour ago    769MB
darkonone/post      1.0             b3729dc31fdf   About an hour ago    62.1MB
darkonone/ui        1.0             4a34cae972c9   2 hours ago          771MB
mongo               latest          ccf4b4ee3bee   3 days ago           685MB
ubuntu              16.04           b6f507652425   3 weeks ago          135MB
python              3.6.14-alpine   a3c0c6f5214d   3 weeks ago          40.8MB
ruby                2.3-alpine      a8309e0a481a   2 years ago          96.3MB
ruby                2.2             6c8e6f9667b2   3 years ago          715MB
```

###  Создание Volume

```shell
docker volume create reddit_db
```

```shell
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post darkonone/post:1.0
docker run -d --network=reddit --network-alias=comment darkonone/comment:2.0
docker run -d --network=reddit -p 9292:9292 darkonone/ui:3.0
```

Проверка `http://62.84.118.223:9292/`
Удаление контейнеров *docker kill $(docker ps -q)*

Запуск контейнеров повторно. После запуска контейнера из образа, сохранился написанный в предыдущий раз пост в приложении.


## Домашнее задание №18 Сетевое взаимодействие Docker контейнеров. Docker Compose. Тестирование образов

*15 ДЗ: Практика работы с основными типами Docker сетей. Декларативное описание Docker инфраструктуры при помощи Docker Compose.*

### Docker-Compose

Создадим docker-compose.yml файл проекта.
Запуск проекта

```
 docker-compose up -d
Creating network "src_reddit" with the default driver
Creating volume "src_post_db" with default driver
Pulling post_db (mongo:3.2)...
3.2: Pulling from library/mongo
a92a4af0fb9c: Pull complete
74a2c7f3849e: Pull complete
927b52ab29bb: Pull complete
e941def14025: Pull complete
be6fce289e32: Pull complete
f6d82baac946: Pull complete
7c1a640b9ded: Pull complete
e8b2fc34c941: Pull complete
1fd822faa46a: Pull complete
61ba5f01559c: Pull complete
db344da27f9a: Pull complete
Digest: sha256:0463a91d8eff189747348c154507afc7aba045baa40e8d58d8a4c798e71001f3
Status: Downloaded newer image for mongo:3.2
Creating src_ui_1      ... done
Creating src_post_1    ... done
Creating src_comment_1 ... done
Creating src_post_db_1 ... done
```

 Просмотр запущенных контейнеров:
```
docker-compose ps
    Name                  Command             State                    Ports
----------------------------------------------------------------------------------------------
src_comment_1   puma                          Up
src_post_1      python3 post_app.py           Up
src_post_db_1   docker-entrypoint.sh mongod   Up      27017/tcp
src_ui_1        puma                          Up      0.0.0.0:9292->9292/tcp,:::9292->9292/tcp
```

Проверка работоспособности `http://62.84.118.223:9292/`
Все ОК!

### Параметризация сетей в Docker-Compose

Для параметризации docker-compose.yml на лету используем файл `.env`  с переменными.

Для параметризации имени проекта используется встроенная переменная `COMPOSE_PROJECT_NAME`, которую необходимо задать в `.env`  файле, иначе используется название каталога проекта.

### Задание со *

Запуск проекта в дебаг режиме для разработчиков с произвольными точками монтирования приложения в HOST систему:
```
docker-compose -f docker-compose.override.yml up -d
```

Запуск проекта в обычном режиме
```
docker-compose -f docker-compose.yml up -d
```

Если в каталоге проекта присутствует файл docker-compose.**override**.yml, то при выполнении команды `docker-compose up -d` он объединяется с конфигурацией описанной в docker-compose.yml. Детальное описание в документации `https://docs.docker.com/compose/extends/`

## Домашнее задание №20 Устройство Gitlab CI. Построение процесса непрерывной интеграции

*16 ДЗ: Gitlab CI. Построение процесса непрерывной интеграции*

### Установка

##  Установка VM при помощи yandex cli и установка Docker-Machine

Подготовим VM в облаке Yandex - используем *yc*.

```shell
yc compute instance create \
  --name gitlab-ci-vm \
  --zone ru-central1-a \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1804-lts,size=50 \
  --ssh-key ~/.ssh/id_rsa.pub \
  --cores 2 \
  --core-fraction 100 \
  --memory 8G
```

Установим на нее Docker-machine.

```shell
docker-machine -D create \
--driver generic \
--generic-ip-address=62.84.117.213 \
--generic-ssh-user yc-user \
--generic-ssh-key ~/.ssh/id_rsa \
docker-gitlab-ci-vm
```

Подключимся к удаленному Docker-machine:

```shell
eval $(docker-machine env docker-gitlab-ci-vm)
```

### Автоматизация развёртывания GitLab

Для автоматизации развертывания GitLab подготовим конфигурационные файлы Packer и Terraform, а также напишем плейбуки Ansible.
Как и ранее будем генерить динамическое инвентори на основе вывода команды terraform state pull.

1. Подготовим образ с предустановленныи Docker и python3, провижионинг осуществим при помощи плейбука playbooks/packer_docker-host.yml
Запуску команды выполняем из каталога ~/DarkonGH_microservices/docker-monolith/infra

```
packer build -var-file=packer/variables.json packer/docker.json
```
2. Полученный Id образа внесем в файл переменных terraform.tfvars и выполним  terraform apply из каталога ~/DarkonGH_microservices/docker-monolith/infra/terraform.  Output переменная после создания VM docker-host-0 будет использоваться в динамическом инвентори.
3. Для работы динамического инвентори, в конфигурационный файл *env_tf_state.env* внесем абсолютный путь до каталога с конфигурацией terraform:
```
/home/darkon/DarkonGH_microservices/docker-monolith/infra/terraform
```
4. Запустим плейбук разворачивания GitLab-ci и  gitlab-runner в контейнерах из каталога /home/darkon/DarkonGH_microservices/docker-monolith/infra/ansible. Команда
```
ansible-playbook playbooks/docker_gitlab.yml
```

5. Подключимся по ssh к VM docker-host-0
```
ssh ubuntu@62.84.116.138
```
для того чтобы узнать root пароль GitLab-ci в каталоге /srv/gitlab/config просмотрим файл initial_root_password

```
ubuntu@fhmejmsfo9uvikc0n52d:/srv/gitlab/config$ sudo cat initial_root_password
# WARNING: This value is valid only in the following conditions
#          1. If provided manually (either via `GITLAB_ROOT_PASSWORD` environment variable or via `gitlab_rails['initial_root_password']` setting in `gitlab.rb`, it was provided before database was seeded for the first time (usually, the first reconfigure run).
#          2. Password hasn't been changed manually, either via UI or via command line.
#
#          If the password shown here doesn't work, you must reset the admin password following https://docs.gitlab.com/ee/security/reset_user_password.html#reset-your-root-password.

Password: WDYiLCbCtxdHTgu2vzY0Z6HOcKxgs+KdnAF6gmfppSg=

# NOTE: This file will be automatically deleted in the first reconfigure run after 24 hours.
```

теперь можно открыть UI Gitlab-ci `http://62.84.116.138/` и авторизоваться с приведенным в конфиге паролем для пользователя root.
После авторизации рекомендуется изменить пароль и отключить авторегистрацию пользователей.

6. Регистрация gitlab-runner
```
docker exec -it gitlab-runner gitlab-runner register --url http://10.128.0.12/ --registration-token v1ZfpQ634YgCGLqiE_6L --non-interactive --locked=false --name DockerRunner --executor docker --docker-image alpine:latest --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --tag-list "linux,xenial,ubuntu,docker" --run-untagged
```
Обязательным параметром является проброс сокета к Докеру на Vm для корректного функционирования Docker in Docker. Иначе он не сможет собирать образы в докере и будут ошибки в пайплайне.

```
$ docker build . -t reddit_app:$CI_COMMIT_REF_NAME
error during connect: Post http://docker:2375/v1.40/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=Dockerfile&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&session=oz9gqpn35d8uaugmyvcd5mb49&shmsize=0&t=reddit_app%3Agitlab-ci-1&target=&ulimits=null&version=1: dial tcp: lookup docker on 10.128.0.12:53: no such host
ERROR: Job failed: exit code 1
```



### Задание со * -  Запуск reddit в контейнере

docker exec -it gitlab-runner gitlab-runner register --url http://10.128.0.34/ --registration-token fpfrr4rTx8VsNBW8QEQF --non-interactive --locked=false --name DockerRunner --executor docker --docker-image alpine:latest --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" --tag-list "linux,xenial,ubuntu,docker" --run-untagged


root@docker-gitlab-ci-vm:/# docker images
REPOSITORY                                                          TAG               IMAGE ID       CREATED          SIZE
reddit_app                                                          gitlab-ci-1       d63b0b342423   29 minutes ago   653MB


 docker run -id -p 9292:9292 reddit_app:gitlab-ci-1

 ```
docker logs ab51a3455d19448172b12ade4030a2f2e3c483667e74929ee9415c404d5502d0
about to fork child process, waiting until server is ready for connections.
forked process: 9
child process started successfully, parent exiting
Puma starting in single mode...
* Puma version: 5.5.0 (ruby 2.5.1-p57) ("Zawgyi")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 32
/reddit/helpers.rb:4: warning: redefining `object_id' may cause serious problems
* Listening on http://0.0.0.0:9292
Use Ctrl-C to stop

 ```


### Настройка оповещений в Slack

Для настройки необходимо сгенерировать url для webhook в Slack
https://docs.gitlab.com/ee/user/project/integrations/slack.html

НА https://devops-team-otus.slack.com/apps/new/A0F7XDUAZ-incoming-webhooks выбираем интересующий канал и генерим url


https://hooks.slack.com/services/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
