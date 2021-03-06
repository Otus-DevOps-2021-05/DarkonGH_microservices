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

###  Установка VM при помощи yandex cli и установка Docker-Machine

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

### Автоматизация развёртывания GitLab и Gitlab-runner

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
4. Запустим плейбук разворачивания GitLab-ci и gitlab-runner в контейнерах из каталога /home/darkon/DarkonGH_microservices/docker-monolith/infra/ansible. Команда
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


### Задание со * -  Деплой и запуск reddit app в контейнере



Для деплоя приложения в пайплайне доработаем джобу branch review и напишем docker-compose.yml для управления нашим приложением.

```
branch review:
  stage: review
  image: tmaier/docker-compose:latest
  script:
    - echo "Deploy to $CI_ENVIRONMENT_SLUG"
    - cd reddit
    - docker-compose down
    - docker-compose up -d
  environment:
    name: branch/$CI_COMMIT_REF_NAME
    url: http://62.84.116.138:9292
  only:
    - branches
  except:
    - master
```


Список контейнеров:
```
ubuntu@fhmejmsfo9uvikc0n52d:~$ docker ps -a
CONTAINER ID   IMAGE                         COMMAND                  CREATED         STATUS                 PORTS                                                            NAMES
19d65045b36f   reddit_app:gitlab-ci-1        "/reddit/start.sh"       3 minutes ago   Up 3 minutes           0.0.0.0:9292->9292/tcp, :::9292->9292/tcp                        reddit_reddit_app_1
a49674bae9b0   gitlab/gitlab-runner:latest   "/usr/bin/dumb-init …"   3 hours ago     Up 3 hours                                                                              gitlab-runner
4d771ece4417   gitlab/gitlab-ce:latest       "/assets/wrapper"        3 hours ago     Up 3 hours (healthy)   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp, 0.0.0.0:2222->22/tcp   gitlab
```

 ```
ubuntu@fhmejmsfo9uvikc0n52d:~$ docker logs 19d65045b36f
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
0.0.0.0 - - [01/Oct/2021:23:18:57 +0000] "GET / HTTP/1.1" 200 1861 0.0285
0.0.0.0 - - [01/Oct/2021:23:19:32 +0000] "GET / HTTP/1.1" 200 1861 0.0192
 ```

### Автоматизация развёртывания GitLab Runner

Плейбук развертывания GitLab Runner

```
/DarkonGH_microservices/gitlab-ci/docker_gitlab.yml
```


### Настройка оповещений в Slack

Для настройки необходимо сгенерировать url для webhook в Slack, описание настройки:
https://docs.gitlab.com/ee/user/project/integrations/slack.html

На страничке https://devops-team-otus.slack.com/apps/new/A0F7XDUAZ-incoming-webhooks выбираем интересующий канал и генерим url

Добавляем ссылку `https://hooks.slack.com/services/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` в Setting\Integration Settings\Slack notifications\Webhook


## Домашнее задание №22 Введение в мониторинг. Модели и принципы работы систем мониторинга

*17 ДЗ: Создание и запуск системы мониторинга Prometheus.*


Соберем Docker образ prometheus:
```
$ export USER_NAME=darkonone
$ docker build -t $USER_NAME/prometheus .
```

В файле docker/.env установить теги сервисов post, comment, ui - latest.


Соберем images микросервисов из директории каждого микросервиса:
```
/src/ui $ bash docker_build.sh
/src/post-py $ bash docker_build.sh
/src/comment $ bash docker_build.sh
```

Внесем в docker-compose.yml aliases для сетей микросервисов.

для mongodb:
```yaml
    networks:
      back_net:
        aliases:
          - post_db
          - comment_db
```

для post:
```yaml
    networks:
      back_net:
        aliases:
          - post
      front_net:
        aliases:
          - post
```

для comment:
```yaml
    networks:
      back_net:
        aliases:
          - comment
      front_net:
        aliases:
          - comment
```

запустим микросервисы в каталоге
`/home/darkon/DarkonGH_microservices/docker/` командой docker-compose  -f docker-compose.yml up -d

```
darkon@darkonVM:~/DarkonGH_microservices/docker (monitoring-1)$ docker-compose ps
              Name                            Command               State                    Ports
--------------------------------------------------------------------------------------------------------------------
dockermicroservices_comment_1      puma                             Up
dockermicroservices_post_1         python3 post_app.py              Up
dockermicroservices_post_db_1      docker-entrypoint.sh mongod      Up      27017/tcp
dockermicroservices_prometheus_1   /bin/prometheus --config.f ...   Up      0.0.0.0:9090->9090/tcp,:::9090->9090/tcp
dockermicroservices_ui_1           puma                             Up      0.0.0.0:9292->9292/tcp,:::9292->9292/tcp
```

после запуска приложения оно работает и доступно по адресу `http://62.84.118.20:9292`

### Мониторинг состояния микросервисов

web ui Prometheus доступен на `http://62.84.118.20:9090`

Работоспособность endpoint-ов отображается в меню **Status\targets**

Состояние сервисов отображают метрики *ui_health, ui_health_post_availability, ui_health_comment_availability*.
Если значение 1 то все ОК, если 0 то взаимодействие с зависимыми сервисами нарушено.

#### Самостоятельно

При остановке микросервиса post_db метрики всех микросервисов переходят в 0, т.к. post и comment зависят от post_db, а ui зависят от post и comment.

### Сбор метрик хоста

Добавим сервис Node-exporter в docker/docker-compose.yml файл, а также настройки сети для него,
запуск *docker-compose -f docker-compose.yml up -d node-exporter*

Добавим в конфиг /home/darkon/DarkonGH_microservices/monitoring/prometheus/prometheus.yml job опроса node-exporter и пересоберем новый Docker для Prometheus:

```shell
monitoring/prometheus $ docker build -t $USER_NAME/prometheus .
```
Перезапустим сервисы:

```shell
$ docker-compose  -f docker-compose.yml down
$ docker-compose  -f docker-compose.yml up -d
```

В списке endpoint-ов Prometheus появился endpoint Node. А также возможность просматривать его метрики.

### Загрузка собранных образов на DockerHub

```shell
$ docker login
Login Succeeded

$ docker push $USER_NAME/ui
$ docker push $USER_NAME/comment
$ docker push $USER_NAME/post
$ docker push $USER_NAME/prometheus
```
Ссылка на созданные образы в Docker Hub
`https://hub.docker.com/search?q=darkonone&type=image`

Список образов:

- darkonone/ui
- darkonone/comment
- darkonone/post
- darkonone/prometheus


### Задание со *

1. Мониторинг mongodb. Для мониторинга выбран  **percona / mongodb_exporter** собранный в docker образе bitnami/mongodb-exporter:0.20.7.
   Необходимые для его работы настройки внесены в /home/darkon/DarkonGH_microservices/monitoring/prometheus/prometheus.yml

   ```yml
  - job_name: 'mongo'
    static_configs:
      - targets:
          - 'bitnami-mongodb-exporter:9216'
   ```

   А также настройки сервиса внесены в /home/darkon/DarkonGH_microservices/docker/docker-compose.yml
   ```yml
     bitnami-mongodb-exporter:
    image: bitnami/mongodb-exporter:0.20.7
    ports:
      - '9216:9216'
    networks:
      - back_net
    environment:
      MONGODB_URI: 'mongodb://post_db:27017'
    depends_on:
      - post_db
    ```

    После запуска Prometheus появился endpoint mongo и соответсвующие метрики.

2. Мониторинг сервисов comment, post, ui с помощью blackbox экспортера и Cloudprober от google
Добавим сответствующие настройки сервисов в /home/darkon/DarkonGH_microservices/docker/docker-compose.yml и /home/darkon/DarkonGH_microservices/monitoring/prometheus/prometheus.yml.

Пересоберем образ Prometheus и запустим наше приложение.
В Endpoints отобразятся новые узлы

```
blackbox (4/4 up)
Endpoint 	State 	Labels 	Last Scrape 	Error
http://blackbox-exporter:9115/probe
module="tcp_connect" module="icmp" target="comment:9292" 	up 	instance="comment:9292" 	2.53s ago
http://blackbox-exporter:9115/probe
module="tcp_connect" module="icmp" target="post:5000" 	up 	instance="post:5000" 	2.693s ago
http://blackbox-exporter:9115/probe
module="tcp_connect" module="icmp" target="post_db:27017" 	up 	instance="post_db:27017" 	1.084s ago
http://blackbox-exporter:9115/probe
module="tcp_connect" module="icmp" target="ui:9292" 	up 	instance="ui:9292" 	3.803s ago
cloudprober (1/1 up)
Endpoint 	State 	Labels 	Last Scrape 	Error
http://cloudprober:9313/metrics
	up 	instance="cloudprober:9313" 	1.625s ago
```

Если blackbox показывает состояние конечных портов наших микросервисов.
То cloudprober собирает еще метрики sysvars, а в случае добавления cloudprober.cfg в /etc docker образа
```json
probe {
  name: "ui_homepage"
  type: HTTP
  targets {
    host_names: "ui"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
  http_probe {
    port: 9292
  }
}
probe {
  name: "post"
  type: HTTP
  targets {
    host_names: "post"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
  http_probe {
    port: 5000
  }
}
probe {
  name: "post_db"
  type: HTTP
  targets {
    host_names: "post_db"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
  http_probe {
    port: 27017
  }
}
probe {
  name: "comment"
  type: HTTP
  targets {
    host_names: "comment"
  }
  interval_msec: 5000  # 5s
  timeout_msec: 1000   # 1s
  http_probe {
    port: 9292
  }
}
```
он производит сбор метрик. Правда микросервисы comment и post на http запрос отвечают кодом 404.
```
Element 	Value
resp_code{code="200",dst="post_db",instance="cloudprober:9313",job="cloudprober",probe="post_db",ptype="http"}	28
resp_code{code="200",dst="ui",instance="cloudprober:9313",job="cloudprober",probe="ui_homepage",ptype="http"}	28
resp_code{code="404",dst="comment",instance="cloudprober:9313",job="cloudprober",probe="comment",ptype="http"}	28
resp_code{code="404",dst="post",instance="cloudprober:9313",job="cloudprober",probe="post",ptype="http"}	26
```

Примечание: Неудобство cloudprober в случае использования docker-machine, т.к. не получится пробросить cloudprober.cfg в докер образ,
и соответственно, необходимо его предварительно копировать в нужную папку на docker-host.
Сборка же Docker образа из Dockerfile не описана на https://github.com/google/cloudprober
При сборке идут ошибки. Остановился пока на варианте сохранения конфига на docker-host вручную.

3. Подготовка скрипта автоматизации Makefile
   Напишите Makefile , который в минимальном варианте умеет:
    - Билдить любой или все образы, которые сейчас используются
    - Умеет пушить их в докер хаб

## Домашнее задание №25 Применение системы логирования в инфраструктуре на основе Docker

*18 ДЗ: Логирование приложений*

### Обновление кода микросервисов

```bash
git clone -b logging git@github.com:express42/reddit.git
```

Сборка образов
```shell
$ export USER_NAME=darkonone
$ cd ./src/ui && bash docker_build.sh && docker push $USER_NAME/ui:logging
$ cd ../post-py && bash docker_build.sh && docker push $USER_NAME/post:logging
$ cd ../comment && bash docker_build.sh && docker push $USER_NAME/comment:logging
```

### Логирование Docker-контейнеров

Для логирование используем стек EFK.

Web-интерфейс Kibana для просмотра собранных в ElasticSearch логов Post-сервиса (Kibana слушает на порту 5601).

### Задание со * Разбор ещё одного формата логов

Для отладки GROK шаблонов в Kibana есть Dev Tools -> Grok Debugger

пример строки для разбора:
```
service=ui | event=request | path=/ | request_id=c5ed3bf4-e3f7-4fa0-9c7c-210ecd1b75e3 | remote_addr=171.25.166.221 | method= GET | response_status=200
```

Настроенный Grok pattern:
```
service=%{WORD:service} \| event=%{WORD:event} \| path=%{URIPATHPARAM:request} \| request_id=%{GREEDYDATA:request_id} \| remote_addr=%{IP:client} \| method=.%{WORD:method} \| response_status=%{NUMBER:response_status}
```
Примечание: т.к. перед GET стоит пробел то и в паттерне надо указать символ . или пробел.

Структурированные данные:
```json
{
  "request": "/",
  "method": "GET",
  "response_status": "200",
  "service": "ui",
  "client": "171.25.166.221",
  "event": "request",
  "request_id": "c5ed3bf4-e3f7-4fa0-9c7c-210ecd1b75e3"
}
```

Добивим еще один фильтр в `logging/fluentd/fluent.conf`
```
<filter service.ui>
  @type parser
  format grok
  grok_pattern service=%{WORD:service} \| event=%{WORD:event} \| path=%{URIPATHPARAM:request} \| request_id=%{GREEDYDATA:request_id} \| remote_addr=%{IP:client} \| method=.%{WORD:method} \| response_status=%{NUMBER:response_status}
  key_name message
  reserve_data true
</filter>
```

пересоберем образ `fluentd`
```
darkon@darkonVM:~/DarkonGH_microservices/logging/fluentd (logging-1)$ docker build -t $USER_NAME/fluentd .
Sending build context to Docker daemon  4.096kB
Step 1/4 : FROM fluent/fluentd:v0.12
 ---> 5ad80e121366
Step 2/4 : RUN gem install fluent-plugin-elasticsearch --no-rdoc --no-ri --version 1.9.5
 ---> Using cache
 ---> c2632b33d3ac
Step 3/4 : RUN gem install fluent-plugin-grok-parser --no-rdoc --no-ri --version 1.0.0
 ---> Using cache
 ---> b6d70f93b785
Step 4/4 : ADD fluent.conf /fluentd/etc
 ---> 963895a35510
Successfully built 963895a35510
Successfully tagged darkonone/fluentd:latest
```
и перезапустим образ
```sh
darkon@darkonVM:~/DarkonGH_microservices/docker (logging-1)$ docker-compose -f docker-compose-logging.yml up -d fluentd
WARNING: Found orphan containers (dockermicroservices_post_1, dockermicroservices_post_db_1, dockermicroservices_ui_1, dockermicroservices_blackbox-exporter_1, dockermicroservices_comment_1, dockermicroservices_bitnami-mongodb-exporter_1, dockermicroservices_prometheus_1, dockermicroservices_cloudprober_1, dockermicroservices_node-exporter_1) for this project. If you removed or renamed this service in your compose file, you can run this command with the --remove-orphans flag to clean it up.
Recreating dockermicroservices_fluentd_1 ... done
```

теперь сообщение в kibana имеет такой вид, все поля логов UI разобраны:
```json
{
  "_index": "fluentd-20211019",
  "_type": "access_log",
  "_id": "nGbQl3wBwWje_KLmLJAy",
  "_version": 1,
  "_score": null,
  "_source": {
    "timestamp": "2021-10-19T09:09:33.206184",
    "pid": "1",
    "loglevel": "INFO",
    "progname": "",
    "message": "service=ui | event=request | path=/ | request_id=7e7caf1a-54f5-47d0-ac72-95ad44fa3414 | remote_addr=191.25.166.121 | method= GET | response_status=200",
    "service": "ui",
    "event": "request",
    "request": "/",
    "request_id": "7e7caf1a-54f5-47d0-ac72-95ad44fa3414",
    "client": "191.25.166.121",
    "method": "GET",
    "response_status": "200",
    "@timestamp": "2021-10-19T09:09:33+00:00",
    "@log_name": "service.ui"
  },
  "fields": {
    "@timestamp": [
      "2021-10-19T09:09:33.000Z"
    ]
  },
  "highlight": {
    "@log_name": [
      "@kibana-highlighted-field@service.ui@/kibana-highlighted-field@"
    ]
  },
  "sort": [
    1634634573000
  ]
}
```

### Распределенный трейсинг - Траблшутинг UI-экспириенса

При работе запущенного приложения с ошибкой, наблюдается задержка в работе при проваливании в какой либо пост, голосовании за пост и написании комментария в нем. Zipkin показывает, что метод /get выполняется с задержкой 3сек и отображается название спана где эта задерка присутсвует: `db_find_single_post`. Анализ приложения post_app.py показал, что в методе `def find_post(id)` внесена задерка в 3 сек (time.sleep(3)) перед логированием и отображением постов.


## Домашнее задание №27 Введение в Kubernetes

*19 ДЗ: Установка и настройка Kubernetes*

###  Подготовка VM

В соответствии с заданием необходимо 2 ВМ:
-  RAM 4
-  CPU 4
-  SSD 40 GB

### Установка k8s на VM

Установим определенные версии k8s 1.19 и версию Docker 19.03.

Установка Docker на ubuntu 18.04
```sh
sudo apt update && sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && sudo apt install -y docker-ce=5:19.03.15~3-0~ubuntu-bionic docker-ce-cli=5:19.03.15~3-0~ubuntu-bionic

```

Установка k8s на ubuntu 18.04 и фиксация версии
``` bash
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt install -y kubelet=1.19.16-00 kubeadm=1.19.16-00 kubectl=1.19.16-00
sudo apt-mark hold kubelet kubeadm kubectl
```

### Инициализация кластера

Для инициализации кластера выполним команду на первой VM:
```sh
sudo kubeadm init --apiserver-cert-extra-sans=62.84.116.101 --control-plane-endpoint=62.84.116.101 --pod-network-cidr=10.244.0.0/16
```
А для добавления в кластер второй VM ( worker ноды):
```
sudo kubeadm join 62.84.116.101:6443 --token zpux2y.zdjbz9ivdi2sgfz3 --discovery-token-ca-cert-hash sha256:19bdaa32e7c6e61416b5d973e532fc6c5d03eaf9431f5dc490e9779b8291dd30
```

Для корректном взаимодействием с  `master` нодой, должен быть конфиг в рабочем каталоге пользователя, если его нет то необходимо создать, следующими командами:
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

 ### Установка сетевого плагина

После усановки кластера необходимо выбрать сетевой плагин и установить его. Мы будем использовать [Calico](https://docs.projectcalico.org/getting-started/kubernetes/self-managed-onprem/onpremises).
Перед установкой сетевого плагина при помощи его манифеста `calico.yaml`,
необходимо изменить в нем следующее значение `CALICO_IPV4POOL_CIDR` на `10.244.0.0/16`

### Настройка взаимодействия с кластером с машины разработчика

Для взаимодействия с кластером, с рабочей машины разработчика, необходимо установить на нее `kubectl` [Инструкция по установке](https://v1-19.docs.kubernetes.io/ru/docs/tasks/tools/install-kubectl/)
и повторить шаг с конфигурацией, причем `~/.kube/config` необходимо получить с мастер ноды, т.к. в нем содержится контекст подключения, адрес мастер ноды кластера и сертификат пользователя.

Проверка конфигурации kubectl выполняется командой:
```sh
darkon@darkonVM:~ $ kubectl cluster-info
Kubernetes master is running at https://62.84.116.101:6443
KubeDNS is running at https://62.84.116.101:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

### Проверка созданных манифестов приложения reddit

Для применения манифестов воспользуемся командой:

```
kubectl apply -f kubernetes/reddit/post-deployment.yml
```
После этого создаться `pod` с приложением `post`. По аналогии напишем манифесты для `comment`, `mongodb` и `ui` сервисов reddit.
И применим их к кластеру.

Изменим в `kubernetes/reddit/post-deployment.yml` образ на свой:
```yaml
spec:
      containers:
      - image: darkonone/post:logging
        name: post
```
и перепименим данный манифест, проверим работу pod'ов, как видно старый `pod post-deployment-799c77ffb-tz2rl`  удаляется, и новый `post-deployment-d67bb5c5c-zhv82` уже запущен:

```sh
darkon@darkonVM:~ $ kubectl get pods
NAME                                  READY   STATUS              RESTARTS   AGE
comment-deployment-794c585f69-4hxbd   1/1     Running             0          2m5s
mongo-deployment-545fd54f7c-mf6w4     1/1     Running             0          29s
post-deployment-799c77ffb-tz2rl       0/1     Terminating         0          28m
post-deployment-d67bb5c5c-zhv82       1/1     Running             0          20s
ui-deployment-6f645948c-g6zbs         0/1     ContainerCreating   0          5s

darkon@darkonVM:~ $ kubectl get pods
NAME                                  READY   STATUS    RESTARTS   AGE
comment-deployment-794c585f69-4hxbd   1/1     Running   0          2m26s
mongo-deployment-545fd54f7c-mf6w4     1/1     Running   0          50s
post-deployment-d67bb5c5c-zhv82       1/1     Running   0          41s
ui-deployment-6f645948c-g6zbs         1/1     Running   0          26s
```

### Задание со ** - установка кластера k8s с помощью terraform и ansible

Манифесты terraform находятся в `kubernetes/terraform`. Создаем нужное колличество хостов при помощи переменной `count`.
Плейбук ansible в  `kubernetes/ansible`

Для удобства в работе подготовим Makefile:
```
darkon@darkonVM:~/DarkonGH_microservices/kubernetes (kubernetes-1)$ make
terraform_automation  Create   VMs      by          terraform
destroy_VMs           Destroy  VMs      by          terraform
ansible_service       ansible  service  preinstall
```

## Домашнее задание №28 Основные модели безопастности и контроллеры в Kubernetes

*20 ДЗ: Установка и настройка yandex cloud Kubernetes Engine, настройка локального профиля администратора для yandex cloud. Работа с с контроллерами: StatefulSet, Deployment, DaemonSet*

### Запуск Minikube

```
darkon@darkonVM:~ $ minikube start
😄  minikube v1.23.2 on Ubuntu 20.04
✨  Automatically selected the docker driver. Other choices: virtualbox, none, ssh
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.22.2 preload ...
    > gcr.io/k8s-minikube/kicbase: 355.39 MiB / 355.40 MiB  100.00% 5.02 MiB p/
    > preloaded-images-k8s-v13-v1...: 511.69 MiB / 511.69 MiB  100.00% 6.44 MiB
🔥  Creating docker container (CPUs=2, Memory=4000MB) ...
🐳  Preparing Kubernetes v1.22.2 on Docker 20.10.8 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass

❗  /usr/local/bin/kubectl is version 1.19.16, which may have incompatibilites with Kubernetes 1.22.2.
    ▪ Want kubectl v1.22.2? Try 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

### Взаимодействие с k8s

просмотр текущего context:
```
kubeclt config current-context
```

список всех контекстов:
```
kubectl config get-contexts
```

запуск компонента описанного манифестом в формте  yaml:
```
kubectl apply -f <манифест>
```

Просмотр запущенных компонентов и подов:
```
kubectl get deployment
```

Поиск пода по имени selector:
```
kubectl get pods --selector component=<имя>
```

Проброс порта:

```
kubectl port-forward <pod-name> 8080:9292
```

>local-port:pod-port


Просмотрел логов пода:
```
kubectl logs <имя пода>
```

### Просмотр сервисов Minikube

```
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/reddit (kubernetes-2)$ minikube service ui
|-----------|------|-------------|---------------------------|
| NAMESPACE | NAME | TARGET PORT |            URL            |
|-----------|------|-------------|---------------------------|
| default   | ui   |        9292 | http://192.168.49.2:32092 |
|-----------|------|-------------|---------------------------|
🎉  Opening service default/ui in default browser...

```

И просмотр всего списка сервисов:
```
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/reddit (kubernetes-2)$ minikube service list
|----------------------|---------------------------|--------------|---------------------------|
|      NAMESPACE       |           NAME            | TARGET PORT  |            URL            |
|----------------------|---------------------------|--------------|---------------------------|
| default              | comment                   | No node port |
| default              | comment-db                | No node port |
| default              | kubernetes                | No node port |
| default              | mongodb                   | No node port |
| default              | post                      | No node port |
| default              | post-db                   | No node port |
| default              | ui                        |         9292 | http://192.168.49.2:32092 |
| kube-system          | kube-dns                  | No node port |
| kubernetes-dashboard | dashboard-metrics-scraper | No node port |
| kubernetes-dashboard | kubernetes-dashboard      | No node port |
|----------------------|---------------------------|--------------|---------------------------|
```

Просмотр всех объектов в неймспейсе:
```sh
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/reddit (kubernetes-2)$ kubectl  get all -n default
NAME                           READY   STATUS    RESTARTS   AGE
pod/comment-84fcb854fd-8ztnb   1/1     Running   0          20h
pod/comment-84fcb854fd-c5gmg   1/1     Running   0          20h
pod/comment-84fcb854fd-fk42n   1/1     Running   0          20h
pod/mongo-7cc44965cd-pk9z7     1/1     Running   0          20h
pod/post-6fdf668988-8mh5l      1/1     Running   0          20h
pod/post-6fdf668988-bdwdb      1/1     Running   0          20h
pod/post-6fdf668988-h4g5p      1/1     Running   0          20h
pod/ui-6d94b8844d-42lld        1/1     Running   0          5d8h
pod/ui-6d94b8844d-8hbnx        1/1     Running   0          5d8h
pod/ui-6d94b8844d-dft9n        1/1     Running   0          5d8h

NAME                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
service/comment      ClusterIP   10.110.44.87     <none>        9292/TCP         5d7h
service/comment-db   ClusterIP   10.104.253.168   <none>        27017/TCP        20h
service/kubernetes   ClusterIP   10.96.0.1        <none>        443/TCP          5d9h
service/mongodb      ClusterIP   10.111.73.81     <none>        27017/TCP        19h
service/post         ClusterIP   10.99.140.164    <none>        5000/TCP         20h
service/post-db      ClusterIP   10.106.141.185   <none>        27017/TCP        20h
service/ui           NodePort    10.107.172.119   <none>        9292:32092/TCP   19h

NAME                      READY   UP-TO-DATE   AVAILABLE   AGE
deployment.apps/comment   3/3     3            3           5d7h
deployment.apps/mongo     1/1     1            1           5d7h
deployment.apps/post      3/3     3            3           5d7h
deployment.apps/ui        3/3     3            3           5d8h

NAME                                 DESIRED   CURRENT   READY   AGE
replicaset.apps/comment-5dd47fd8d8   0         0         0       5d7h
replicaset.apps/comment-84fcb854fd   3         3         3       20h
replicaset.apps/mongo-77d8cfd6d6     0         0         0       5d7h
replicaset.apps/mongo-7cc44965cd     1         1         1       20h
replicaset.apps/post-6f64674b8b      0         0         0       5d7h
replicaset.apps/post-6fdf668988      3         3         3       20h
replicaset.apps/ui-6d94b8844d        3         3         3       5d8h
```

### Открытие minikube dashboard

```
darkon@darkonVM:~/DarkonGH_microservices (kubernetes-2)$ minikube dashboard --url
🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
http://127.0.0.1:33517/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/
```

### Развертывание Kubernetes в Yandex Cloud

- Имя кластера может быть произвольным  - *k8s-test-cluster*
- Если нет сервис аккаунта его можно создать
- Релизный канал *** Rapid ***
- Версия k8s 1.19
- Зона доступности - на ваше усмотрение (сети - аналогично)

#### Создание группы узлов

- Версия k8s 1.19
- Количество узлов - 2
- vCPU - 4
- RAM - 8
- Disk - SSD -64ГБ(минимальное значение)
- В поле Доступ добавьте свой логин и публичный ssh ключ


Подключение к k8s
```
yc managed-kubernetes cluster get-credentials k8s-test-cluster --external
```

Запустим наше приложение в K8s. Создадим dev namespace:
```
kubectl apply -f ./kubernetes/reddit/dev-namespace.yml
```

Задеплоим все компоненты приложения в namespace dev:
```
kubectl apply -f ./kubernetes/reddit/ -n dev
```


После деплоя приложения в k8s список подов отображается в web ui YC:
![image 1](images/k8s-yc.png)

Адрес web ui http://51.250.1.79:32091


### Задание со * - Развертывание Kubernetes-кластера в Yandex cloud с помощью Terraform модуля

#### Развертывание Kubernetes-кластера в Yandex cloud с помощью Terraform модуля

Манифест Terraform для развертывания `Managed Service for Kubernetes` находится в каталоге `kubernetes/terraform_k8s`, за основу взята [документация](https://cloud.yandex.ru/docs/managed-kubernetes/operations/kubernetes-cluster/kubernetes-cluster-create)

- `cluster.tf` - манифест стоздания кластера
- `node_group.tf` - манифест создания группы виртуальных машин
- `vpc.tf` - манифест создания подсети k8s Cluster
- `iam_sa.tf` - манифест для создания сервисного аккаунта для k8s Cluster


Добавление context для YC:
>yc managed-kubernetes cluster get-credentials my-cluster --external

#### Создание YAML-манифеста для описания созданных сущностей для включения dashboard

Деплой дашборда
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
namespace/kubernetes-dashboard created
serviceaccount/kubernetes-dashboard created
service/kubernetes-dashboard created
secret/kubernetes-dashboard-certs created
secret/kubernetes-dashboard-csrf created
secret/kubernetes-dashboard-key-holder created
configmap/kubernetes-dashboard-settings created
role.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard created
rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
deployment.apps/kubernetes-dashboard created
service/dashboard-metrics-scraper created
deployment.apps/dashboard-metrics-scraper created
```

Создание Service Account с именем admin-user в namespace `kubernetes-dashboard`, файл `kubernetes/dashboard/dashboard-adminuser.yaml`

```
kubectl apply -f dashboard-adminuser.yaml
```

Создание ClusterRoleBinding для ServiceAccount, файл  `kubernetes/dashboard/ClusterRoleBinding.yml`

```
kubectl apply -f ClusterRoleBinding.yml
```

Получение токена командой:
```
kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
```

Запуск  доступа к Дашборду:
```
kubectl proxy
```

Подключение к Дашборду по ссылке с помощью токена:
`http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/.`

Пример работы Дашборда

![image 2](images/dashboard.png)


Удаление созданных ролей, при необходимости:

>Удаление admin ServiceAccount и ClusterRoleBinding.

>kubectl -n kubernetes-dashboard delete serviceaccount admin-user
>kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user


## Домашнее задание №29 Ingress-контроллеры и сервисы в Kubernetes

*21 ДЗ: Настройка балансировщиков нагрузки в Kubernetes и SSL­Terminating.*

### Ingress

Установка:
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.34.1/deploy/static/provider/cloud/deploy.yaml
```

добавляем сервис для ui:
```
kubectl apply -f ui-ingress.yml -n dev
```

просмотр сервисов:
```
kubectl get ingress -n dev
Warning: extensions/v1beta1 Ingress is deprecated in v1.14+, unavailable in v1.22+; use networking.k8s.io/v1 Ingress
NAME   CLASS    HOSTS   ADDRESS       PORTS     AGE
ui     <none>   *       51.250.9.31   80, 443   47h
```

### Создание сертификата

Проверка IngressIP

```
kubectl get ingress -n dev

NAME   CLASS    HOSTS   ADDRESS       PORTS   AGE
ui     <none>   *       51.250.9.31   80      25h
```

Генерация сертификата:
```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=51.250.9.31"
Generating a RSA private key
........................+++++
...................................................................................................+++++
writing new private key to 'tls.key'
-----
```

Загрузка и проверка сертификата в кластере:
```
kubectl create secret tls ui-ingress --key tls.key --cert tls.crt -n dev
secret/ui-ingress created

kubectl describe secret ui-ingress -n dev
Name:         ui-ingress
Namespace:    dev
Labels:       <none>
Annotations:  <none>

Type:  kubernetes.io/tls

Data
====
tls.crt:  1119 bytes
tls.key:  1704 bytes
```

Проверяем `url`:
- `http://51.250.9.31`
- `https://51.250.9.31`
Оба работают.

### Задание со * - создаваемый объект Secret в виде Kubernetes-манифеста

пример файла Secret: `kubernetes/reddit/secret.yml.example`
и ui-Ingress `kubernetes/reddit/ui-ingress.yml`

### Network Policy

Применение политики:
```
kubectl apply -f mongo-network-policy.yml -n dev
```

### PersistentVolume

создание диска:
```
yc compute disk create --name k8s --size 4 --description "disk for k8s"
done (4s)
id: fhm5plumsj4b1n98uva2
folder_id: b1g2rfg46c9gmfqqhh6g
created_at: "2021-11-14T21:25:45Z"
name: k8s
description: disk for k8s
type_id: network-hdd
zone_id: ru-central1-a
size: "4294967296"
block_size: "4096"
status: READY
disk_placement_policy: {}
```

Важно:
- размеры Persistent Volume и Persistent Volume Claims должны или совпадать или PVC должен быть меньше PV
- Имя в pvc ( volumeName: mongo-pv) должно совпадать с именем pv


## Домашнее задание №30 Интеграция Kubernetes в GitlabCI

*22 ДЗ: Создание Helm Chart’ов для компонент приложения, управление зависимостями Helm.*

### Установка Helm

Используем версию Helm 2.17.0

Деплой ClusterRoleBinding
применим манифест:
>kubectl create -f tiller-clusterrolebinding.yml

Деплой tillet или upgrade:
>helm init --service-account tiller --upgrade

При необходимости удаление деплоя Tiller:
>kubectl delete deploy tiller-deploy -n kube-system

### Charts and Templates

Деплой Chart'а:
```
NAME:   test-ui-1
LAST DEPLOYED: Wed Nov 17 23:56:51 2021
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME  READY  UP-TO-DATE  AVAILABLE  AGE
ui    0/3    3           0          0s

==> v1/Pod(related)
NAME                 READY  STATUS             RESTARTS  AGE
ui-769b895f56-85rgs  0/1    ContainerCreating  0         0s
ui-769b895f56-ph9pg  0/1    ContainerCreating  0         0s
ui-769b895f56-vtdcg  0/1    ContainerCreating  0         0s

==> v1/Service
NAME  TYPE      CLUSTER-IP     EXTERNAL-IP  PORT(S)         AGE
ui    NodePort  10.96.226.104  <none>       9292:32753/TCP  0s

==> v1beta1/Ingress
NAME  CLASS   HOSTS  ADDRESS  PORTS  AGE
ui    <none>  *      80, 443  0s
```

```
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/Charts (kubernetes-4)$ helm  ls
NAME            REVISION        UPDATED                         STATUS          CHART           APP VERSION     NAMESPACE
test-ui-1       1               Wed Nov 17 23:56:51 2021        DEPLOYED        ui-1.0.0        1               default
```

Создадим параметризованные чарты нашего приложения:
```
.
├── comment
│   ├── Chart.yaml
│   ├── templates
│   │   ├── deployment.yaml
│   │   ├── _helpers.tpl
│   │   └── service.yaml
│   └── values.yaml
├── post
│   ├── Chart.yaml
│   ├── templates
│   │   ├── deployment.yaml
│   │   ├── _helpers.tpl
│   │   └── service.yaml
│   └── values.yaml
├── reddit
│   ├── charts
│   │   ├── comment-1.0.0.tgz
│   │   ├── mongodb-7.8.10.tgz
│   │   ├── post-1.0.0.tgz
│   │   └── ui-1.0.0.tgz
│   ├── Chart.yaml
│   ├── requirements.lock
│   ├── requirements.yaml
│   └── values.yaml
└── ui
    ├── Chart.yaml
    ├── templates
    │   ├── deployment.yaml
    │   ├── _helpers.tpl
    │   ├── ingress.yaml
    │   └── service.yaml
    └── values.yaml

8 directories, 24 files
```

Обновление зависимостей чарта
>helm dep update ./reddit

Установка приложения:

```
kubectl create ns dev

helm upgrade --install --namespace=dev --wait reddit-release ./reddit

Release "reddit-release" does not exist. Installing it now.
W1122 01:26:10.229890  585550 warnings.go:70] extensions/v1beta1 Ingress is deprecated in v1.14+, unavailable in v1.22+; use networking.k8s.io/v1 Ingress
W1122 01:26:10.551324  585550 warnings.go:70] extensions/v1beta1 Ingress is deprecated in v1.14+, unavailable in v1.22+; use networking.k8s.io/v1 Ingress
NAME: reddit-release
LAST DEPLOYED: Mon Nov 22 01:26:09 2021
NAMESPACE: dev
STATUS: deployed
REVISION: 1
TEST SUITE: None

darkon@darkonVM:~/DarkonGH_microservices/kubernetes/Charts (kubernetes-4)$ kubectl get ingress -n dev
Warning: extensions/v1beta1 Ingress is deprecated in v1.14+, unavailable in v1.22+; use networking.k8s.io/v1 Ingress
NAME                CLASS    HOSTS   ADDRESS        PORTS   AGE
reddit-release-ui   <none>   *       51.250.7.201   80      7m31s
```

Установка приложения (helm 2):
```
helm install reddit --name reddit
```

Обновление релиза (helm 2):
```
helm upgrade reddit ./reddit
Release "reddit-test" has been upgraded.
LAST DEPLOYED: Thu Nov 18 01:50:26 2021
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/Deployment
NAME                 READY  UP-TO-DATE  AVAILABLE  AGE
reddit-test-comment  1/1    1           1          12m
reddit-test-mongodb  1/1    1           1          12m
reddit-test-post     1/1    1           1          12m
reddit-test-ui       0/3    0           0          12m

==> v1/PersistentVolumeClaim
NAME                 STATUS  VOLUME                                    CAPACITY  ACCESS MODES  STORAGECLASS    AGE
reddit-test-mongodb  Bound   pvc-9b3bf6e3-ccbc-44d1-8b7e-7e0599ee9570  8Gi       RWO           yc-network-hdd  12m

==> v1/Pod(related)
NAME                                  READY  STATUS             RESTARTS  AGE
reddit-test-comment-6cc569547b-4vlnn  1/1    Running            0         12m
reddit-test-comment-df498569c-pms4q   0/1    ContainerCreating  0         0s
reddit-test-mongodb-bb985f44d-5sp5j   1/1    Running            0         12m
reddit-test-post-698567dbc9-k76kw     1/1    Running            0         12m
reddit-test-post-6d4f7576b4-28w87     0/1    ContainerCreating  0         0s
reddit-test-ui-86f456c7c9-pqpff       1/1    Terminating        0         12m
reddit-test-ui-86f456c7c9-r7hgs       1/1    Terminating        0         12m
reddit-test-ui-86f456c7c9-zlrmw       1/1    Terminating        0         12m

==> v1/Secret
NAME                 TYPE    DATA  AGE
reddit-test-mongodb  Opaque  1     12m

==> v1/Service
NAME                 TYPE       CLUSTER-IP     EXTERNAL-IP  PORT(S)         AGE
reddit-test-comment  ClusterIP  10.96.255.120  <none>       9292/TCP        12m
reddit-test-mongodb  ClusterIP  10.96.168.138  <none>       27017/TCP       12m
reddit-test-post     ClusterIP  10.96.213.4    <none>       5000/TCP        12m
reddit-test-ui       NodePort   10.96.218.163  <none>       9292:30732/TCP  12m

==> v1beta1/Ingress
NAME            CLASS   HOSTS  ADDRESS       PORTS  AGE
reddit-test-ui  <none>  *      51.250.8.244  80     12m
```

### GitLab + Kubernetes

Установка GitLab

```bash
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/Charts (kubernetes-4)$ helm repo add gitlab https://charts.gitlab.io
"gitlab" has been added to your repositories
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/Charts (kubernetes-4)$ helm fetch gitlab/gitlab-omnibus --version 0.1.37 --untar
```

установка Chart
```
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/Charts/gitlab-omnibus (kubernetes-4)$ helm install --name gitlab . -f values.yaml
WARNING: This chart is deprecated
NAME:   gitlab
LAST DEPLOYED: Mon Nov 22 10:49:49 2021
NAMESPACE: default
STATUS: DEPLOYED

RESOURCES:
==> v1/ConfigMap
NAME                             DATA  AGE
gitlab-gitlab-config             9     1s
gitlab-gitlab-postgresql-initdb  1     1s
gitlab-gitlab-runner             2     1s
kube-lego                        2     1s
nginx                            7     1s
tcp-ports                        1     1s

==> v1/DaemonSet
NAME   DESIRED  CURRENT  READY  UP-TO-DATE  AVAILABLE  NODE SELECTOR  AGE
nginx  2        2        0      2           0          <none>         1s

==> v1/Deployment
NAME                      READY  UP-TO-DATE  AVAILABLE  AGE
default-http-backend      0/1    1           0          1s
gitlab-gitlab             0/1    1           0          1s
gitlab-gitlab-postgresql  0/1    1           0          1s
gitlab-gitlab-redis       0/1    1           0          1s
gitlab-gitlab-runner      0/1    1           0          1s
kube-lego                 0/1    1           0          1s

==> v1/Namespace
NAME           STATUS  AGE
kube-lego      Active  1s
nginx-ingress  Active  1s

==> v1/PersistentVolumeClaim
NAME                              STATUS   VOLUME              CAPACITY  ACCESS MODES  STORAGECLASS  AGE
gitlab-gitlab-config-storage      Pending  gitlab-gitlab-fast  1s
gitlab-gitlab-postgresql-storage  Pending  gitlab-gitlab-fast  1s
gitlab-gitlab-redis-storage       Pending  gitlab-gitlab-fast  1s
gitlab-gitlab-registry-storage    Pending  gitlab-gitlab-fast  1s
gitlab-gitlab-storage             Pending  gitlab-gitlab-fast  1s

==> v1/Pod(related)
NAME                                      READY  STATUS             RESTARTS  AGE
default-http-backend-7744d88f46-2qlxg     0/1    ContainerCreating  0         1s
gitlab-gitlab-549f7c684b-4xdzq            0/1    Pending            0         1s
gitlab-gitlab-postgresql-b89cb559f-2df5j  0/1    Pending            0         1s
gitlab-gitlab-redis-56bb865bb5-w5fbz      0/1    Pending            0         1s
gitlab-gitlab-runner-765bc55b5c-h6llw     1/1    Terminating        8         20m
gitlab-gitlab-runner-765bc55b5c-xjzrk     0/1    ContainerCreating  0         1s
kube-lego-5db67dfc57-rrgk4                0/1    ContainerCreating  0         1s
nginx-qkpfc                               0/1    ContainerCreating  0         1s
nginx-tpf9r                               0/1    ContainerCreating  0         1s

==> v1/Secret
NAME                   TYPE    DATA  AGE
gitlab-gitlab-runner   Opaque  2     1s
gitlab-gitlab-secrets  Opaque  3     1s

==> v1/Service
NAME                      TYPE          CLUSTER-IP     EXTERNAL-IP  PORT(S)                                            AGE
default-http-backend      ClusterIP     10.96.250.98   <none>       80/TCP                                             1s
gitlab-gitlab             ClusterIP     10.96.161.160  <none>       22/TCP,8065/TCP,8105/TCP,8005/TCP,9090/TCP,80/TCP  1s
gitlab-gitlab-postgresql  ClusterIP     10.96.207.157  <none>       5432/TCP                                           1s
gitlab-gitlab-redis       ClusterIP     10.96.176.54   <none>       6379/TCP                                           1s
nginx                     LoadBalancer  10.96.218.246  <pending>    80:32653/TCP,443:31767/TCP,22:30948/TCP            1s

==> v1/StorageClass
NAME                PROVISIONER           RECLAIMPOLICY  VOLUMEBINDINGMODE  ALLOWVOLUMEEXPANSION  AGE
gitlab-gitlab-fast  kubernetes.io/gce-pd  Delete         Immediate          false                 1s

==> v1beta1/Ingress
NAME           CLASS   HOSTS                                                                  ADDRESS  PORTS  AGE
gitlab-gitlab  <none>  gitlab-gitlab,registry.example.com,mattermost.example.com + 1 more...  80, 443  1s


NOTES:

  It may take several minutes for GitLab to reconfigure.
    You can watch the status by running `kubectl get deployment -w gitlab-gitlab --namespace default
  You did not specify a baseIP so one will be assigned for you.
  It may take a few minutes for the LoadBalancer IP to be available.
  Watch the status with: 'kubectl get svc -w --namespace nginx-ingress nginx', then:

  export SERVICE_IP=$(kubectl get svc --namespace nginx-ingress nginx -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

  Then make sure to configure DNS with something like:
    *.example.com       300 IN A $SERVICE_IP
```

проверка ingress:
```
darkon@darkonVM:~/DarkonGH_microservices/kubernetes/Charts/gitlab-omnibus (kubernetes-4)$ kubectl get service -n nginx-ingress nginx
NAME    TYPE           CLUSTER-IP     EXTERNAL-IP     PORT(S)                                   AGE
nginx   LoadBalancer   10.96.190.59   51.250.11.215   80:31058/TCP,443:30763/TCP,22:30742/TCP   10m
```

#### Использование Gitlab.com

Замечание:
> В процессе развертывания устаревшего чарта с Gitlab, не удалось добится его работоспособности в Yandex Cloud
> - изначально сам чарт был не работоспособен, приходилось менять apiVersion
> - Persistent Volumes был запилен на Google Cloud и поды просто не стартавали, пришлось править под YC
> - После старта всех подов осталась ошибка с Ingress Controllers
> - Просмотр логов по некоторым контейнерам показывал на различные ошибки

> В результате было принято решение использовать Gitlab.com для продолжения выполнения домашнего задания

[Инструкция по подключению кластера Kubernetes к сборкам GitLab](`https://cloud.yandex.ru/docs/solutions/infrastructure-management/gitlab-containers#runners`)

#### Установка GitLab Runner из Helm Chart

Добавим для gitlab сервисный аккаунт и ClusterRoleBinding командой:
```
kubectl apply -f kubernetes/gitlab/gitlab-admin-service-account.yaml
```

- подготовим `kubernetes/gitlab/runner/values.yaml`

создадим неймспейс:
```
kubectl create namespace gitlab-runner
```

установим gitlab executor из чарта:
```
helm install --namespace kube-system gitlab-runner -f ./values.yaml  gitlab/gitlab-runner

NAME: gitlab-runner
LAST DEPLOYED: Wed Nov 24 00:21:46 2021
NAMESPACE: gitlab-runner
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
Your GitLab Runner should now be registered against the GitLab instance reachable at: "https://gitlab.com/"
```

#### Запуск проекта

Заполним репозиторий согласно рекоммендациям ДЗ.

Добавим CI/CD пайплайны для `ui`, `comment` и `post`:
![image 3](images/hwKub4_cicd_ui.png)
![image 4](images/hwKub4_cicd_comment.png)
![image 5](images/hwKub4_cicd_post.png)

Изменим пайплайн для `ui` и `reddit-deploy` на gitlab style.

Созданные пайпланый для `ui` , `post`, `comment` и `reddit` выложим в `kubernetes/Charts/gitlabci`

#### Задание со * - добавление зависимых проектов в пайплайн

[`документация Multi-project pipelines`](https://docs.gitlab.com/ee/ci/pipelines/multi_project_pipelines.html#define-multi-project-pipelines-in-your-gitlab-ciyml-file)


для добавления много-проектного пайплайна, добавим в пайплайны `ui` , `post`, `comment`

в список шагов, шаг `deploy`:
```
stages:
  ...
  - deploy
```

и описание шага с зависимым проектом `darkonone/reddit-deploy`, срабатывать данный шаг будет толко на ветке master:
```
bridge:
  stage: deploy
  trigger:
    project: darkonone/reddit-deploy
    branch: master
    strategy: depend
  only:
    - master
```

Работу данного функционала видно на скринах:
Merge ui в ветку master:
![image 6](images/ui-multi-project.png)

запускает пайплайн проекта reddit-deploy:
![image 7](images/triggired-reddit-deploy.png)

Для того чтобы проводилась автомтаически выкатка на production, необходимо в пайплайне `reddit-deploy` убрать `when manual` для шага production.
