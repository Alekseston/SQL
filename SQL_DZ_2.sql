--1)Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
create table employees(
	id serial primary key,
	employee_name varchar(50)  not null
);
--2)Наполнить таблицу employees 70 строками.
insert into employees (employee_name)
values  ('Pam'),
('Elizabeth'),
('Marlin'),
('Thomas'),
('Michael'),
('Elliott'),
('James'),
('Steven'),
('Anna_5'),
('Anna_6'),
('Anna_7'),
('Anna_8'),
('Anna_9'),
('8_Jermaine'),
('8_Terence'),
('8_Mabel'),
('8_Jarred'),
('8_Mary'),
('8_Yoshie'),
('8_Alice'),
('8_David'),
('8_Robert'),
('8_Stanley'),
('8_James'),
('8_Patty'),
('8_Jackson'),
('8_Frank'),
('8_William'),
('8_Norris'),
('8_Earl'),
('8_Sylvia'),
('8_Kathleen'),
('8_Dallas'),
('8_Tamera'),
('Andrey_1'),
('Andrey_2'),
('Andrey_3'),
('Andrey_4'),
('Andrey_5'),
('Andrey_6'),
('Leticia_Long'),
('Christopher_Kumro'),
('Olive_Warne'),
('Kenneth_Coleman'),
('William_Owen'),
('Richard_Laflam'),
('Bettye_Bevington'),
('Frida_Krieger'),
('Rocky_Siddon'),
('Veronica_Jones'),
('Michael_Carrano'),
('Joanne_Hubler'),
('Thomas_Patel'),
('Angelina_Venezia'),
('Albert_Madrigal'),
('Alice_Garner'),
('Shirley_Hartung'),
('Derrick_Gary'),
('Pauline_Moody'),
('John_Perez'),
('Philip_Wilde'),
('Debra_Holland'),
('Amy_Mcmanus'),
('Karl_Storie'),
('Christine_Ackland'),
('Joseph_Spradlin'),
('James_Bradford'),
('Sadie_Mcdougall'),
('Gerald_Gross'),
('Frederick_Bumbrey');
--проверяем таблицу
select * from employees  ; 

--3)Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
create table salary(
	id Serial primary key,
	monthly_salary int not null
);
--проверяем таблицу
select * from salary; 
/*4)Наполнить таблицу salary строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800*/
insert into salary(monthly_salary)
values(1000),
      (1100),
	  (1200),
	  (1300),
	  (1400),
	  (1500),
	  (1600),
	  (1700),
	  (1800);

/*5)
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500*/
insert into salary(monthly_salary)
values(1900),
      (2000),
	  (2100),
	  (2200),
	  (2300),
	  (2400),
	  (2500);
/*6)Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null*/
create table employee_salary(
	id serial primary key,
	employee_id int not null unique, 
	salary_id int not null

);
drop table employee_salary cascade;
--проверяем таблицу
select * from employee_salary;
/*Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
 */
insert into employee_salary(employee_id, salary_id)
values	        (71, floor(random()*(16-1+1))+1),
		(72, floor(random()*(16-1+1))+1),
		(73, floor(random()*(16-1+1))+1),
		(74, floor(random()*(16-1+1))+1),
		(75, floor(random()*(16-1+1))+1),
		(76, floor(random()*(16-1+1))+1),
	        (77, floor(random()*(16-1+1))+1),
		(78, floor(random()*(16-1+1))+1),
		(79, floor(random()*(16-1+1))+1),
		(80, floor(random()*(16-1+1))+1),
		(1, floor(random()*(16-1+1))+1),	
		(2, floor(random()*(16-1+1))+1),	
		(3, floor(random()*(16-1+1))+1),	
		(4, floor(random()*(16-1+1))+1),	
		(5, floor(random()*(16-1+1))+1),	
		(6, floor(random()*(16-1+1))+1),	
		(7, floor(random()*(16-1+1))+1),	
		(8, floor(random()*(16-1+1))+1),	
		(9, floor(random()*(16-1+1))+1),	
		(10, floor(random()*(16-1+1))+1),	
		(11, floor(random()*(16-1+1))+1),	
		(12, floor(random()*(16-1+1))+1),	
		(13, floor(random()*(16-1+1))+1),	
		(14, floor(random()*(16-1+1))+1),	
		(15, floor(random()*(16-1+1))+1),	
		(16, floor(random()*(16-1+1))+1),	
		(17, floor(random()*(16-1+1))+1),	
		(18, floor(random()*(16-1+1))+1),	
		(19, floor(random()*(16-1+1))+1),	
		(20, floor(random()*(16-1+1))+1),	
		(21, floor(random()*(16-1+1))+1),	
		(22, floor(random()*(16-1+1))+1),	
		(23, floor(random()*(16-1+1))+1),	
		(24, floor(random()*(16-1+1))+1),	
		(25, floor(random()*(16-1+1))+1),	
		(26, floor(random()*(16-1+1))+1),	
		(27, floor(random()*(16-1+1))+1),	
		(28, floor(random()*(16-1+1))+1),	
		(29, floor(random()*(16-1+1))+1),	
		(30, floor(random()*(16-1+1))+1);
	
--8)Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--сначала удаляем существующую таблицу:
drop table roles cascade;

	create table roles(
	id serial primary key,
	role_name int not null unique
); 
--проверяем таблицу
select * from roles;

--9)Поменять тип столба role_name с int на varchar(30)
alter  table roles 
alter column role_name type varchar(30) using role_name::varchar(30);

--10)Наполнить таблицу roles 20 строками из таблицы:
insert into roles (role_name)
values('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--11)Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

--удаление таблицы
drop table roles_employee cascade;

create table roles_employee(
	id serial primary key,
	employee_id int not null unique, 
	role_id int not null,
		foreign key (employee_id)
		references employees(id),
		foreign key (role_id)
		references roles(id)
);
--проверяем таблицу
select * from roles_employee;

--12)Наполнить таблицу roles_employee 40 строками:
insert into roles_employee(employee_id, role_id)
values	(1, floor(random()*(20-1+1))+1),
		(2, floor(random()*(20-1+1))+1),
		(3, floor(random()*(20-1+1))+1),
		(4, floor(random()*(20-1+1))+1),
		(5, floor(random()*(20-1+1))+1),
		(6, floor(random()*(20-1+1))+1),
		(7, floor(random()*(20-1+1))+1),
		(8, floor(random()*(20-1+1))+1),
		(9, floor(random()*(20-1+1))+1),
		(10, floor(random()*(20-1+1))+1),
		(11, floor(random()*(20-1+1))+1),
		(12, floor(random()*(20-1+1))+1),
		(13, floor(random()*(20-1+1))+1),
		(14, floor(random()*(20-1+1))+1),
		(15, floor(random()*(20-1+1))+1),
		(16, floor(random()*(20-1+1))+1),
		(17, floor(random()*(20-1+1))+1),
		(18, floor(random()*(20-1+1))+1),
		(19, floor(random()*(20-1+1))+1),
		(20, floor(random()*(20-1+1))+1),
		(21, floor(random()*(20-1+1))+1),
		(22, floor(random()*(20-1+1))+1),
		(23, floor(random()*(20-1+1))+1),
		(24, floor(random()*(20-1+1))+1),
		(25, floor(random()*(20-1+1))+1),
		(26, floor(random()*(20-1+1))+1),
		(27, floor(random()*(20-1+1))+1),
		(28, floor(random()*(20-1+1))+1),
		(29, floor(random()*(20-1+1))+1),
		(30, floor(random()*(20-1+1))+1),
		(31, floor(random()*(20-1+1))+1),
		(32, floor(random()*(20-1+1))+1),
		(33, floor(random()*(20-1+1))+1),
		(34, floor(random()*(20-1+1))+1),
		(35, floor(random()*(20-1+1))+1),
		(36, floor(random()*(20-1+1))+1),
		(37, floor(random()*(20-1+1))+1),
		(38, floor(random()*(20-1+1))+1),
		(39, floor(random()*(20-1+1))+1),
		(40, floor(random()*(20-1+1))+1);

select * from employees;
select * from roles;
