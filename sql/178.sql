# 1.显示所有好友基本信息，包括：
#      姓名
#     性别
#     生日
#     手机
#    住址
#     微信
#     QQ
#     工作或学习的地点
#     爱好
#     认识时间
#     认识方式
#     特点
#     亲密程度 （亲密-一般：1-10）
DROP TABLE IF EXISTS db_ceshi.friends;
CREATE TABLE db_ceshi.friends (
  id             INT(10)     NOT NULL  UNIQUE  PRIMARY KEY
  COMMENT 'id PK',
  name           VARCHAR(20) NOT NULL
  COMMENT '姓名',
  gender         VARCHAR(4) COMMENT '性别',
  dob            YEAR COMMENT '出生日期',
  mobile         VARCHAR(20) COMMENT '手机',
  address        VARCHAR(50) COMMENT '地址',
  weixin         VARCHAR(20) COMMENT '微信',
  qq             INT COMMENT 'QQ',
  workplace      VARCHAR(255) COMMENT '工作或学习的地址',
  hobby          VARCHAR(255) COMMENT '爱好',
  understanding  DATETIME COMMENT '认识时间',
  characteristic VARCHAR(255) COMMENT '特点',
  intimacy       INT COMMENT '亲密程度'
)
  COMMENT '好友基本信息表';
# 2.记录每一次与朋友沟通时的信息，包括：
#       沟通时间
#       沟通方式
#       沟通内容
#       TA 当前的工作或学习的地点
#       当前的亲密程度
DROP TABLE IF EXISTS db_ceshi.Communicate;
CREATE TABLE db_ceshi.Communicate (
  id          INT(10) NOT NULL  UNIQUE  PRIMARY KEY  AUTO_INCREMENT,
  nameId      INT     NOT NULL
  COMMENT 'FK  他的名字',
  time        DATE COMMENT '沟通时间',
  mode        VARCHAR(255) COMMENT '沟通方式',
  content     VARCHAR(255) COMMENT '沟通内容',
  t_workplace VARCHAR(255) COMMENT 'TA 当前的工作或学习的地点',
  current     INT COMMENT '当前的亲密程度'
)
  COMMENT '与朋友沟通时的信息表';
#  3.  创建表和关联

#  4.  添加样本数据

#  5.  查询所有朋友及每次沟通记录

#  6. 列出一个朋友的工作或学习的变迁

#  7. 计算每个朋友的平均亲密程度，降序排序



