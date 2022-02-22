create table salary(
	id serial primary key,
	monthly_salary int not null
);

select * from roles_salary ;
create table roles(
	id serial primary key,
	role_title varchar(50) unique not null
);

create table roles_salary(
	id serial primary key,
	id_role int not null,
	id_salary int not null,
	foreign key (id_role)
		references roles(id),
	foreign key (id_salary)
		references salary(id)
);
insert into salary(id,monthly_salary)
values(default, 1500),
	  (default, 2500),
	  (default , 3500);
insert into salary(monthly_salary)
values(1000),
	  (2000),
	 (3000);
	
insert into roles(role_title)
 values ('QA_En_jun'),
		('QA_En_mid'),
		('QA_En_sen'),
		('QA_En_aut_jun'),
		('QA_En_aut_mid'),
		('QA_En_aut_sen');

insert into roles_salary(id_role,id_salary)
values	(1, 6),
		(2, 5),
		(3, 4),
		(4, 3),
		(5, 2),
		(6, 1);
	
insert into roles_salary(id_role, id_salary)
values	(1, 6),
		(2, 5),
		(3, 4),
		(4, 3),
		(5, 2),
		(6, 1);
	select * from roles; 
	
--у ролей сделаем параметр парковка
alter  table roles 
add column parking int;
--переименовываем колонку
alter  table roles 
rename column parking to taxi;
--удаляем столбик
alter  table roles 
drop column taxi;

--меняем тип данных
alter  table roles 
alter column parking type varchar(30) using parking::varchar(30);

alter table roles 
alter column parking type int using parking::integer;

select * from roles;

update roles
set role_title = 'HR_Business_partner'
where id = 6;

alter  table salary 
rename to salary_1;
--удаляем таблицу со всеми связями
drop table salary cascade;


		

