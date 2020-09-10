# sjtu-plus-docker

docker-compose configuration for SJTU-Plus services

## Usage

First of all, create secrets files.

`secrets/postgres-db.env`

```text
POSTGRES_USER=sjtu-plus
POSTGRES_PASSWORD=233333
```

`secrets/sjtu-plus.env`

```text
SECRET_KEY=233333333
ALLOWED_HOST=localhost
```

And then, you can init all projects and start the service.

```bash
make init
make update
make loaddata
docker-compose up --build -d
```
