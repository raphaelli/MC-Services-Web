CREATE TABLE WebInfo
(
WI_No_id INT PRIMARY KEY NOT NULL ,
WI_Site_title NVARCHAR(32) NOT NULL,
WI_Site_info NVARCHAR(128) NOT NULL,
WI_Show_text NVARCHAR(256),
WI_Show_img1 NVARCHAR(128) NOT NULL,
WI_Show_img2 NVARCHAR(128),
WI_Show_img3 NVARCHAR(128),
WI_Show_img4 NVARCHAR(128)
);

CREATE TABLE Users
(
Users_Id INT PRIMARY KEY NOT NULL,
Users_Level INT NOT NULL,
Users_Name NVARCHAR(32) NOT NULL,
Users_Pwd NVARCHAR(16) NOT NULL,
Users_Email NVARCHAR(64),
Users_Sex INT DEFAULT 0 NOT NULL,
Users_Birthday DATE,
Users_Cash MONEY NOT NULL,
Users_Avator NVARCHAR(128) NOT NULL,
Users_White INT NOT NULL,
Users_Del INT NOT NULL
);



CREATE TABLE Goods
(
Goods_Id INT PRIMARY KEY NOT NULL,
Goods_Info NVARCHAR(256) NOT NULL,
Goods_Img NVARCHAR(128) NOT NULL,
Goods_Nums INT NOT NULL,
Goods_Game_id NVARCHAR(8) NOT NULL,
Goods_Del INT NOT NULL
);

insert into Goods values(70000001,'ces01','ces01.png',999,'#12301',0);

CREATE TABLE Transaction_Log
(
Tr_Id INT PRIMARY KEY NOT NULL,
Tr_Num INT NOT NULL,
Users_Id INT FOREIGN KEY REFERENCES Users(Users_Id) NOT NULL,
Goods_Id INT FOREIGN KEY REFERENCES Goods(Goods_Id) NOT NULL,
Op_Check INT NOT NULL,
Check_Id NVARCHAR(8) NOT NULL,
);


CREATE TABLE Operating_Log
(
Op_Id INT PRIMARY KEY NOT NULL,
Users_Id INT FOREIGN KEY REFERENCES Users(Users_Id) NOT NULL,
Op_Info NVARCHAR(256)
);


DROP TABLE Operating_Log

insert into WebInfo values(1,'MikaCraft','公益 · 休闲 · 无收费','高度自由开放的沙盒世界，友爱互助，共同发展。定期投票更换周目，更多更新玩法，和朋友一起分享。 ','http://mdzz2333.cn/images/pic01.jpg','http://mdzz2333.cn/images/pic02.jpg','http://mdzz2333.cn/images/pic03.jpg','http://mdzz2333.cn/images/pic04.jpg');
 
 insert into Users values(10008888,2,'Admin','Pwd_123','admin@admin.com',0,'2002-08-26',0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values(10000001,0,'Qwerr','Pwd_123','qwerr@admin.com',1,'2002-08-26',0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values(10000002,0,'ASDQf','Pwd_123','ASDQf@admin.com',1,'2002-08-26',0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);
 insert into Users values(10000003,0,'AqwQf','Pwd_123','AqwQf@admin.com',1,'2002-08-26',0,'https://ns96.com/2017/08/21/PostsDemo/mcavator.png',0,0);

 
 insert into Goods values(70000001,'ces01','ces01.png',999,'#12301',0);
 insert into Goods values(70000002,'ces02','ces02.png',875,'#12231',0);
 insert into Goods values(70000003,'ces12','ces12.png',999,'#11013',0);
 insert into Goods values(70000004,'ces41','ces41.png',999,'#44301',0);
 insert into Goods values(70000005,'ces23','ces23.png',999,'#12301',0);

