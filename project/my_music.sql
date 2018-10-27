#设置编码格式
SET NAMES UTF8;
#丢弃数据库music，如果它存在的话
DROP DATABASE IF EXISTS music;
#创建数据库music
CREATE DATABASE music CHARSET UTF8;
#进入数据库
USE music;
#创建数据表
#网站基本信息表
CREATE TABLE my_music_info(
	music_name  VARCHAR(16),
	logo VARCHAR(64),
	admin_email VARCHAR(64),
	icp VARCHAR(32),
	copyright VARCHAR(64)
);
INSERT INTO my_music_info VALUES('图图音乐网','img/logo.png','admin@tutu.com','京ICP证090856788','版权所有@2010-2017 图图音乐网'
);
#导航表
CREATE TABLE my_music_item(
	mid INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(16),
	url  VARCHAR(128),
	title VARCHAR(32),
	parent INT #设置二级菜单
);
INSERT INTO my_music_item VALUES
(1,'首页','/index.html','跳转到网站首页',1),
(NULL,'发现音乐','/found.html','随时随地玩音乐',1),
(NULL,'我的音乐','/my_music.html','我的音乐',1),
(NULL,'朋友','/friend.html','Ta的爱',1),
(NULL,'商城','/store.html','商城',1),
(NULL,'音乐人','/person.html','爱自己爱音乐',1);
#用户表
CREATE TABLE my_music_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname  VARCHAR(16),
	upwd   VARCHAR(16),
	email  VARCHAR(64),
	gender BOOL
);
INSERT INTO my_music_user VALUES
(1,'dingding','111111','dingding@163.cn',1),
(NULL,'tingting','111111','tingting@163.cn',0),
(NULL,'kongkong','111111','kongkong@163.cn',1),
(NULL,'mingming','111111','mingming@163.cn',0),
(NULL,'ningning','111111','ningning@163.cn',1),
(NULL,'bingbing','111111','bingbing@163.cn',0),
(NULL,'lilei','111111','lileililei@163.cn',0),
(NULL,'yuyu','111111','yuyu@163.cn',1),
(NULL,'mary','111111','marykill@163.cn',0),
(NULL,'wingwing','111111','wingwing@163.cn',1),
(NULL,'qingqing','111111','qingqing@163.cn',0),
(NULL,'huanghuang','111111','huanghuang@163.cn',0),
(NULL,'jiajia','111111','jiajia@163.cn',1),
(NULL,'jerry','111111','jerry@163.cn',0),
(NULL,'jingjing','111111','jingjing@163.cn',1),
(NULL,'lingling','111111','lingling@163.cn',0),
(NULL,'hanhan','111111','hanhan@163.cn',0),
(NULL,'junjun','111111','junjun@163.cn',1),
(NULL,'pengpeng','111111','pengpeng@163.cn',0),
(NULL,'yingying','111111','yingying@163.cn',1),
(NULL,'fengfeng','111111','fengfeng@163.cn',0),
(NULL,'kuikui','111111','kuikui@163.cn',1);
#首页轮播图片表
CREATE TABLE index_carousel(
  cid int(11) PRIMARY KEY auto_increment,
  img varchar(128) default NULL,
  title varchar(64) default NULL,
  href varchar(128) default NULL
);
INSERT INTO index_carousel VALUES ('1', 'img/index/banner01.jpg', '轮播广告商品1', 'product_details.html?lid=28');
INSERT INTO index_carousel VALUES ('NULL', 'img/index/banner02.jpg', '轮播广告商品2', 'product_details.html?lid=19');
INSERT INTO index_carousel VALUES ('NULL', 'img/index/banner03.jpg', '轮播广告商品3', 'lookforward.html');
INSERT INTO index_carousel VALUES ('NULL', 'img/index/banner04.jpg', '轮播广告商品4', 'lookforward.html');
#音乐热门推荐表
CREATE TABLE hot_pushMusic(
	pid int(11) PRIMARY KEY auto_increment,
	img varchar(128) default NULL,
	visit BIGINT,
	title varchar(64) default NULL,
	href varchar(128) default NULL
);
INSERT INTO hot_pushMusic VALUES('1',  'img/index/m1.jpg', '116万','2018年9月榜单TOP50', 'details.html');
INSERT INTO hot_pushMusic VALUES ('NULL', 'img/index/m2.jpg','108万','喜欢一个人 | 该以什么方式告诉她', 'product_details.html?lid=19');
INSERT INTO hot_pushMusic VALUES ('NULL', 'img/index/m3.jpg','106万','【游戏原声】屏幕之后，更是另一个世界', 'lookforward.html');
INSERT INTO hot_pushMusic VALUES ('NULL', 'img/index/m4.jpg','1016万','午睡音药 | 与空调被一同服用效果更佳', 'lookforward.html');
INSERT INTO hot_pushMusic VALUES('NULL',  'img/index/m5.jpg', '116万','2018年9月榜单TOP50', 'details.html');
INSERT INTO hot_pushMusic VALUES ('NULL', 'img/index/m6.jpg','108万','喜欢一个人 | 该以什么方式告诉她', 'product_details.html?lid=19');
INSERT INTO hot_pushMusic VALUES ('NULL', 'img/index/m7.jpg','106万','【游戏原声】屏幕之后，更是另一个世界', 'lookforward.html');
INSERT INTO hot_pushMusic VALUES ('NULL', 'img/index/m8.jpg','1016万','午睡音药 | 与空调被一同服用效果更佳', 'lookforward.html');
#侧边栏歌手信息表
CREATE TABLE side_singer(
	pid int(11) PRIMARY KEY auto_increment,
	img varchar(128) default NULL,
	sname varchar(32) default NULL,
	title varchar(64) default NULL,
	href varchar(128) default NULL
);
INSERT INTO side_singer VALUES('1',     'img/index/side1.jpg','张惠妹','台湾歌手张惠妹', 'product_details.html?lid=28');
INSERT INTO side_singer VALUES ('NULL', 'img/index/side2.jpg','Fine乐团','独立音乐人', 'product_details.html?lid=19');
INSERT INTO side_singer VALUES ('NULL', 'img/index/side3.jpg','禹晓利','民谣歌手 中国风', 'lookforward.html');
INSERT INTO side_singer VALUES ('NULL', 'img/index/side4.jpg','音乐人赵雷','民谣歌手', 'lookforward.html');
INSERT INTO side_singer VALUES ('NULL', 'img/index/side5.jpg','王三溥','音乐人', 'lookforward.html');