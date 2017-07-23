\c scottfujimoto
--1
DROP USER IF EXISTS michael;
--2
CREATE USER michael WITH ENCRYPTED PASSWORD 'loislane143';
--3
DROP DATABASE IF EXISTS todo_app;
--4
CREATE DATABASE todo_app;

-- Connect to database
\c todo_app;

--6
CREATE TABLE tasks (
  id serial NOT NULL,
  title varchar(255),
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT NOW(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL DEFAULT false,
  PRIMARY KEY (id)
);

--9
ALTER TABLE tasks DROP COLUMN completed;
--10
ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;

--11
ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL;
ALTER TABLE tasks ALTER COLUMN updated_at SET DEFAULT NOW();

--12
INSERT INTO tasks (title, description)
VALUES (
  'Study SQL',
  'Complete this exercise'
);

--13
INSERT INTO tasks (title, description)
VALUES (
  'Study PostGreSQL',
  'Read all the documentation'
);

--14
SELECT title
FROM tasks
WHERE completed_at is NULL;

--15
UPDATE tasks
SET completed_at = NOW()
WHERE title = 'Study SQL';

--16
SELECT title, description
FROM tasks
WHERE completed_at is NULL;

--17
SELECT * FROM tasks ORDER BY created_at DESC;

--18
INSERT INTO tasks (title, description)
VALUES (
  'mistake 1',
  'a test entry'
);

--19
INSERT INTO tasks (title, description)
VALUES (
  'mistake 2',
  'another test entry'
);

--20
INSERT INTO tasks (title, description)
VALUES (
  'mistake 3',
  'a test entry'
);

--21
SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

--22
DELETE FROM tasks
WHERE title = 'mistake 1';

--23
SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

--24
DELETE FROM tasks
WHERE title LIKE '%mistake%';

--25
SELECT * FROM tasks ORDER BY title ASC;












