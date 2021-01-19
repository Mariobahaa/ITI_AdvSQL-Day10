--1--
use [SD32-Company];

declare c1 cursor
for select E.Salary
	from [Human_Resources].[Employee] E
for update    

declare @sal int
open c1
fetch c1 into @sal
while @@FETCH_STATUS=0
	begin
		if @sal < 3000
		begin
			update [Human_Resources].[Employee]
			set Salary = Salary*1.1
			where current of c1
		end
		else if @sal >= 3000
		begin
			update [Human_Resources].[Employee]
			set Salary = Salary*1.1
			where current of c1
		end
		fetch c1 into @sal
	end
close c1
deallocate c1

--2--
--2.	Display Department name with its 
--manager name using cursor. Use ITI DB

use ITI;
declare c1 Cursor
for select D.Dept_Name, I.Ins_Name
    from [dbo].[Instructor] I, [dbo].[Department] D
	where I.Dept_Id = D.Dept_Id
for read only

declare @dname varchar(50),@iname varchar(50)
open c1
fetch c1 into @dname,@iname
while @@FETCH_STATUS=0
	begin
		select @dname, @iname 
		fetch c1 into @dname,@iname
	end
close c1
deallocate c1

--3--

declare c1 Cursor
for select distinct st_fname
    from [sch].[Student]
	where st_fname is not null
for read only

declare @name varchar(50),@all_names varchar(500)=''
open c1
fetch c1 into @name
set @all_names= Concat(@all_names,@name)
while @@FETCH_STATUS=0
	begin
		set @all_names= Concat(@all_names,',',@name) 
		fetch c1 into @name
	end
select @all_names
close c1
deallocate c1

--4--
--files

--5--
--files

--6--
--files

--7--
create database Snap1
on
(
 name='SD32-Company',
 filename='E:\Career\ITI\Material\Advanced SQL\Tasks\Day10\Day10P7.ss'
)
as snapshot of [SD32-Company]

select * from Snap1.dbo.Works_on;

--8--
--files
--Sript File Available + Screenshots
--Step IN Schedule (Don't Execute)
backup database [ITI]
to disk 'E:\Career\ITI\Material\Advanced SQL\Tasks\Day10\Day10P8.bak'

--9--
CREATE SEQUENCE sequence_1
start with 1
increment by 1
minvalue 1
maxvalue 10
no cycle;

select next value for sequence_1
