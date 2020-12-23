# Server - Database - Table

# create
# 1-1. 데이터 베이스

show databases;

# 생성

create database test;

# 선택
use test;

# 현재 확인
select database();

# 1-2. table
create table user1(
	user_id INT
	,name Varchar(20)
	,email varchar(30)
	,age int(3)
	,rdate DATE
);

create table user2(
	user_id INT primary key auto_increment
	,name Varchar(20) not null
	,email varchar(30) unique not NULL
	,age int(3) default '30'
	,rdate timestamp
);

# 2. 수정 Alter

# 2-1. 데이터 베이스 
show variables like "character_set_database";
alter database test character set = utf8;

# 2-2. 테이블
alter table user2 add tmp text;
alter table user2 modify column tmp int(3);
alter table user2 drop tmp;

# 3. Drop

# 3-1 데이터 베이스 삭제
create database tmp;
drop database tmp;
show databases;

# 3-2 테이블
drop table user3;
select database();

# 4. insert

insert into user1(user_id, name, email, age, rdate)
value(1, "fjin", "jin@mgmail.com", 32, now())
,(2, "ejin", "jin2@mgmail.com", 31, now())
,(3, "gjin", "jin3@mgmail.com", 23, now())
,(4, "hjin", "jin4@mgmail.com", 12, now())
;

select now();

# 5. select : 데이터 조회

select user_id, name, age
from user1;

select * from user1;

select user_id as "아이디", name as "이름", age as "나이" from user1;

# distinct 중복제거

select distinct(name)
from user1;

# where 조건 검색
# 30세 이상인 사용자를 중복 제거하여 검색
select count(distinct(name))
from user1
where age >= 32;

select *
from user1
where age > 20 and age < 40;

# between a and b
select *
from user1
where age between 20 and 40;

# order by 정렬
select *
from user1
order by age desc;

# 나이가 20세에서 40세 사이에 있는 사용자를 이름기준 내림차순으로 정렬, 중복 데이터 제거해서 출력
select distinct(name)
from user1
where age between 20 and 40
order by name desc;

# concat
select name, age, concat(name, "(",age,")") as "name_age"
from user1;

# like : where 절에서 특정 문자열이 들어간 데이터 조회
select *
from user1
where email not like "%net";
# where email like "%@gmail.%"
# % : 문자 존재


# in : 여러 개의 조건을 조회할 때 사용
select *
from user1
where name in("andy","petet","po");


## 서브쿼리
select *
from user1
where name in (
	select distinct(name)
	from user1
	where age > 30
);


#limit
select *
from user1
limit 3;

select *
from user1
limit 3,5;


# 6. update

update user1
set age = 20, rdate = "20191212"
where age between 20 and 29;

select *
from user1
where age between 20 and 29;

# 7. delete

delete from user1
where rdate > "2019-11-01";

select *
from user1;


## quiz


# 1. 
select distinct (`Continent`)
from country;

# 2.
select name, population
from city
where countrycode = 'KOR' and population > 1000000
order by population desc
;

# 3.
select c.name, c.`CountryCode`, c.`Population`
from city c
where c.`Population` between 8000000 and 10000000
order by population DESC
;

# 4.
select c.`Code`, concat(c.name,"(", c.`IndepYear`, ")") as 'Name(Indep)', c.continent, c.population
from country c
where c.indepyear between 1940 and 1950
order by indepyear, population desc
;

# 5.

select *
from `countrylanguage`
limit 1;

select countrycode, language, percentage
from (
	select cl.countrycode, cl.language, cl.percentage
	from countrylanguage cl
	where cl.language in ('English', 'Korean','Spanish')
) as cl
where percentage >= 95 
order by percentage desc
;

# 6.
select co.code, co.name, co.continent, co.governmentform, co.population
from (
	select co.code, co.name, co.continent, co.governmentform, co.population
	from country co
	where `Code` like "A%"
) co
where governmentform like "%Republic%" 
;


## having

select continent, sum(population)
from country
group by continent
having sum(population) > 500000000;


## quiz 2

# 1.
select count(distinct continent) as count
from country
;


# 2.
select continent, count(continent) as count
from country
group by continent
order by count desc
;


# 3.
select countrycode , sum(population) as population
from city
group by countrycode
having population > 50000000
order by population desc
;


# 4.
select cl.language, count(cl.language) as count
from countrylanguage cl
group by cl.language
order by count desc
limit 4, 6
;


# 5.
select cl.language, count(cl.language) as count
from countrylanguage cl
group by cl.language
having count >= 15
order by count desc
;


# 6.
select continent, sum(surfacearea) as surfacearea
from country
group by continent
order by surfacearea desc
;

