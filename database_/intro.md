# Sample Data
- https://dev.mysql.com/doc/index-other.html
  - example databases의 world, sakila 사용

## Import Data
- sql 파일이 있는 폴더에서 실행하기
- database 만들기
```sql
  sql> create database world;
```

- 방법 1 : mysql 실행하여 가져오기

```sql
  sql> use world;
  sql> source world.sql
```

- 방법 2: mysql 명령어로 만들기

```bash
  $ mysql -u root -p world < world.sql

  $ mysql -u root -p sakila < sakila < sakila-schema.sql

  $ mysql -u root -p sakila < sakila < sakila-data.sql
```
