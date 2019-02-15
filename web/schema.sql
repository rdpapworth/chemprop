DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS ckpt;

CREATE TABLE user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  preferences JSON
);

CREATE TABLE ckpt (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ckpt_name TEXT UNIQUE NOT NULL,
  associated_user INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  class TEXT NOT NULL,
  stats JSON,
  epochs INTEGER NOT NULL DEFAULT 30,
  completed BOOLEAN NOT NULL DEFAULT 0,
  FOREIGN KEY (associated_user) REFERENCES user (id)
);

INSERT INTO user (username) VALUES ("DEFAULT")