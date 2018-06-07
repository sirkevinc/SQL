PRAGMA foreign_keys = ON; -- SQLINE ONLY

DROP TABLE IF EXISTS note;
DROP TABLE IF EXISTS author;

CREATE TABLE note (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title VARCHAR(128) NOT NULL,
  content TEXT NOT NULL,
  time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  author_id INTEGER REFERENCES author(id)
);

CREATE TABLE author (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(128) NOT NULL
);

CREATE TABLE author_note (
  author_id INTEGER REFERENCES author(id),
  note_id INTEGER REFERENCES note(id)
);

INSERT INTO author (name) VALUES ("John");
INSERT INTO note (title, content, author_id) VALUES ("Note 1", "Content 1", 1);
INSERT INTO note (title, content, author_id) VALUES ("Note 2", "Content 2", 1);


-- What are the columns that a note table needs?
-- If you have a timestamp field, how do you auto-populate it with the date?
-- A note should have a foreign key pointing to an author in an author table.
-- What columns are needed for the author table?

-- SELECT * FROM note, author where author.id = note.author_id AND author.name IS "John";
-- SELECT author.name FROM note, author where note.author_id = author.id AND note.id=1;
