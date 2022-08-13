# Sql
### ***All Data Type in SQL***
```sql
INT => Refer to Integer Number
Decimal(x,y)=> Refer to Deciaml Number
VARCHAR(1) => Refer to String and Char
BLOB => Binary Large Object 
DATE => YYYY-MM-DD
TIMESTAMP => YYYY-MM-DD HH:MM:SS => used for Recording 
```
- To Delete Table 
```sql 
Drop TABLE student;
```
- Add coloumn to Table 
```sql
AlTER TABLE student ADD gpa INT;
```
- Remove Coloumn from Table 
```sql
ALTER TABLE student DROP COLUMN gpa;
```
- Insert Value in table 
```sql
INSERT INTO student values (column_one,column_two);
```
- To display table
```sql
Select * from student
```
- To Insert in another way 
```sql
Insert INTO student (student_id,first_name) values (2,'kate')
```
---
- Note
-  `The primary key don't repeat any under condition`
-  `NULL` => you can't add value in this column
- `Not NULL` => You must add value in this column
- `UNIQUE` =>This field is unique
- `primary key` => mean that this key is `NOT NULL` **and** `UNIQUE`
---
- some trick
```sql
Student_id INT auto_increment
PRIMARY KEY(student_id)
-- To Increase the integer from 1 to n column automatic 
student_name VARCHAR(20) Default 'undecided'
-- To give default value for this column 
```
---
`=`     => Equal

`<>`    => Not Equal

`>`     => Greater than

`<`     => less than

`>=`    => Greater than or equal 

`<=`    => less than or equal 

---
## Update&Delete
- To update Table 
```sql
update student set major ='bio' 
where major ='biology'
-- or
update student set major ='bio' 
where major ='biology' or major ='chemistry';
-- or 
update student Set first_name='tom' , major ='undecided' where student_id==1;
-- or 
-- update all column[major] in this table
update student set major ='undecided'
```
- To Delete Table
```sql
-- To delete the row it's  name stduent_id=5
Delete from student where student_id=5;

-- To delete the row it's name is frist_name and is major 
Delete from student where frist_name='Tom' and major ='undecided' ;

-- To delete all table 
Delete from student;

```
---
## Basic Queries
- is the block of sql designed to ask database managment system  for a particular piece of information

```sql
-- * Grap all info from table
-- Disable all element in table
Select * from student 
-- display all column it's name is first_name
select first_name from student
-- select columns it's names is first_name , major
select first_name , major from student
-- select first_name with "DESC"
select first_name from student order by first_name DESC

-- select first_name with "ASC"
select first_name from student order by first_name

-- select first_name with "ASC"
select first_name from student order by first_name ASC
-- Select 2 row from student
select * from student limit 2;
-- select 2 row from student order by student_id
select * from student_id order by student_id DESC limit 2;
```
- **Fliter**
```sql
-- select all from table where major called biology
select * from student where major ='biology' 
-- select all from table wehre major not called biology
select * from student where major <> 'biology'
-- select from talbe if name in ('sara','aya','mohamed','f')
select * from student where name in ('sara','aya','mohamed','f')
```
## Company database
`create,delete,update,select`
```sql
-- Select as 
select first_name as forname from employee
-- To display gender from table 
select distinct sex from employee
-- output M,F
```
- Function
- **`count()` and ``AVG()`` and `sum()`**
```sql
-- Find number of employee
slect count(emp_id) from employee;
-- output 300
-- find number of femal employee borned after 1970
select count (emp_id) from employee where sex ='f' and brithday>='1971-01-01';
-- find average of employee salary 
select AVG(salary) from employee;
-- find average of employee salary how are men
select AVG(salary) from employee where sex='m';
-- Find Salary sum of employee 
select sum(salary) from employee
-- How many male and female in company  
select count(sex) from employee;
-- output 9
select count(sex),sex from employee;
-- output 9 m f
select count(sex),sex from employee Group by sex;
-- output 3 F
--        6 M
```
---
## Wild Cards
- Grab data that match specific pattern 
-  `%` Standard for any number of characters
-  `-` one characters
```sql
-- find any client's who are an llc
select * from client where client_name Like '%LLC'
-- find any employee born on octobre
select * from employee whwere birth_date like '____-10%';
```
## Union 
- special sql operators 
```sql 
-- find all list of employee and branch names 
select first_name from employee union 
select branch_name from branch;
```
## joins
- combine row from two or more tables in a single result.
- exist four type of join 
```sql
-- Add the extra branch
INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);
-- Find all branches and the name of the manager
-- general join 
select emp_id,first_name ,branch_name from employee 
join branch  on emp_id=mgr_id;
-- all the employee in the employee will appear 
-- left join 
select emp_id,first_name ,branch_name from employee 
left join branch  on emp_id=mgr_id;

-- all the manager in in the manager table will appear 
-- right join 
select emp_id,first_name ,branch_name from employee 
right join branch  on emp_id=mgr_id;

-- full outer join 
select emp_id,first_name ,branch_name from employee 
left join branch  on emp_id=mgr_id;
union 
select emp_id,first_name ,branch_name from employee 
right join branch  on emp_id=mgr_id;
```
----
## Nested Query
- is basically a query where we are going using multiple select statement in order to get specific information 

```sql
-- Find all employees who sold more than 30000 for one client
select employee.emp_id,first_name ,last_name from employee where employee.emp_id in (
select works_with.emp_id from works_with where total_sales >30000
);
-- Find all clients who are handled by the branch that michael managers and you know michael's ID 
-- Improtant Note
-- (=) here equal to (in)
select client_name from client where branch_id = (
select branch_id from branch where mgr_id =102
);
```
---
## On Delete 
- on delete set null
  - data related by this column will set to null
- on delete cascade 
  - data related by this column will be deleted also.
- we can use both of them when defining a relation key between tables

```sql
create table branch (
    -- on delete set null
    -- To define a foreign key when creating a branch table
    -- means when you delet emp_id the mgr_id will set to null
    foreign key(mgr_id) references employee(emp_id) on delete set null
);
-- delet emp_id =2
delete from employee where emp_id=2;

    -- on delete set cascade 
    -- To define a foregin key when creatubg a branch table
    --  means when you delete emp_id the mgr_id will deleted
create table branch (
    foreign key(mgr_id) references employee(emp_id) on delete cascade
);
delete from employee where emp_id=2;
```
---
## Triggers
- is basically a block of sql code which define a certain action that should happen when a certain operation get performed on the database
- remember that `mysql -u root -p`
- if you change any thing in the trigger you should update it from `mysql command line` by copy and paste the whole trigger after changing it.
- `First Trigger`\
```sql 
-- create table to show the trigger message
CREATE TABLE trigger_test (
     message VARCHAR(100)
);
```
```sql
-- Start the Trigger
DELIMITER $$
-- Create the Trigger
create
    TRIGGER my_trigger before insert
    on employee
    FOR EACH row begin
        insert into trigger_test values('added new employee');
    end$$
-- End the Trigger Trigger
DELIMITER ;
-- Insert value in employee to run trigger
insert into employee
values(109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);
-- Show message from trigger_test table 
select * from trigger_test
```
- `First Trigger` 
```sql
-- Like the first one but here add first_name in the trigger_test table
DELIMITER $$
CREATE
    TRIGGER my_trigger2 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
        INSERT INTO trigger_test VALUES(NEW.first_name);-- add the first_name to the trigger_test table
    END$$
DELIMITER ;
```
- `thrid trigger using if,elseif,else`
```sql
DELIMITER $$
create
    TRIGGER my_trigger3 before insert
    on employee
    FOR EACH row begin
         if NEW.sex = 'M' then
               insert into trigger_test values('added male employee');
         elseif NEW.sex = 'F' then
               insert into trigger_test values('added female');
         else
               insert into trigger_test values('added other employee');
         end if;
    END$$
DELIMITER;
```
- Delete Trigger 
```sql
-- drop trigger trigger name
drop trigger my_trigger
drop trigger my_trigger2
drop trigger my_trigger3
```

- finally we can also use trigger for `update`**and** `detete` **and** can use it `before` **and** `after`
----
## DR Diargram [Entity Relation Diagram]
- This section is theoretical so the best way to make a revision on it that rewatch the video.
- [rewatch](https://youtu.be/HXV3zeQKqGY?t=13333)

