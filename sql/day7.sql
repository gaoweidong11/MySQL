SHOW DATABASES;
DROP DATABASE db_exam;
CREATE DATABASE db_exam;
USE db_exam;
# 使用合理的数据类型、约束和规范的语句创建以上各表
# 表（一）Student (学生表)
CREATE TABLE Student
(
  id           INT PRIMARY KEY
  COMMENT 'ID',
  name         VARCHAR(255)
  COMMENT '姓名',
  age          INT UNSIGNED
  COMMENT '年龄',
  gender       CHAR(2) DEFAULT '男'
  COMMENT '性别',
  dob          DATE COMMENT '出生日期',
  departmentId CHAR(10) COMMENT '部门'
);
# 表（二）Course（课程表）
CREATE TABLE course
(
  id     INT PRIMARY KEY
  COMMENT 'ID',
  title  VARCHAR(10) COMMENT '课程名称',
  credit CHAR(3) COMMENT '学分'
);
# 表（三）department (系别表)
CREATE TABLE department
(
  id    INT,
  title CHAR(5) COMMENT '系名称',
  tel   INT COMMENT '电话'
);
# 写出查询各表字段注释、各表名注释的语句
-- 查询学生表
SELECT *
FROM course;
--  查询课程表
SELECT *
FROM Student;
-- 查询系别表
SELECT *
FROM department;
# 为各表添加 5 条样本数据
INSERT INTO Student VALUES
  (2017001, '曾华', 18, '男', '1977-09-01', 95033);
INSERT INTO Student VALUES
  (2017002, '匡明', 19, '男', '1975-10-02', 95031);
INSERT INTO Student VALUES
  (2017003, '王丽', 13, '女', '1976-01-23', 95033);
INSERT INTO Student VALUES
  (2017004, '李军', 17, '男', '1976-02-20', 95033);
INSERT INTO Student VALUES
  (2017005, '王芳', 19, '女', '1975-02-10', 95031);

INSERT INTO Course VALUES
  (001, '计算机导论', 825);
INSERT INTO Course VALUES
  (002, '操作系统', 804);
INSERT INTO Course VALUES
  (003, '数字电路', 856);
INSERT INTO Course VALUES
  (004, '高等数学', 831);
INSERT INTO Course VALUES
  (005, '高等函数', 833);

INSERT INTO department VALUES
  (NULL, '3-245', 5351001);
INSERT INTO department VALUES
  (NULL, '3-245', 5351002);
INSERT INTO department VALUES
  (NULL, '3-245', 5351003);
INSERT INTO department VALUES
  (NULL, '3-105', 5351004);
INSERT INTO department VALUES
  (NULL, '3-105', 5351005);

# 修改选课表 grade 字段，改名为 score
ALTER TABLE db_exam.Student
  CHANGE gender score VARCHAR(255);
# 查询Student表中姓“王”的同学记录。
SELECT *
FROM Student
WHERE name REGEXP '王';

# 删除各表，删除数据库
DELETE FROM db_exam.course;
DELETE FROM db_exam.department;
DELETE FROM db_exam.Student;

DROP DATABASE db_exam;
