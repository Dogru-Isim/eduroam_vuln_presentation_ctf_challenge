const express = require('express');
const mysql = require('mysql2');

const app = express();
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'rootpassword',
  database: 'auth_db'
});

db.connect(err => {
  if (err) {
    console.error('DB connection failed:', err);
    process.exit(1);
  }
  console.log('Connected to MySQL');
});

app.post('/login', (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(400).send('Missing username or password');
  }

  db.query("SELECT * FROM users WHERE username = ? AND password = ?",
    [username, password],
    function(error, results, fields) {
      if (error) {
        console.error(error);
        return res.status(400).send("Invalid input");
      }
      if (results.length > 0) {
        res.send("Authenticated!!!, here is your flag: H4CK3RM4N{Y0U_MU5T_B3_A_G3N1U5}"); // it doesn't count if you read the flag from the source code ight?
      }
      else {
        res.send("Authentication failure");
      }
    }
  );

});

app.listen(3000, () => {
  console.log('POC auth server running on http://localhost:3000');
});

