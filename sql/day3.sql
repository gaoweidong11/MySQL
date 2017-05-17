SHOW DATABASES; -- 列出数据库
USE db_1702; -- 运行数据库
SHOW TABLES; -- 显示数据库中的所有表

SHOW FULL COLUMNS FROM db_1702.student; -- 显示完整的列
SHOW FULL COLUMNS FROM db_1702.student_course;
SHOW FULL COLUMNS FROM db_1702.course;

SELECT *
FROM db_1702.student_course; -- 显示完整的表

SELECT *
FROM db_1702.student;

SELECT *
FROM db_1702.course;

TRUNCATE TABLE db_1702.student_course; -- 删除表中所有行

DELETE FROM db_1702.student_course; -- 将表中记录清空

DELETE FROM db_1702.student_course
WHERE id > 2; -- 删除ID> 2的 行

INSERT INTO db_1702.student
VALUES (NULL, 'tom', 'asdf', 'b', '18.0', '1.7', '123.456', '1999-5-1', '2017-05-16 10:39:01'); -- 向数据库表中插入数据

DROP TABLE IF EXISTS db_1702.student_course; --  删除表是否存在
CREATE TABLE db_1702.student_course (-- 创建一个数据库表
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  studentId INT COMMENT '学生 ID',
  courseId  INT COMMENT '课程 ID',
  score     INT COMMENT '考试成绩'
);

ALTER TABLE db_1702.student_course  -- 修改数据库表结构
  ADD CONSTRAINT                    -- 添加约束
  fk_student_course_studentId       -- 约束的名字
FOREIGN KEY (studentId)             -- 外键
REFERENCES db_1702.student (id);    -- 引用

ALTER TABLE db_1702.student_course
  ADD CONSTRAINT
  fk_student_course_courseId
FOREIGN KEY (courseId)
REFERENCES db_1702.course (id);

SHOW FULL COLUMNS FROM db_1702.student_course; -- 显示完整的列

INSERT INTO db_1702.student_course  -- 向数据库表中插入数据
VALUES (NULL, 1, 1, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 2, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL,2 , 1, NULL);

INSERT INTO db_1702.student_course
VALUES (NULL, 1, 3, NULL);

SELECT *
FROM db_1702.student_course;

