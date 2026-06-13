# Что это?

Собранный образ Jenkins для работы с Docker через Unix Socket хостовой системы.

Образ содержит:

* Docker CLI
* настройку группы Docker для пользователя `jenkins`
* готовую конфигурацию для запуска Pipeline с использованием Docker

# Принцип работы

В контейнер пробрасывается Unix Socket Docker хоста:

```text
/var/run/docker.sock
```

Пользователю `jenkins` назначается группа Docker с GID хостовой системы, что позволяет выполнять Docker-команды без запуска Docker-in-Docker (DinD).

Все команды выполняются через Docker Engine хоста:

```bash
docker build
docker run
docker pull
docker push
```

# Особенности

* не использует DinD
* использует Docker Engine хостовой системы
* не запускает собственный Docker Daemon
* подходит для Jenkins Pipeline и CI/CD задач
* _java 21_

# Запуск

```bash
git clone {REPO}
docker compose up
```

# Проверка

```bash
docker exec -it jenkins docker version
```

или в Pipeline:

```groovy
pipeline {
    agent any

    stages {
        stage('Docker Test') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
```
