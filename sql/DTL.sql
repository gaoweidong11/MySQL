START TRANSACTION;

SELECT *
FROM scott.emp;
DELETE FROM scott.emp;
TRUNCATE TABLE scott.emp;

ROLLBACK;

START TRANSACTION;  --  开始事务处理

UPDATE scott.emp
SET SAL = SAL + 1000
WHERE ENAME = 'allen';

UPDATE scott.emp
SET SAL = SAL - 1000
WHERE ENAME = 'ward';

COMMIT;  -- 提交

ROLLBACK;  -- 回滚

SELECT *
FROM scott.emp; -- 查询


-- save point 保留点
START TRANSACTION;  -- 开始事务

UPDATE scott.emp   -- 更新 数据库名
SET ename = 'ALLEN'  -- 设置 列名
WHERE EMPNO = 7499;  --  如果  员工号

SAVEPOINT a;   -- 保留点  a

DELETE FROM scott.emp
WHERE EMPNO = 7499;  -- 删除 员工号

SAVEPOINT b;  -- 保留点b

INSERT INTO scott.emp (EMPNO, ENAME)
  VALUE (1234, 'tester');  -- 插入 员工号  名字

SAVEPOINT c;  -- 保留点 c

DELETE FROM scott.emp;  -- 删除  数据库

COMMIT;  -- 提交
ROLLBACK TO a;  -- 回滚到a
ROLLBACK;  -- 回滚

SELECT *
FROM scott.emp;
