DROP DATABASE IF EXISTS db_user; -- 如果存在数据库
CREATE DATABASE db_user; -- 创建数据库

DROP TABLE IF EXISTS db_user.user; -- 如果存在的话
CREATE TABLE db_user.user (-- 创建表
  id       INT                   AUTO_INCREMENT PRIMARY KEY  -- 自身增长   主键
  COMMENT 'ID PK',
  email    VARCHAR(191) UNIQUE   -- 独特的
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL  -- 不能为空
  COMMENT '账号',
  password VARCHAR(255) NOT NULL  -- 不能为空
  COMMENT '密码',
  role     VARCHAR(255) NOT NULL DEFAULT 'user'
  COMMENT '角色：user-用户； admin-管理员'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_user.message; -- 如果存在的话
CREATE TABLE db_user.message (-- 创建表
  id      INT               AUTO_INCREMENT PRIMARY KEY  -- 自身增长 主键
  COMMENT 'ID PK',
  content TEXT     NOT NULL   -- 不能为空
  COMMENT '内容',
  time    DATETIME NOT NULL DEFAULT now()   -- 时间不能为空   默认 现在的时间
  COMMENT '时间',
  userId  INT      NOT NULL  -- 不能为空
  COMMENT 'FK 用户ID'
)
  COMMENT '留言表';

ALTER TABLE db_user.message   -- 修改表
  ADD CONSTRAINT --  添加约束
  message_fk_userId
FOREIGN KEY (userId)  -- 外键
REFERENCES db_user.user (id); -- 引用

-- SQL
# 1. 用户注册
INSERT INTO db_user.user (email, username, password) VALUE ('tester@qq.com', 'Tom', '123');
    # 插入                                               值
SELECT *
FROM db_user.user; -- 查询

# 2. 登录判断
SELECT *
FROM db_user.user
WHERE email = 'tester@qq.com' AND password = '123';

# 3. 发布留言
INSERT INTO db_user.message (content, userId)  -- 插入
  VALUE ('留言内容1。。。', 1);    --  值
INSERT INTO db_user.message (content, userId)
  VALUE ('留言内容2。。。', 1);

SELECT *
FROM db_user.message;   -- 查询留言

# 4. 添加管理员
INSERT INTO db_user.user    --  插入
  VALUE (NULL, 'admin@qq.com', 'Jerry', '123', 'admin');

SELECT *
FROM db_user.user;   --  查询 管理员

# 5. 查询留言列表
SELECT
  u.username,
  m.content,
  m.time
FROM db_user.user u INNER JOIN db_user.message m
    ON u.id = m.userId;

# 6. 删除留言
DELETE FROM db_user.message
WHERE id = 2;

/*
<input type="hidden" name="id" value="2">
 */