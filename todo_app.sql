create table users (
	id SERIAL primary key,
	name VARCHAR(180) not null
);

insert into users (name) values ('J.K. Rowlings');
insert into users (name) values ('Suzanne Collins');

create table books (
	id SERIAL primary key,
	name VARCHAR(80) not null,
	author_id INTEGER not null references users(id)
);

insert into books (name, author_id) values ('Harry Potter', 1);
insert into books (name, author_id) values ('The Hunger Games', 2);

delete from books
	where name='The Hunger Games';

drop table books;

drop table users;

drop table cascade users;

select * from books;

select * from users;

drop database if exists todo_app;

drop user if exists michael;

create user michael with encrypted password 'stonebreaker';

create database todo_app;

create table tasks (
	id SERIAL primary key not null,
	title VARCHAR(255) not NULL,
	description text null, 
	created_at timestamp without time zone not null default current_timestamp,
	updated_at timestamp without time zone null,
	completed boolean not null default false
);

alter table tasks 
drop column completed;

alter table tasks
add column completed_at timestamp without time zone null DEFAULT NULL;

alter table tasks 
alter column updated_at set default current_timestamp,
alter column updated_at set not null;

insert into  tasks (title, description)
values ('Study SQL', 'Complete this exercise');

insert into tasks (title, description)
values ('Study PostgresSQL', 'Read all the doumentation');

SELECT title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT *
FROM tasks
ORDER BY created_at DESC; 

INSERT INTO tasks (title, description) VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description) VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description) VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake 1%';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT *
FROM tasks
ORDER BY title ASC;