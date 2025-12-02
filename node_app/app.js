const express = require('express');
const mysql = require('mysql2');

const app = express();
app.use(express.json());

let db;

// function to try connecting to mysql until it succeeds, mysql takes time to start... so much time, too much, I don't know why
function connectWithRetry() {
  // create db connection
  db = mysql.createConnection({
    host: 'mysql',
    user: 'root',
    password: 'rootpassword',
    database: 'auth_db',
    port: 3306,
  });

  db.connect(err => {
    if (err) {
      console.log("DB connection failed, retrying in 2s...", err.message);
      setTimeout(connectWithRetry, 2000);
    } else {
      console.log("Connected to MySQL");
    }
  });
}

connectWithRetry();

app.post('/login', (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(400).send('Missing username or password');
  }

  console.log(username, password)

  db.query("SELECT * FROM users WHERE username = ? AND password = ?",
    [username, password],
    function(error, results, fields) {
      if (error) {
        console.error(error);
        return res.status(400).send("Invalid input");
      }
      if (results.length > 0) {
        res.send("Authenticated!!!, here is your flag: H4CK3RM4N{Y0U_MU5T_B3_A_G3N1U5}"); // it doesn't count if you read the flag from the source code aight?
      }
      else {
        res.send("Authentication failure");
      }
    }
  );

});

app.listen(3000, () => {
  console.log('Running on http://localhost:3000');
});
