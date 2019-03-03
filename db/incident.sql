DROP TABLE issues;
DROP TABLE users;

CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE issues(
  id SERIAL4 PRIMARY KEY,
  date VARCHAR(255),
  time VARCHAR(255),
  incidentType VARCHAR(255),
  description VARCHAR(255),
  user_id INT2 REFERENCES users(id) ON DELETE CASCADE
);
