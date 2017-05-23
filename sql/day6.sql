CREATE VIEW scott.v_emp
AS
  SELECT
    JOB,
    HIREDATE,
    SAL
  FROM scott.emp
  WHERE DEPTNO = 20;

USE scott;

SHOW TABLES;

DROP VIEW v_emp;

SELECT *
FROM scott.v_emp;

UPDATE scott.v_emp
SET HIREDATE = '1981-5-1'WHERE HIREDATE = '1981-4-2';
