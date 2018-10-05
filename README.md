## Setup

```
docker-compose up -d
docker exec -it doctrine /bin/bash
bin/console doctrine:migrations:diff
```
