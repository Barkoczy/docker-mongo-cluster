# Mongo Cluster

Example for mongo cluster using Docker with minimal configuration required.

## Disclaimer
> :warning: **This setup is purely for local development purposes.**
>
> This setup should not be used for production applications as it was not built with that in mind.

### Are there any prerequisites?
* Docker Compose
* The following in your `/etc/hosts` file:
```
127.0.0.1       mongodb0
127.0.0.1       mongodb1
127.0.0.1       mongodb2
```

### Make .env file

```shell
cp .env.example .env
```

### Edit .env file (vim, nano.. your favorite choice)

Open enviroment file

```shell
vim .env
```

Edit enviroment file. Enter your password and edit default setup values if u need

```shell
MONGO_INITDB_ROOT_USERNAME=root
MONGO_INITDB_ROOT_PASSWORD=password
NODE_0_PORT=30100
NODE_1_PORT=30200
NODE_2_PORT=30300
```

### Generate mongodb.key file [Create a keyfile](https://www.mongodb.com/docs/manual/tutorial/deploy-replica-set-with-keyfile-access-control)

```shell
openssl rand -base64 756 > mongodb.key
```

### Create cluster

```shell
docker compose -f cluster.yml up
```

### After was cluster created execute initialize file

```shell
docker compose -f init.yml up
```

### Check

```shell
docker compose ps
```

### URI

```shell
mongodb://root:password@127.0.0.1:27017/?directConnection=true&serverSelectionTimeoutMS=2000&appName=mongosh+1.8.2
```

### Create user

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
