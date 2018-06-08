Docker
======

[TOC]

* toc
{:toc}

### Fix terminal on exec

```bash
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it docker-container-name /bin/bash
```

Can also be added to `.profile` (or `.bashrc`)
```bash
DOCKEREXEC='docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it'
alias docker-exec="${DOCKEREXEC}"
docker-bash() {
        USER=root
        if [ -n "$2" ]
        then
                USER=$2
        fi
        EXEC="${DOCKEREXEC} -u $USER $1 /bin/bash $3 $4"
        echo ${EXEC}
        eval ${EXEC}
}
```


