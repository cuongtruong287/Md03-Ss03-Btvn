create database studentmanegement;
use studentmanegement;
create table class(
	classID int  primary key auto_increment,
    className varchar(50) not null unique,
    startDay date,
    classStatus bit(1) default 1
);
drop table class;
alter table class change startDay startDate date;

create table student(
	studentID int primary key auto_increment,
    studentName varchar(50) not null unique,
    address varchar(100) not null,
    studentPhone varchar(10) check (number >= 9 and number <=10),
    studentStatus bit(1) default 1,
    class_id int not null,
    foreign key(class_id) references class(classID)
);
alter table student modify column studentPhone int;

create table studentSubject(
	subId int primary key auto_increment,
    subName varchar(50),
    credit int,
    subStatus bit(1) default 1
);

create table mark(
	markId int not null,
    sub_id int not null,
    foreign key (sub_id) references studentSubject(subId),
    student_id int not null,
    foreign key(student_id) references student(studentID),
    mark float check ( mark >= 0 and mark <= 10),
    examTime time not null
);

insert into class(className, startDate, classStatus) values ('1A','2024-03-23',1), ('2B','2024-03-24',0), ('3C','2024-03-25',1);
update class set startDate = '2023-12-10' where className = '2B';

insert into student(studentName, address, studentPhone, studentStatus, class_id) values 
('Cuong', 'Vietnam',090909734,1,2),
('Hung', 'Nhatban',090902734,0,1),
('Trang', 'Dailoan',090949734,1,3);

insert into studentSubject(subName, credit, subStatus) values ('Toan', 4, 1), ('Van', 5, 0), ('Dia ly', 2, 1), ('Lich su', 3, 0), ('GDCD', 2, 1); 

insert into mark(markId, sub_id, student_id, mark, examTime) values (2, 4, 3, 10, '01:30:00'), (1, 2, 1, 7, '01:00:00'), (3, 1, 1, 6, '00:45:00');
update mark set student_id = 2 where markId = 3;

select * from class;
select * from student;
select * from studentSubject;
select * from mark;

select * from student where studentName like 'h%';
select * from class where month(startDate) = 12;
select * from studentSubject where credit between 3 and 5;
update student set class_id = 2 where studentName = 'Hung';
select studentName from student where exists(select * from mark order by mark asc);
select subName from studentSubject where exists(select * from mark order by mark asc);