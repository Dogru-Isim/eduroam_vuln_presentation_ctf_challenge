-- Create table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL
);

-- Insert demo user
INSERT INTO users (username, password)
VALUES ('admin', 'zxlckjvh-iuwebrjabsdfpiuzhxcv');  -- I know the password is stored here in clear text, it's for the demo

