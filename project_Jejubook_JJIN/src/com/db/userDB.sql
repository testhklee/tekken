


drop table jejuuserdb;

create table jejuuserdb (
name varchar2(50) not null,
emailorphone varchar2(100) not null,
password varchar2(100) not null,
birth varchar2(100) not null,
gender number(5) not null,
enabled varchar2(2) not null,
role varchar2(20) not null,
userdate date not null,
constraint jejuuserdb_pk primary key (emailorphone),
constraint jejuuserdb_enabled_chk check(enabled in ('Y','N'))
);

insert into jejuuserdb values('이의택','slowlee@naver.com','slow','19910324','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택','aaa','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택1','baaa001','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택1','baaa002','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택0','baaa003','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택0','baaa004','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택0','baaa005','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택0','baaa006','aaa','1991-03-24','1','Y','admin',sysdate);
insert into jejuuserdb values('이의택0','baaa007','aaa','1991-03-24','1','Y','admin',sysdate);


select * from jejuuserdb;

SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT * FROM jejuuserdb) A WHERE ROWNUM <= 10) WHERE RNUM >= 6 order by RNUM desc;

SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT * FROM jejuuserdb order by ROWNUM desc) A WHERE ROWNUM <= 5) WHERE RNUM >= 1;

