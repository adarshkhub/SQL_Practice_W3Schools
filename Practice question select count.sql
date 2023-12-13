CREATE TABLE Salary(
empid INT,
project VARCHAR,
salary INT,
variable INT)

insert into Salary (empid, project, salary, variable)
VALUES ('121','p1','20000','0')

insert into Salary (empid, project, salary, variable)
VALUES ('321','p2','35000','1000')

insert into Salary (empid, project, salary, variable)
VALUES ('421','p1','50000','3000')

select * from salary

-- Question: Write a query to find the number of employees in this table working on the P1 project

select count(*) from salary
where project = 'p1'