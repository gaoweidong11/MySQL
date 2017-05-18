SHOW FULL COLUMNS FROM db_1702.student;

SELECT *
FROM db_1702.student;

INSERT INTO db_1702.student
VALUES (NULL, '20170005', 'tom', 'test', 'nv', 22, 1.8, 123.456, '1998-06-03', '2017-05-18 9:13');

INSERT INTO db_1702.student (name)
VALUES ('zhangsan');

INSERT INTO db_1702.student (name)
VALUES ('lisi'), ('wanwu'), ('zhaoliu');

SHOW CREATE TABLE db_1702.student;

SELECT *
FROM db_1702.student;

UPDATE db_1702.student
SET gender = '女';

UPDATE db_1702.student
SET height = 1.6
WHERE id = 1;

UPDATE db_1702.student
SET height = 1.7, name = '李四'
WHERE id = 3;

UPDATE db_1702.student
SET gender = '男'
WHERE id = 5;

UPDATE db_1702.student
SET sno = '2017007'
WHERE id = 7;

SELECT *
FROM db_1702.student;

DELETE FROM db_1702.student
WHERE id = '5';

DELETE FROM db_1702.student
WHERE age >= 20;

DELETE FROM db_1702.student
WHERE sno IS NULL;

DELETE FROM db_1702.student
WHERE sno = 20170004;

SHOW  DATABASES;  -- 显示所有的库

USE db_1702;  -- 运行数据库

SHOW TABLES ; -- 显示数据库中的所有表

SHOW TABLE STATUS FROM db_1702;  -- 显示库中所有表的信息

SHOW TABLE STATUS WHERE Name = 'db_1702.student.id';  -- 显示表的信息

SHOW FULL COLUMNS FROM student;  --  显示表中所有列的信息

SHOW FULL TABLES FROM db_1702;  -- 显示库中的表和视图

SHOW VARIABLES;  -- 显示变量

SHOW CREATE TABLE db_1702.student;  -- 显示建表语句

SHOW INDEX FROM db_1702.student;   -- 显示表中索引信息
# CREATE TABLE `student` (
#   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID PK',
#   `sno` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学号',
#   `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
#   `intro` text COLLATE utf8_unicode_ci COMMENT '简介',
#   `gender` char(2) COLLATE utf8_unicode_ci DEFAULT '男' COMMENT '性别',
#   `age` int(10) unsigned DEFAULT NULL COMMENT '年龄',
#   `height` double(3,2) DEFAULT NULL COMMENT '身高',
#   `price` decimal(10,3) DEFAULT NULL COMMENT '价格',
#   `dob` date DEFAULT NULL COMMENT '出生日期',
#   `time` datetime DEFAULT NULL COMMENT '时间',
#   PRIMARY KEY (`id`)
# ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci