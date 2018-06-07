Docker
======

[TOC]

* toc
{:toc}

### Fix terminal on exec

```bash
docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -it docker-container-name /bin/bash
```
