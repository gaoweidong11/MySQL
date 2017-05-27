SELECT
  -- 平均值
  AVG(SAL),
  -- 最小值
  min(SAL),
  -- 最大值
  max(SAL),
  -- 所有值之和
  sum(SAL),
  -- 非NULL值的个数
  count(comm)
FROM scott.emp;

SELECT DEPTNO,max(SAL)
FROM scott.emp
GROUP BY DEPTNO;  -- 分组  最高工资

SELECT SAL
FROM scott.emp;

SELECT ABS(-100);                -- 返回 x 的绝对值
  SELECT BIN(15);                -- 返回 x 的二进制（OCT 返回八进制，HEX 返回十六进制）
SELECT CEILING(1.000000001);     -- 返回大于 x 的最小整数值
SELECT EXP(111111);              -- 返回值 e（自然对数的底）的 x 次方
SELECT FLOOR(1.999999);          -- 返回小于 x 的最大整数值
SELECT GREATEST(2,5,999,4);      -- 返回集合中最大的值
SELECT LEAST(34,554,35246);      -- 返回集合中最小的值
SELECT LN(23);                   -- 返回 x 的自然对数
SELECT LOG(23,535);              -- 返回 x 的以 y 为底的对数
SELECT MOD(23,2432);             -- 返回 x / y 的模（余数）
SELECT PI() ;                    -- 返回 PI 的值（圆周率）
SELECT RAND() ;                  -- 返回 ０ 到 １ 内的随机值,可以通过提供一个种子参数使随机数生成器生成一个指定的值
SELECT ROUND(123.35234,4);       -- 返回参数 x 的四舍五入的有 y 位小数的值
SELECT SIGN(2324);               -- 返回代表数字 x 的符号的值
SELECT SQRT(2323);               --  返回一个数的平方根
SELECT TRUNCATE(1234.4546,4);    -- 返回数字 x 截短为 y 位小数的结果

