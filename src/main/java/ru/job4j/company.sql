create database company;

create table roles (
	id INT primary key,
	title TEXT
);

insert into roles(id, title) values(10, 'trainee');
insert into roles(id, title) values(20, 'engineer');
insert into roles(id, title) values(30, 'sn_engineer');
insert into roles(id, title) values(40, 'director');

select * from roles;

create table users (
	id INT primary key,
	name TEXT,
	role_id INT references roles(id)
);

insert into users(id, name, role_id) values (1, 'Petrov', 10);
insert into users(id, name, role_id) values (2, 'Sidorov', 20);
insert into users(id, name, role_id) values (3, 'Ivanov', 20);
insert into users(id, name, role_id) values (4, 'Vasilev', 30);
insert into users(id, name, role_id) values (5, 'Romashkin', 40);

select * from users;

create table rules (
	id INT primary key,
	level TEXT
);
insert into rules (id, level) values (0, 'highest');
insert into rules (id, level) values (1, 'high');
insert into rules (id, level) values (2, 'midlle');
insert into rules (id, level) values (3, 'low');
select * from rules;

create table roles_rules (
	id INT primary key,
	role_id INT references roles(id),
	rule_id INT references rules(id)
);

insert into roles_rules (id, role_id, rule_id) values(1, 10, 3);
insert into roles_rules (id, role_id, rule_id) values (2, 40, 0);

select * from roles_rules;

create table comments (
	id INT primary key,
	content TEXT,
	likes INT
);

insert into comments(id, content, likes) values (33, 'faster', 666);
insert into comments(id, content, likes) values (34, 'ahead of schedule', 777);
select * from comments;


create table state (
	type TEXT primary key
);

insert into state(type) values ('delayed');
insert into state(type) values ('on schedule');
select * from state;

create table category (
	id	INT primary key,
	name TEXT
);

insert into category (id, name) values (1, 'top urgent');
insert into category (id, name) values (2, 'normal');
insert into category (id, name) values (3, 'canceled');
select * from category;

create table attachs (
	id INT primary key,
	name TEXT,
	size INT
);

insert into attachs(id, name, size) values (1, 'coffee_spil', 100);
insert into attachs(id, name, size) values (2, 'AI', 100);

create table items (
	id INT primary key,
	state_type TEXT references state(type),
	category_id INT references category(id),
	user_id INT references users(id),
	content TEXT,
	attach_id INT references attachs(id),
	comment_id INT references comments(id)
);

insert into items (id, state_type, category_id, user_id, content, attach_id, comment_id)
values			  (1, 'on schedule', 2, 1, 'db creation', 2, 34);
insert into items (id, state_type, category_id, user_id, content, attach_id, comment_id)
values			  (2, 'delayed', 1, 5, 'endless meetings', 1, 33);