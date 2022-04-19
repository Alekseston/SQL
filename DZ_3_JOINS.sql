/*SQL HomeWork 2. Joins

Если для какого-то кейса надо сделать дополнительную таблицу, наполнить её данными, то делайте )*/

--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select
	employee_name,
	monthly_salary from employees e 
	join employee_salary es on e.id=es.employee_id 
	join salary s on s.id=es.salary_id;
--2. Вывести всех работников у которых ЗП меньше 2000.
select
	employee_name,
	monthly_salary from employees e 
	join employee_salary es on e.id=es.employee_id 
	join salary s on s.id=es.salary_id
	where monthly_salary<2000;
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
-- Для получения правильного ответа нужно понять что такое зарплатная позиция. 
--Если зарплатной позицией называют записи в таблице employee_salary, 
--то смотреть последний ответ пункг г). 
--Если зарплатной позицией называется запись из salary, то смотрим ответы б и в.
--Если зарплатной позицией называется любое сочетание зарплаты из salary в сочетании 
--с employee_name из employees и emploee_id из employee_salary, то ответ a.
--а)Здесь мы найдем сочетание наличия зарплаты и отсутствия имени и/или id работника:
select
monthly_salary ,employee_name, employee_id  from salary 
	left join employee_salary es on salary.id=es.salary_id
	left join employees e on es.employee_id =e.id
	where employee_id is null or employee_name is NULL;
select monthly_salary, employee_name ,employee_id  from employees e 
	full outer join employee_salary es on e.id=es.employee_id
	right join salary s on s.id=es.salary_id
where employee_id is null or employee_name is NULL;
--б)Так мы найдем зарплатные позиции(зарплата с уникальным id и значением, по принципу нормальности у которой не найдется работника)
select
monthly_salary from salary where monthly_salary not in
	(select monthly_salary from employees e 
	join employee_salary es on e.id=es.employee_id 
	join salary s on s.id=es.salary_id);
--в)Тоже самое но другим способом 
select monthly_salary, employee_name ,employee_id  from employees e 
	left join employee_salary es on e.id=es.employee_id
--этим левым джойном мы оставляем все 70 уникальных работников из таблицы, даже если им не назначены зарплаты в таблице зарплат работников;
--затем правым джойном объединям полученное с уникальными зарплатами.
	right join salary s on s.id=es.salary_id
where employee_name is null;
--г)мнение ментора, что мы должны искать не зарплатные позиции(уникальные зарплаты по id), а несуществующие имена(есть id, но нет имен):
select
monthly_salary ,employee_name  from salary 
	join employee_salary es on salary.id=es.salary_id 
	left join employees e  on es.employee_id=e.id
	where employee_name is NULL;
--4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
	select
monthly_salary from salary where monthly_salary not in
	(select monthly_salary from employees e 
	join employee_salary es on e.id=es.employee_id 
	join salary s on s.id=es.salary_id)
	and monthly_salary<2000;
--5. Найти всех работников кому не начислена ЗП.
select employee_name from employees where employee_name not in
(select
	employee_name from employees e 
	join employee_salary es on e.id=es.employee_id 
	join salary s on s.id=es.salary_id);
-- 6. Вывести всех работников с названиями их должности.
--a) если это работники у которых есть должность:
select employee_name , role_name from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id;
--б) если это все работники из таблицы employees:
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id;
--7. Вывести имена и должность только Java разработчиков.
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Java %';
--8. Вывести имена и должность только Python разработчиков.
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Python %';
--9. Вывести имена и должность всех QA инженеров.
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%QA engineer%';
--10. Вывести имена и должность ручных QA инженеров.
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Manual QA engineer%';
--11. Вывести имена и должность автоматизаторов QA
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Automation QA engineer%';
--12. Вывести имена и зарплаты Junior специалистов
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Junior%';
--13. Вывести имена и зарплаты Middle специалистов
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Middle%';
--14. Вывести имена и зарплаты Senior специалистов
select employee_name , role_name from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Senior%';
-- 15. Вывести зарплаты Java разработчиков
select monthly_salary, role_name  from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Java %';
-- 16. Вывести зарплаты Python разработчиков
select monthly_salary, role_name  from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Python %';
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employee_name ,monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Junior Python %';
-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employee_name ,monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Middle JavaScript%';
-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employee_name ,monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Senior Java %';
-- 20. Вывести зарплаты Junior QA инженеров
select monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Junior%QA engineer%';
-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG (monthly_salary) from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%Junior%';
-- 22. Вывести сумму зарплат JS разработчиков
select SUM(monthly_salary) from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%JavaScript%';
-- 23. Вывести минимальную ЗП QA инженеров
select MIN(monthly_salary) from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%QA engineer%';
-- 24. Вывести максимальную ЗП QA инженеров
select max(monthly_salary) from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%QA engineer%';
-- 25. Вывести количество QA инженеров
select count(employee_name) from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%QA engineer%';
-- 26. Вывести количество Middle специалистов.
select count(employee_name) from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%Middle%';
-- 27. Вывести количество разработчиков
select count(employee_name) from employees e 
left join roles_employee re on e.id=re.employee_id 
left join roles r on r.id=re.role_id
where role_name like '%developer%';
-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select SUM(monthly_salary) from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where role_name like '%developer%';
-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name ,role_name, monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
order by monthly_salary;
-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name ,role_name, monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary;
-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name ,role_name, monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where monthly_salary < 2300
order by monthly_salary;
-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name ,role_name, monthly_salary from employees e 
join roles_employee re on e.id=re.employee_id 
join roles r on r.id=re.role_id
join employee_salary es on e.id=es.employee_id 
join salary s on s.id=es.salary_id
where monthly_salary in(1100,1500,2000) 
order by monthly_salary;
