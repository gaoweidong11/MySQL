DROP DATABASE IF EXISTS db_kaoshi;

CREATE DATABASE db_kaoshi;
# 用户注册表
DROP TABLE IF EXISTS db_kaoshi.zhuce;
CREATE TABLE db_kaoshi.zhuce (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  email    VARCHAR(255) COMMENT '邮箱' UNIQUE,
  ename    VARCHAR(255) COMMENT '用户名',
  password VARCHAR(255) COMMENT '密码'
)
  COMMENT '用户注册';

# 用户注册
INSERT INTO db_kaoshi.zhuce
VALUES (NULL, '705737253@qq.com', 'hello', '123345');

# 用户登录
SELECT *
FROM db_kaoshi.zhuce
WHERE email = '' AND password = '';

# 系统首页
# 你好：xxx
SELECT ename
FROM db_kaoshi.zhuce
WHERE email = '' AND password = '';
# 创建留言表
DROP TABLE IF EXISTS db_kaoshi.liuyan;

CREATE TABLE db_kaoshi.liuyan (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'ID PK',
  zhuceid  VARCHAR(255),
  email    VARCHAR(255) COMMENT '邮箱' UNIQUE,
  time     DATETIME,
  liuyan   VARCHAR(255),
  datatime INT NOT NULL
)
  COMMENT '留言表';

SELECT *
FROM db_kaoshi.liuyan; -- 查询留言表

# 添加外键
ALTER TABLE db_kaoshi.liuyan
  ADD CONSTRAINT
  liuyan_fk_zhuce
FOREIGN KEY (zhuceid)
REFERENCES db_kaoshi.liuyan (id);

# 添加留言
UPDATE db_kaoshi.liuyan
SET liuyan = 'xxxxxxxxx', datatime = current_time
WHERE zhuceid = '';

# 添加管理员
ALTER TABLE db_kaoshi.zhuce
  ADD COLUMN guanliyuan VARCHAR(255) DEFAULT 'null'
  AFTER id;
UPDATE db_kaoshi.zhuce
SET guanliyuan = zhuce.ename + '管理员'
WHERE id = '' AND email = '' AND password = '';

SELECT *
FROM db_kaoshi.zhuce z INNER JOIN db_kaoshi.liuyan l
    ON z.id = l.zhuceid;

# 删除
ALTER TABLE db_kaoshi.liuyan
  DROP COLUMN liuyan,
  DROP COLUMN time;
