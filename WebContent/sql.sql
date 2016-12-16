create database question;
use question;
create table Lquestion(
		question char(25) not null,
		id char(5) not null);
create table Lanswer(
		id char(5) not null,
		answer char(100) not null);