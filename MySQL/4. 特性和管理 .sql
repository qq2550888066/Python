
-- 事物(ACID)
# 开启事务
begin;
或者
start transaction;
	
	-- 原子性 一致性
		第一步 打开 终端1 终端2
		第二步 终端1 打开事物 begin/start transaction
			   终端1 update 表名 set 字段="xxx" where ...;
			   终端1 select * from 表名;  发现数据改变
		第三步 终端2 select * from 表名;  
			   发现数据其实并没有改变 其实这个时候对数据的相关操作信息存在缓存中,
			   当commit之后,这些操作才会一次性的完成
		第四步 终端1 commit 数据数数据真的改变
			   终端2 select * from 表名,数据改变了
			
	-- 隔离性
		第一步 打开 终端1 终端2
		第二步 终端1 打开事物 begin
			   终端1 update 表名 set 字段="xxx" where ...;
		第三步 终端2 update 表名 set 字段="yyy" where ...;
			   发现 处于阻塞状态 
		第四步 终端1 commit
			   终端2 阻塞状态解除 数据修改成 yyy
			   
	-- 回滚(rollback)
		第一步 打开 终端1 begin
		第二步 终端1 update 表名 set 字段="xxx" where ...;
		第三步 rollback 数据返回最开始的原始值

	
	
	-- 持久性
		-- 一旦事务提交，则其所做的修改会永久保存到数据库
		
	-- 注意 
		-- innodb能使用事物
		-- 使用python操作数据库的时候 默认开启事物的 
		-- 但是python对数据库进行增删改的时候 需要手动commit
		
		-- 使用终端操作数据库(也就是mysql的客户端)的时候 也是默认开始事物的
		-- 只是在回车确认操作的时候 终端会默认的commit 所以我们不需要commit
		
		
-- 事物最主要解决的问题
	-- 某些事情需要一次性完成 中途不允许出现中断 例如银行取钱 事物可以解决这种问题

-- 什么是视图?
	-- 通俗的讲，视图就是一条SELECT语句执行后返回的结果集。
	-- 所以我们在创建视图的时候，主要的工作就落在创建这条SQL查询语句上。
	
-- 视图的特点
	-- 视图是对若干张基本表的引用，一张虚表，查询语句执行的结果，
	-- 不存储具体的数据（基本表数据发生了改变，视图也会跟着改变）；
	
-- 视图的最主要的作用
	-- 如果数据库因为需求等原因发生了改变，为了保证查询出来的数据与之前相同，
	-- 则需要在多个地方进行修改，维护起来非常麻烦,这个时候使用视图就可解决这个问题
	
-- 视图的定义方式
	-- create view 视图名称(一般使用v开头) as select语句;
	select goods.name,goods.price,goods_cates.name as cate_name from goods inner join goods_cates on goods.cate_id = goods_cates.id;

--具体场景使用
	create view v_python18 as select goods.name2 as name,goods.price,goods_cates.name as cate_name from goods inner join goods_cates on goods.cate_id = goods_cates.id;


		v_python18 = select goods.name,goods.price,goods_cates.name as cate_name from goods inner join goods_cates on goods.cate_id = goods_cates.id;

-- 解决数据库发生改变 python程序也需要改变的问题
--复杂的sql可以使用视图代替



	
-- 删除视图
	-- drop view ;
	drop view v_python18;



-- 注意
	-- 视图只能用于查询
	
-- 视图作用总结

-- 1 提高了重用性，就像一个函数
-- 2 对数据库重构，却不影响已经编写好的程序运行
-- 3 让数据更加清爽


-- 视图最主要解决的问题 
	-- 程序对数据库操作,一旦数据库发生变化,程序需要修改,这时如果使用视图就可以解决这个问题


	
-- 索引
	-- 注意
	-- 要注意的是，建立太多的索引将会影响更新和插入的速度，因为它需要同样更新每个索引文件。
	-- 对于一个经常需要更新和插入的表格，就没有必要为一个很少使用的where字句单独建立索引了，
	-- 对于比较小的表，排序的开销不会很大，也没有必要建立另外的索引。

	-- 建立索引会占用磁盘空间


-- 索引最主要解决的问题
	-- 当数据非常庞大时,并且这些数据不需要经常修改,为了加快查询速度,我们会使用索引
	
-- 创建一张表
	create table test_index(title varchar(10));
-- python插入10条数据


--测试步骤
	1. 开启运行时间监测：
		set profiling=1;
	2. 查找第1万条数据ha-99999
		select * from test_index where title='ha-99999';
	3. 查看执行的时间：
		show profiles;
	4. 为表title_index的title列创建索引：
		create index 索引名称 on 表名(字段名称)
		
			create index my_index on test_index(title);
	5. 执行查询语句：
		select * from test_index where title='ha-99999';
	6. 再次查看执行的时间
		show profiles;

	--查看索引
		-- show index from 表名;
		show index from test_index;

	--删除索引

		---drop index 索引名 on 表名;
		drop index my_index on test_index;

	
	
	
	
-- 权限管理(了解) 对用户的管理

	-- 查看有哪些账户
		1 使用root账户登录
		2 使用mysql数据库
		3 用户的信息存放在 user 表中 
			-- select host,user,authentication_string from user;
				Host表示允许访问的主机 % localhost
				User表示用户名
				authentication_string表示密码，为加密后的值
			select host,user,authentication_string from user;
				
	-- 创建账户、授权 
		
		-- 案例一
		1 使用root账户登录
		
		2 创建账户并授予所有权限(部分权限)
		-- grant 权限列表 on 数据库 to '用户名'@'访问主机' identified by '密码';(语法格式)
		grant select on jing_dong.* to 'python18'@'localhost' identified by '123';
			
			
			-- 注意
			-- 1 访问主机通常使用 百分号% 表示此账户可以使用任何ip的主机登录访问此数据库
			-- 2 访问主机可以设置成 localhost 或具体的ip，表示只允许本机或特定主机访问
			
		-- 查看用户有哪些权限
		-- show grants for 用户@访问主机;
		show grants for python18@'localhost';
	
			
		3 退出root的登录 使用新账户登录
		-- 使用查询操作是可以的,(插入也可以)
		
		-- 使用其他操作是不可以的
			
			
		
		-- 案例二
		1 使用root账户登录
		
		2 创建账户并授予所有权限(所有权限) all privileges
		--grant 权限列表 on 数据库 to '用户名'@'访问主机' identified by '密码';(语法格式)
		-- 注意 访问链接设置成 % 十分危险 不要使用
			grant all privileges on jing_dong.* to 'python18'@'%' identified by '222';

				% 可以远程 localhost只能本地 以后尽量不要开远程
				
		-- drop user 删除
		-- grant 授权
		
	-- 修改权限(增加)
		1 使用root账户登录
		
		2 修改用户权限
		-- grant 权限名称 on 数据库 to 账户@主机 with grant option;(语法格式)
		grant update on jing_dong.* to 'python18'@'localhost' with grant option;
		
		3 刷新权限
			flush privileges;
			
	-- 修改密码
		1 使用root账户登录
		
		2 选择mysql数据库
		
		3 使用password()函数进行密码加密 对user表进行修改
		-- update user set authentication_string=password('新密码') where user='用户名';(语法格式)
		# 对称与非对称加密
		例:update user set authentication_string=password('333') where user='python18';

		4 刷新权限
			flush privileges;
		
	-- 删除用户
		1 使用root账户登录
		
		2 删除用户
			第一种方式  drop user '用户名'@'主机';(语法格式)  卸载
			
						例:drop user 'python18'@'%';
						
						
			第二种方式	delete from user where user='用户名';(语法格式)  手动删除
			
						例:delete from user where user='python18';
						
						-- 操作结束之后需要刷新权限
						flush privileges
						
		-- 推荐使用语法1删除用户, 如果使用语法1删除失败，采用语法2方式
	
	
	-- 远程登录(谨慎使用)
	
	
	