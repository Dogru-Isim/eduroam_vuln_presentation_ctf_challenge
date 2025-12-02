# How To Setup

Run the below docker command. It will start a mysql docker container.

```bash
docker compose up -d
```

The password will be exposed, using the password for the login doesn't count as solution.
You need to find the real vulnerability here. Remember the presentation.

It takes it time to fully start. Just wait until the following command responds with "mysqld active"
Password is "rootpassword"

```bash
docker exec -it mysql-poc mysqladmin -u root -p ping
```

Run the following docker command to init the database tables and create the admin account

```bash
docker exec -i mysql-poc mysql -u root -prootpassword auth_db < ./mysql/init.sql
```

Sorry not sorry that I added all the node modules into the repository :) :(
