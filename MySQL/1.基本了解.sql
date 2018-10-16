--01 mysql 数据库的操作

    -- 链接数据库
    mysql -uroot -pmysql
    
    -- 不显示密码
    
    -- 退出数据库
    --quit/exit/ctrl + d
    exit

    -- sql语句最后需要有分号;结尾
    -- 显示数据库版本 version
    select version();
    

    -- 显示时间 now
    select now();
    
    -- 查看当前使用的数据库
    select database();
    

    -- 查看所有数据库
    show databases;
    show tables;
    

    -- 创建数据库
    -- create database 数据库名 charset=utf8;
    create database python18 charset = utf8;


    -- 查看创建数据库的语句
    -- show create database 数据库名
   
     show create database python18;

    -- 使用数据库
    -- use 数据库的名字
    use python18;

    -- 删除数据库
    -- drop database 数据库名;
    drop database python18;
   


--02 数据表的操作

    -- 查看当前数据库中所有表
    show tables;
   
    

    -- 创建表
    -- int unsigned 无符号整形
    -- auto_increment 表示自动增长
    -- not null 表示不能为空
    -- primary key 表示主键
    -- default 默认值
    -- create table 数据表名字 (字段 类型 约束[, 字段 类型 约束]);



    

    -- 查看表结构
    -- desc 数据表的名字;
    
   
    -- 创建 classes 表(id、name)
    create table classes(id int unsigned primary key auto_increment,name varchar(50) not null);
    
    
    -- 创建 students 表(id、name、age、high (decimal)、
    --gender (enum)、cls_id)
    create table students(id int unsigned primary key auto_increment,name varchar(50) not null,age int unsigned,
        high decimal(3,2),gender enum("男","女","妖","保密") default "保密",cls_id int unsigned);
  
    

    -- 查看表的创建语句
    -- show create table 表名字;
    show create table students;
    


    -- 修改表-添加字段 mascot (吉祥物)
    -- alter table 表名 add 列名 类型;
    alter table students add mascot varchar(30) not null;
   

    -- 修改表-修改字段：不重命名版
    -- alter table 表名 modify 列名 类型及约束;
   alter table students modify mascot varchar(50);
    


    -- 修改表-修改字段：重命名版
    -- alter table 表名 change 原名 新名 类型及约束;
    alter table students change mascot jxl int;


    -- 修改表-删除字段
    -- alter table 表名 drop 列名;
    alter table students drop jxl;
 
    


    -- 删除表
    -- drop table 表名;
    -- drop database 数据库;
    drop table students;
    drop database python18;
   
   

    
--03 增删改查(curd)

    -- 增加
+-------+------------------+------+-----+---------+----------------+
| Field | Type             | Null | Key | Default | Extra          |
+-------+------------------+------+-----+---------+----------------+
| id    | int(10) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(20)      | NO   |     | NULL    |                |
+-------+------------------+------+-----+---------+----------------+
        -- 全列插入
        -- insert [into] 表名 values(...)
        -- 主键字段 可以用 0  null   default 来占位
        -- 向classes表中插入 一个班级
        insert into 表名(字段名...) values(值...);

            insert into classes (id,name) values (0,"y1");

                insert into classes (name) values("y2");


        -- 向students表插入 一个学生信息
+--------+-------------------------------------+------+-----+---------+----------------+
| Field  | Type                                | Null | Key | Default | Extra          |
+--------+-------------------------------------+------+-----+---------+----------------+
| id     | int(10) unsigned                    | NO   | PRI | NULL    | auto_increment |
| name   | varchar(20)                         | NO   |     | NULL    |                |
| age    | int(10) unsigned                    | YES  |     | NULL    |                |
| high   | decimal(5,2)                        | YES  |     | NULL    |                |
| gender | enum('男','女','中性','保密')       | YES  |     | 保密    |                |
| cls_id | int(11)                             | YES  |     | NULL    |                |
+--------+-------------------------------------+------+-----+---------+----------------+
        -- 全部插入

        insert into students(id,name,age,high,gender,cls_id) values(0,'z3',18,1.6,'女',1);
        
        -- 部分插入
        -- insert into 表名(列1,...) values(值1,...)
        insert into students (name) values("z4");
            insert into students(name,gender) values("z5",1);
       

        -- 多行插入
        insert into students(name) values("j1"),("j2");
        
        


    -- 修改
    -- update 表名 set 列1=值1,列2=值2... where 条件;
        -- 全部修改
        update students set name = 't1';

        -- 按条件修改
        update students set name = 't2' where id = 4;
        
        -- 按条件修改多个值
        -- update students set gender ="",name = "xxx" where ;
        update students set name = 't3',gender = 2 where id = 5;
        
    -- 查询基本使用
        -- 查询所有列
        -- select * from 表名;
        select * from students;
        

        ---定条件查询    

        select * from students where id = 6;
        
        


        -- 查询指定列
        -- select 列1,列2,... from 表名;
        select name,gender from students;
        
        


        -- 可以使用as为列或表指定别名
        -- select 字段[as 别名] , 字段[as 别名] from 数据表;
        select name as '姓名' from students;
        
        select name  as  '姓名' from students;

        -- 字段的顺序
        select gender,name from students;
        
    

    -- 删除
        -- 物理删除
        -- delete from 表名 where 条件
        delete from students where id = 3;
      

        -- 逻辑删除
        -- 用一个字段来表示 这条信息是否已经不能再使用了
        -- 给students表添加一个 is_delete 字段 bit 类型
        --alter table 表名 add 字段 类型 default 默认值;
        alter table students add is_delete bit default 0;
        update students set is_delete = 1 where id = 5;

            select * from students where is_delete = 0 and id = 4;

        
        
    -- 数据库备份与恢复(了解)
        -- mysqldump –uroot –p 数据库名 > python.sql;
        -- mysql -uroot –p 新数据库名 < python.sql; # 注意导入的时候需要先要创建数据库
        mysqldump -uroot -p python18 > python18.sql;
        mysql -uroot -p python88 < python18.sql;


