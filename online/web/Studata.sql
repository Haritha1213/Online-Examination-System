/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  lenovo
 * Created: 02-Apr-2024
 */
/*------------Student DB------------------------*/

create table studData123(
uname int not null,
psw varchar(225) not null,
fname varchar(255) not null,
primary key (uname)
);


insert into studData123(uname,psw,fname)
values (12116234, 'gpj','Haritha Sai Adurthi'),
(12108387, 'kitkat','Vineetha Adusumalli'),
(12112885, 'bhavi','Bhavishya Thota'),
(12107938, 'vishal','Shruthi Vishwanatham');


UPDATE studData123
SET psw = 'bhavi'
WHERE uname = 12112885;


/*-----------------------Teacher DB--------------------------------*/

create table teacher123(
uid int NOT NULL,
pass VARCHAR(255) not null,
uname VARCHAR(255) not null,
PRIMARY KEY (uid)
);

insert into teacher123(uid, pass, uname)
values(26199,'pst','Prakash singh Tanwar'),
(16905,'kjs' , 'Kanwaljeet Singh');


/*--------------------------Exams DB---------------------------------*/
create table exam123(
exname varchar(255) not null,
uid int not null,
ccode varchar(255) not null,
exid int not null,
primary key (exid),
foreign key (uid) references teacher123(uid)
);





/*----------------------------Question DB-----------------------------*/
  
  CREATE TABLE ques123 (
  qid INT NOT NULL AUTO_INCREMENT,
  exid INT NOT NULL,
  quest varchar(255) not null,
  op1 varchar(255) not null,
  op2 varchar(255) not null,
  op3 varchar(255) not null,
  op4 varchar(255) not null,
  PRIMARY KEY (qid),
  FOREIGN KEY (exid) REFERENCES exam123(exid)
  );




/*-------------------------------------------------------------------*/
