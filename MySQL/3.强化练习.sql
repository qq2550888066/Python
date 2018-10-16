 -- sql强化演练( goods 表练习)

-- 查询类型 cate_name 为 '超级本' 的商品名称 name 、价格 price 

select name,price from goods where cate_name = "超级本";

-- 显示商品的种类
-- 1 分组的方式( group by ) 
select cate_name from goods group by cate_name;



-- 2 去重的方法( distinct )
select distinct cate_name from goods;



-- 求所有电脑产品的平均价格 avg ,并且保留两位小数( round )
select round(avg(price),2) as price_avg from goods;

-- 显示 每种类型 cate_name (由此可知需要分组)的 平均价格

select cate_name,avg(price) from goods group by cate_name;


-- 查询 每种类型 的商品中 最贵 max 、最便宜 min 、平均价 avg 、数量 count
select cate_name,max(price),min(price),avg(price),count(*) from goods group by cate_name;

-- 查询所有价格大于 平均价格 的商品，并且按 价格降序 排序 order desc
--1.平均价格
select avg(price) from goods;


--2.大于平均价格
select * from goods where price > (select avg(price) from goods);


-- 查询每种类型中最贵的电脑信息(难)

-- 1 查找 每种类型 中 最贵的 max_price 价格
select cate_name,max(price) from goods group by cate_name;


-- 2 关联查询
select * from goods inner join (select cate_name,max(price) as price_max from goods group by cate_name) as max_goods
on goods.cate_name = max_goods.cate_name and goods.price = max_goods.price_max;



--第四部 修改表结构(重点是思路)

-- 创建表格的格式
--create table if not exists 表名 (
--id int unsigned primary key auto_increment, 这个是主键
--name varchar(40) not null); 这个名称


--第一步 创建 "商品种类表" -goods_cates
--id跟名称
create table goods_cates(id int unsigned primary key auto_increment,name varchar(30));


--第二步 创建 "商品品牌表" -goods_brands
--id跟名称
create table goods_brands(id int unsigned primary key auto_increment,name varchar(30));



--第三步 更新种类信息表
--1. 要把类型查询出来
select cate_name from goods group by cate_name;


--2. 批量插入数据 
--insert into goods (name) values('123');
# 插入是明确的数据
-- insert into goods(name) values("123");
	# 插入使用查询出来的数据

	-- insert into goods(name) (查询语句);

	insert into goods_cates(name)(select cate_name from goods group by cate_name);



--第四 更新品牌信息表
--1. 要把品牌信息查询出来
select brand_name from goods group by brand_name;


--2. 批量插入数据
insert into goods_brands(name) (select brand_name from goods group by brand_name);



--第五 更新种类信息成种类信息表中的id
--1. 种类信息跟要替换成表进行内联

select * from goods inner join goods_cates on goods.cate_name = goods_cates.name;




--2. 通过特殊的update 进行更新

# 如果更新的表是查询出来的,那么必须去掉select * from 
update (goods inner join goods_cates on goods.cate_name = goods_cates.name) set goods.cate_name = goods_cates.id;


--第六 更新品牌信息成品牌信息表的id
--1. 把要更新的表两张表进行内联
select * from goods inner join goods_brands on goods.brand_name = goods_brands.name;



--2.通过特殊的update语句进行更新 

update (goods inner join goods_brands on goods.brand_name = goods_brands.name) set goods.brand_name = goods_brands.id;


	
--第七步 修改字段(注意类型必须跟外键的主键类型一致)
-- alter table 表名 change 旧字段 新字段 类型
alter table goods change cate_name cate_id int unsigned;
alter table goods change brand_name brand_id int unsigned;


-- 外键的使用(了解)

-- 向goods表里插入任意一条品牌数据"老王牌拖拉机"
-- 你会发现我们外键不能创建,因为没有对应的品牌


-- 约束 数据的插入 使用 外键 foreign key
-- alter table 主表名 add foreign key (主表的外键) references 外键表(外键主键);
alter table goods add foreign key(cate_id) references goods_cates(id);


-- 创建表的同时设置外键 (注意 goods_cates 和 goods_brands 两个表必须事先存在)
-- foreign key (主表的外键) references 外键表(主键)
create table if not exists goods_key(
    id int primary key auto_increment not null,
    name varchar(40) default '',
    price decimal(5,2),
    cate_id int unsigned,
    brand_id int unsigned,
    is_show bit default 1,
    is_saleoff bit default 0,
 	foreign key(cate_id) references goods_cates(id)
   
);


-- 如何取消外键约束
-- 需要先获取外键约束名称,该名称系统会自动生成,可以通过查看表创建语句来获取名称
--show create table goods;
show create table goods;

-- 获取名称之后就可以根据名称来删除外键约束
--alter table students drop foreign key students_ibfk_1;
alter table goods drop foreign key goods_ibfk_1;
alter table goods drop key cate_id;


总结:在实际开发中,很少会使用到外键约束,会极大的降低表更新的效率









