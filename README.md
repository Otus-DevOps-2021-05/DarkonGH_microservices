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

### Задание со *

Сравнение вывода команд


исследование контейнера:
```
darkon@darkonVM:~/DarkonGH_microservices (docker-2)$ sudo docker inspect 4babfbfd5179
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
darkon@darkonVM:~/DarkonGH_microservices (docker-2)$ sudo docker inspect a46f338a8d59
[sudo] пароль для darkon:
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
