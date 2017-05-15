SHOW DATABASES;    -- 显示数据库

CREATE DATABASE db_1702; -- 创建数据库

DROP DATABASE db_1702;  -- 删除数据库

USE db_1702;  -- 使用

SHOW TABLES;  --  显示表格

CREATE TABLE t_student (  -- 创建表格
  sno    VARBINARY(10),
  sname  VARBINARY(10),
  gender CHAR(1),
  age    INT(2)
);

SELECT *   -- 选择
FROM t_student;

INSERT INTO t_student  -- 插入数据库
VALUE ('2017001', '张三', '男', 18); -- 值
