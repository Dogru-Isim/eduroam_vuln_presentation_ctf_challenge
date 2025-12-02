# How To Setup

## How to Run

Run the below bash command. It will start everything for you :) You can then start hacking.

```bash
chmod +x ./start.sh
./start.sh
```

The password will be exposed, using the password for the login doesn't count as solution.
You need to find the real vulnerability here. Remember the presentation.

mysql takes time to fully start. just give it time

Sorry not sorry that I added all the node modules into the repository, it was an accident :)

Finally, access the node webserver on localhost:3000 and the mysql server on localhost:3306

You can access the vulnerable endpoint like so

```bash
curl http://localhost:3000/login -d '{"username":"admin","password":"password"}' -H 'Content-Type: application/json' -X POST
```

You can also proxy curl through BurpSuite if you prefer a GUI
Just make sure that you have BurpSuite running on localhost:8080, Burp listens on 8080 by default so no problem expected

```bash
curl http://localhost:3000/login -d '{"username":"admin","password":1}' -H 'Content-Type: application/json' -X POST -x localhost:8080
```

Good luck and happy learning!

## How to Stop

Run the below bash command.

```bash
chmod +x ./start.sh
./stop.sh
```

It will stop and remove the containers for you

## Hints

**Hint 0 (the most important hint, prob view this even though you think you don't need hints)**

<details>
  <summary>Hint 0 (the most important hint, prob view this even though you think you don't need hints)</summary>
  Don't use that LLM, it will just confuse you. Did you use it already? Then I'm sure you're confused. Did it solve the CTF for you, wow, they improved a lot...
</details>

**Hint 1 (tiny hint)**

|| Is type checking performed on the user provided data? ||

**Hint 2 (small lead)**

||Look closer at the sql query, is it doing what you think it's doing?||

**Hint 3 (big lead)**

||Can you see what sql is running when you provide a json object as the password? Remember, no type checking so you can give a json object as password||

**Hint 4 (almost the answer)**

||What does this return in sql "SELECT * FROM users WHERE username = admin AND password = `password` = 1;". How can you make the code run this query for you?||


## Note

I know you might be thinking **but dude, everyone hashes user passwords before using them in SQL**. You are right my friend.

But you are forgetting that this is just a PoC. The same logic could be used to query other secret info.

Think about invitation tokens, session cookies, API keys...
