DROP DATABASE IF EXISTS db_ceshi;
CREATE DATABASE db_ceshi;
# Student 表的定义
#     id
#     name
#     gender
#     dob出生日期
#     department系名称
#     address
# Score 表的定义
#     id
#     studentId
#     course课程名
#     grade
# 创建student和score表
DROP TABLE IF EXISTS db_ceshi.student;
CREATE TABLE db_ceshi.student (
  id         INT(10)     NOT NULL  UNIQUE  PRIMARY KEY
  COMMENT 'id PK',
  name       VARCHAR(20) NOT NULL
  COMMENT '名字',
  gender     VARCHAR(4) COMMENT '性别',
  dob        YEAR COMMENT '出生日期',
  department VARCHAR(20) COMMENT '系名称',
  address    VARCHAR(50) COMMENT '地址'
)
  COMMENT '学生表';

DROP TABLE IF EXISTS db_ceshi.score;
CREATE TABLE db_ceshi.score (
  id        INT(10) NOT NULL  UNIQUE  PRIMARY KEY  AUTO_INCREMENT,
  studentId INT(10) NOT NULL
  COMMENT '学生 FK',
  course    VARCHAR(20) COMMENT '课程名',
  grade     INT(10) COMMENT '成绩'
)
  COMMENT '得分表';

# 创建合理的外键关联

/*ALTER TABLE db_ceshi.student
  ADD CONSTRAINT
  student_fk_studentId
FOREIGN KEY (studentId)
REFERENCES db_ceshi.score (id);*/

# 为student表和score表各增加5条记录
INSERT INTO db_ceshi.student VALUES (2017001, '张老大', '男', 1995, '计算机系', '北京市海淀区');
INSERT INTO db_ceshi.student VALUES (2017002, '张老二', '男', 1996, '电子系', '北京市昌平区');
INSERT INTO db_ceshi.student VALUES (2017003, '张三', '女', 1997, '电子系', '湖南省永州市');
INSERT INTO db_ceshi.student VALUES (2017004, '李四', '男', 1997, '英语系', '辽宁省阜新市');
INSERT INTO db_ceshi.student VALUES (2017005, '王六', '男', 1991, '计算机系', '湖南省衡阳市');

INSERT INTO db_ceshi.score VALUES (NULL, 2017001, '计算机', 98);
INSERT INTO db_ceshi.score VALUES (NULL, 2017001, '英语', 80);
INSERT INTO db_ceshi.score VALUES (NULL, 2017002, '计算机', 65);
INSERT INTO db_ceshi.score VALUES (NULL, 2017002, '电子', 88);
INSERT INTO db_ceshi.score VALUES (NULL, 2017003, '电子', 95);
# 查询student表的所有记录
SELECT *
FROM db_ceshi.student;
# 查询student表的第2条到4条记录
SELECT *
FROM db_ceshi.student
LIMIT 1, 3;
# 从student表查询所有学生的学号（id）、姓名（name）和院系（department）的信息
SELECT
  id,
  name,
  department
FROM db_ceshi.student;
# 从student表中查询计算机系和电子系的学生的信息
SELECT *
FROM db_ceshi.student
WHERE department IN ('计算机系', '电子系');
# 从student表中查询年龄18~22岁的学生信息
SELECT
  id,
  name,
  gender,
  2017 - dob AS age,
  department,
  address
FROM db_ceshi.student
WHERE 2017 - dob BETWEEN 18 AND 22;
# 从student表中查询每个院系有多少人
SELECT
  department,
  COUNT(id)
FROM db_ceshi.student
GROUP BY department;
# 从score表中查询每个科目的最高分
SELECT
  course,
  MAX(grade)
FROM db_ceshi.score
GROUP BY course;
# 查询李四的考试科目（course）和考试成绩（grade）
SELECT
  course,
  grade
FROM db_ceshi.score
WHERE studentId =
      (SELECT id
       FROM db_ceshi.student
       WHERE name = '李四');
# 用连接的方式查询所有学生的信息和考试信息
SELECT
  student.id,
  name,
  gender,
  dob,
  department,
  address,
  course,
  grade
FROM db_ceshi.student, db_ceshi.score
WHERE student.id = score.studentId;
# 计算每个学生的总成绩
SELECT
  student.id,
  name,
  SUM(grade)
FROM db_ceshi.student, db_ceshi.score
WHERE student.id = score.studentId
GROUP BY id;
# 计算每个考试科目的平均成绩
SELECT
  course,
  AVG(grade)
FROM db_ceshi.score
GROUP BY course;
# 查询计算机成绩低于95的学生信息
SELECT *
FROM db_ceshi.student
WHERE id IN
      (SELECT studentId
       FROM db_ceshi.score
       WHERE course = '计算机' AND grade < 95);
# 查询同时参加计算机和英语考试的学生的信息
SELECT *
FROM db_ceshi.student
WHERE id = ANY
      (SELECT studentId
       FROM db_ceshi.score
       WHERE studentId IN (
         SELECT studentId
         FROM
           db_ceshi.score
         WHERE course = '计算机')
             AND course = '英语');
# 将计算机考试成绩按从高到低进行排序
SELECT
  studentId,
  grade
FROM db_ceshi.score
WHERE course = '计算机'
ORDER BY grade DESC;
# 从student表和score表中查询出学生的学号，然后合并查询结果
SELECT id
FROM db_ceshi.student
UNION
SELECT studentId
FROM db_ceshi.score;
# 查询姓张或者姓王的同学的姓名、院系和考试科目及成绩
SELECT
  student.id,
  name,
  gender,
  dob,
  department,
  address,
  course,
  grade
FROM db_ceshi.student, db_ceshi.score
WHERE
  (name LIKE '张%' OR name LIKE '王%')
  AND
  student.id = score.studentId;
# 查询都是湖南的学生的姓名、年龄、院系和考试科目及成绩
SELECT
  student.id,
  name,
  gender,
  dob,
  department,
  address,
  course,
  grade
FROM db_ceshi.student, db_ceshi.score
WHERE address LIKE '湖南%' AND
      student.id = score.studentId;