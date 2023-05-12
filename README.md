# Docker mongo cluster

Example for mongo cluster via docker

## Make .env file

```shell
cp .env.example .env
```

## Edit .env file (vim, nano.. your favorite choice)

Open enviroment file

```shell
vim .env
```

Edit enviroment file

```shell
MONGODB_ROOT_PASSWORD=
MONGODB_REPLICA_SET_KEY=
```

## Run

```shell
docker-compose up -d
```

## Down

```shell
docker-compose down
```

## Check

```shell
docker-compose ps
```

## URI

```shell
mongodb://root:pxMa6XMmXjQmFQbzfPn4eFYx@127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.8.2
```

## Create user

```shell
use <database>

db.createUser({
 user: "<username>", 
 pwd: passwordPrompt(), 
 roles: [
  {role: "userAdmin", db: "<db_name>"},
  {role: "userAdmin", db: "<db_name>"},
  {role: "dbOwner", db: "<db_name>"},
  {role: "dbAdmin", db: "<db_name>"},
  {role: "readWrite", db: "<db_name>"}
 ]
});
```

```shell
db.createUser({user: "<username>", pwd: passwordPrompt(), roles: [{role: "userAdmin", db: "<db_name>"},{role: "userAdmin", db: "<db_name>"},{role: "dbOwner", db: "<db_name>"},{role: "dbAdmin", db: "<db_name>"},{role: "readWrite", db: "<db_name>"}]});
```
