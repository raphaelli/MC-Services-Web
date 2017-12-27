-- system用户连接
conn system

-- 创建表空间
CREATE  TABLESPACE McswDb
  DATAFILE '%ORACLE_HOME%\database\McswDb.dbf' 
      SIZE 100M  REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 300M 
  LOGGING 
  EXTENT MANAGEMENT LOCAL 
  SEGMENT SPACE MANAGEMENT AUTO
 ;


-- 创建用户 McswAdmin
 CREATE USER McswAdmin
   IDENTIFIED BY pwd_Mc123
   PROFILE "DEFAULT"
   DEFAULT TABLESPACE RSGLspace1
   ;

-- 授予权限
ALTER USER McswAdmin QUOTA  30M ON McswDb;

GRANT create session,create table TO McswAdmin;

-- 切换用户
conn McswAdmin/pwd_Mc123

--建表

-- WebInfo 站点信息表
CREATE TABLE WebInfo
(
"WI_No_id" VARCHAR2(4) NOT NULL,
"WI_Site_title" VARCHAR2(32) NOT NULL,
"WI_Site_info" VARCHAR2(128) NOT NULL,
"WI_Show_text" VARCHAR2(256),
"WI_Show_img1" VARCHAR2(128) NOT NULL,
"WI_Show_img2" VARCHAR2(128),
"WI_Show_img3" VARCHAR2(128),
"WI_Show_img4" VARCHAR2(128),
PRIMARY KEY ("WI_No_id") VALIDATE
);

-- Users 用户信息表
CREATE TABLE Users
(
"Users_Id" VARCHAR2(8) NOT NULL,
"Users_Level" NUMBER(1) NOT NULL,
"Users_Name" VARCHAR2(32) NOT NULL,
"Users_Pwd" VARCHAR2(16) NOT NULL,
"Users_Email" VARCHAR2(64),
"Users_Sex" NUMBER(1) NOT NULL,
"Users_Birthday" DATE,
"Users_Cash" NUMBER(6,2) NOT NULL,
"Users_Avator" VARCHAR2(128) NOT NULL,
"Users_White" NUMBER(1) NOT NULL,
"Users_Del" NUMBER(1) NOT NULL,
PRIMARY KEY ("Users_Id") VALIDATE
);

-- Goods 物品信息表
CREATE TABLE Goods
(
"Goods_Id" VARCHAR2(8) NOT NULL,
"Goods_Info" VARCHAR2(256) NOT NULL,
"Goods_Img" VARCHAR2(128) NOT NULL,
"Goods_Nums" NUMBER(4) NOT NULL,
"Goods_Game_id" VARCHAR2(8) NOT NULL,
"Goods_Del" NUMBER(1) NOT NULL,
PRIMARY KEY ("Goods_Id") VALIDATE
);

-- Transaction_Log 订单/交易记录
CREATE TABLE Transaction_Log
(
"Tr_Id" VARCHAR2(8) NOT NULL,
"Tr_Num" NUMBER(2) NOT NULL,
"Users_Id" VARCHAR2(8) NOT NULL,
"Goods_Id" VARCHAR2(8) NOT NULL,
"Op_Check" NUMBER(1) NOT NULL,
"Check_Id" VARCHAR2(8) NOT NULL,
PRIMARY KEY ("Tr_Id") VALIDATE,
FOREIGN KEY ("Users_Id") REFERENCES "USERS" ("Users_Id") VALIDATE,
FOREIGN KEY ("Goods_Id") REFERENCES "GOODS" ("Goods_Id") VALIDATE
);

-- Operating_Log 操作记录
CREATE TABLE Operating_Log
(
"Op_Id" VARCHAR2(8) NOT NULL,
"Users_Id" VARCHAR2(8) NOT NULL,
"Op_Info" VARCHAR2(256),
PRIMARY KEY ("Op_Id") VALIDATE,
FOREIGN KEY ("Users_Id") REFERENCES "USERS" ("Users_Id") VALIDATE
);



-- 初始数据
 insert into WebInfo values(1,'MikaCraft','公益 · 休闲 · 无收费','高度自由开放的沙盒世界，友爱互助，共同发展。定期投票更换周目，更多更新玩法，和朋友一起分享。 ','http://mdzz2333.cn/images/pic01.jpg','http://mdzz2333.cn/images/pic02.jpg','http://mdzz2333.cn/images/pic03.jpg','http://mdzz2333.cn/images/pic04.jpg');
 
 insert into Users values('10008888','2','Admin','Pwd_123','admin@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000001','0','Qwerr','Pwd_123','qwerr@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000002','0','ASDQf','Pwd_123','ASDQf@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000003','0','dqwqw','Pwd_123','dqwqw@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000004','0','qsadw','Pwd_123','qsadw@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000005','0','awefq','Pwd_123','awefq@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000006','0','zxcaw','Pwd_123','zxcaw@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000007','0','zxcqw','Pwd_123','zxcqw@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000008','0','gdere','Pwd_123','gdere@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values('10000009','0','qw123','Pwd_123','qw123@admin.com',1,to_date('2002-08-26','yyyy-mm-dd'),0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);

 insert into Goods values('ces01','ces01','ces01',999,'10000001',0);
 insert into Goods values('ces02','ces02','ces02',999,'10000002',0);
 insert into Goods values('ces03','ces03','ces03',999,'10000003',0);
 insert into Goods values('ces04','ces04','ces04',999,'10000004',0);
 insert into Goods values('ces05','ces05','ces05',999,'10000005',0);
 insert into Goods values('ces06','ces06','ces06',999,'10000007',0);
 insert into Goods values('ces07','ces07','ces07',999,'10000006',0);
 insert into Goods values('ces08','ces08','ces08',999,'10000008',0);
 insert into Goods values('ces09','ces09','ces09',999,'10000009',0);
 insert into Goods values('ces10','ces10','ces10',999,'10000010',0);

 insert into Transaction_Log values ('Trd00001',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00002',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00003',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00004',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00005',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00006',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00007',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00008',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00009',3,'10000001','ces03',1,'10008888');
 insert into Transaction_Log values ('Trd00010',3,'10000001','ces03',1,'10008888');

 insert into Operating_Log values('10008888','10000001','授权白名单');

 update USERS set "Users_Level"=1 where "Users_Id"='10000005';

 delete from Goods where "Goods_Id"='ces08';

-- 索引

-- 以购买的物品ID建立索引
 create INDEX Tr_idSy on Transaction_Log("Goods_Id") TABLESPACE McswDb;

-- 以用户级别建立索引
 create INDEX Us_lvSy on Users("Users_Level") TABLESPACE McswDb;

-- 以物品数量建立索引
 create INDEX Gd_giSy on Goods("Goods_Game_id") TABLESPACE McswDb;


-- 给予创建视图权限
conn system
GRANT create view TO McswAdmin;

-- 视图

-- 查询订单信息
create or replace view vw_Users_Buy
as 
select "Users_Id","Goods_Id","Tr_Num"
from Transaction_Log 
order by "Tr_Id";

-- 查询用户的订单
create or replace view vm_Tr_info
as
select "Users_Id","Goods_Id","Tr_Num"
from Transaction_Log 
order by "Users_Id";

-- 查库存
create or replace view vm_gd_num
as
select "Goods_Id","Goods_Nums","Goods_Game_id"
from Goods 
order by "Goods_Id";

-- PL/SQL程序块

-- 给予权限
GRANT CREATE ANY PROCEDURE TO McswAdmin;

--添加用户的存储过程
CREATE OR REPLACE PROCEDURE user_insert
  (u_id     IN   Users."Users_Id"%TYPE,
   u_lv     IN   Users."Users_Level"%TYPE,
   u_name   IN   Users."Users_Name"%TYPE,
   u_pwd    IN   Users."Users_Pwd"%TYPE,
   u_em     IN   Users."Users_Email"%TYPE,
   u_sex    IN   Users."Users_Sex"%TYPE,
   u_cash   IN   Users."Users_Cash"%TYPE,
   u_Ava    IN   Users."Users_Avator"%TYPE,
   u_Wi     IN   Users."Users_White"%TYPE,
   u_de     IN   Users."Users_Del"%TYPE
   )
IS
BEGIN
 insert into Users('Users_Id',Users_Level,'Users_Name','Users_Pwd','User_Email',Users_Sex,Users_Cash,'Users_Avator',Users_White,Users_Del) 
        values(u_id,u_lv,u_name,u_pwd,u_em,u_sex,u_cash,u_Ava,u_Wi,u_de);
 commit;
END user_insert;


--输入Users表的各个字段信息
declare
   u_id   Users."Users_Id"%TYPE,
   u_lv   Users."Users_Level"%TYPE,
   u_name Users."Users_Name"%TYPE,
   u_pwd  Users."Users_Pwd"%TYPE,
   u_em   Users."Users_Email"%TYPE,
   u_sex  Users."Users_Sex"%TYPE,
   u_cash Users."Users_Cash"%TYPE,
   u_Ava  Users."Users_Avator"%TYPE,
   u_Wi   Users."Users_White"%TYPE,
   u_de   Users."Users_Del"%TYPE
begin
  u_id:=&id;
  u_lv:=&lv;
  v_name:=&name;
  u_pwd:=&pwd;
  u_em:=&em;
  u_sex:=&sex;
  u_cash:=&cash;
  u_Ava:=&ava;
  u_Wi:=&wi;
  u_de:=&de;
  user_insert(u_id,u_lv,v_name,u_pwd,u_em,u_sex,u_cash,u_Ava,u_Wi,u_de);
  DBMS_OUTPUT.PUT_LINE('用户添加成功！');
end;
/


GRANT CREATE ANY  TRIGGER, create ANY  sequence TO McswAdmin;



--序列
create sequence Users_sequence
   increment by 1 
   start with 10000020 
   nomaxvalue
   nocycle
   nocache

--触发器
CREATE TRIGGER Users_idadd
   BEFORE INSERT ON Users
   FOR EACH ROW
   WHEN(NEW."Users_Id" is null) --当输入ID为空时启动触发器
BEGIN
    select Users_sequence.nextval into :new."Users_Id" from sys.dual;
END;



--创建good_check函数，检查商品的对应游戏物品ID
CREATE OR REPLACE FUNCTION good_check
(f_goodsid Goods."Goods_Id"%type
)
RETURN Goods."Goods_Game_id"%TYPE
AS
    v_g_rname Goods."Goods_Game_id"%TYPE;
BEGIN
   select "Goods_Game_id" into v_g_rname FROM Goods 
         where "Goods_Id"=f_goodsid;
   RETURN  v_g_rname ;
EXCEPTION 
   WHEN NO_DATA_FOUND THEN
       DBMS_OUTPUT.PUT_LINE('没有找到对应游戏物品!');
END good_check;

--调用good_check输入Goods_Id和Goods_Game_id检查商品的对应游戏物品ID
select good_check('ces01') from dual;
