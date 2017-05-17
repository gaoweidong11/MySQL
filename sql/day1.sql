SHOW DATABASES;    -- 显示数据库

CREATE DATABASE db_1702; -- 创建数据库

DROP DATABASE db_1702;  -- 删除数据库

USE db_1702;  -- 使用

SHOW TABLES;  --  显示表格

CREATE TABLE t_student (  -- 创建表格
  sno    VARBINARY(10),-- 可变长字符类型
  sname  VARBINARY(10),
  gender CHAR(1),
  age    INT(2)
);

SELECT *   -- 选择
FROM t_student;

INSERT INTO t_student  -- 插入数据库
VALUE ('2017001', '张三', '男', 18); -- 值
/*
Data Definition Language
数据定义语言

SELECT - extracts data from a database           选择
          从数据库提取数据
UPDATE - updates data in a database                 更新
        更新数据库中的数据
DELETE - deletes data from a database              删除
        从数据库中删除数据
INSERT INTO - inserts new data into a database    插入数据
              将新数据插入数据库
CREATE DATABASE - creates a new database        创建数据库
                  创建一个新的数据库
ALTER DATABASE - modifies a database            修改数据库
DROP DATABASE - deletes a database              删除数据库
CREATE TABLE - creates a new table                创建表
ALTER TABLE - modifies a table                   修改表
DROP TABLE - deletes a table                       删除表
CREATE INDEX - creates an index (search key)     增加索引
DROP INDEX - deletes an index                    删除索引
*/