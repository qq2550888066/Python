# flask框架5

[TOC]


### 一. 蓝图 

- flask的应用对象不能在其他文件中注册路由, 想要在项目的其他文件中注册路由, 需要使用 **蓝图**
- 蓝图: flask项目实现 **模块化** 的一种机制

#### 1. 蓝图的基本使用 (重点)

1. 创建蓝图对象
2. 使用蓝图来装饰路由
3. 应用注册蓝图
4. 在包的init.py中关联视图文件

- home/__init__.py
```python
from flask import Blueprint


# 1.创建蓝图对象
home_blu = Blueprint("home_blu", __name__)


# 为了避免循环导入问题, 将蓝图先创建,再关联视图函数
# 4. 关联视图函数
from .views import *  # 从当前init.py所在的包中查询名为views的模块, 并从中导入所有的内容
```
- home/views.py:

```python
from . import home_blu  # .表示从当前文件所在的包中的init.py文件中导入home_blu


# 2. 使用蓝图来装饰路由
@home_blu.route('/')
def index():
    return 'index'
```

- 主文件

```python
from flask import Flask
from home import home_blu  # 从home包的init.py中导入home_blu (如果没有找到该内容, 就会从home包中查询并导入名为home_blu的模块)

app = Flask(__name__)
# 3. 注册蓝图
app.register_blueprint(home_blu)


if __name__ == '__main__':
    print(app.url_map)
    app.run(debug=True)
```


#### 2. 蓝图管理静态文件

- 蓝图可以单独管理静态文件, 但是需要手动设置static_folder参数
- 为了区别项目的static和蓝图的static文件夹, 需要给蓝图注册的路由添加url前缀(url_prefix)

```python
# 如果想要让蓝图单独管理静态文件, 需要主动设置static_folder参数
home_blu = Blueprint("home_blu", __name__, static_folder="static", url_prefix="/home")
```

### 二. Redis

#### 1. NOSQL 和 Redis介绍 (了解)

- 泛指非关系型的数据库
- nosq一般可以存储多种数据类型, 除了基本类型(数字、字符串、日期）,还可以存储json、html等文件类型
- 数据以键值方式存取, 不能像关系型数据库一样使用外键建立表之间的关系, 不适合用于关系特别复杂的数据查询场景
- 每种nosql数据库都有自己的api和语法, 不支持SQL语法
- “事务”的支持：sql对事务的支持非常完善，而nosql基本不支持事务

- NoSQL中的产品种类相当多, 各有自己擅长的业务场景

- Redis优势
	- 性能极高 – 内存型数据库,读写速度极快
	- 丰富的数据类型 – 支持存储 Strings, Lists, Hashes, Sets 及 Ordered Sets 等多种数据类型。
	- 原子性 – Redis的所有操作都是原子性的，并且支持事务 (不支持回滚)。
	- 数据持久化 – 可以将内存数据保存到磁盘中, 并提供多种存储机制。
	- 数据备份 – 支持主从模式 (master - slave) 的数据备份。
	- 集群 – 支持集群, 并实现了哨兵机制。
	- 丰富的特性 – 设置过期时间, 发布/订阅, 通知等机制。

- Redis应用场景
	- session存储 (性能更好, 方便设置过期时间)
	- 购物车 (以请求令牌token作为key，记录当前用户购物车中的商品及其数量)
	- 网页缓存 (将 请求的url/返回的网页内容 作为redis的key/value进行缓存)
	- 实时排行 (利用zset的数据权重分析数据排行, 按排名展示数据)

#### 2. 配置

- redis中有两种数据持久化机制
	- RDB
		- 两种保存方式  1> 主动保存 (save命令)   2> 触发自动持久化策略( save 60 100 )
	- AOF
		- 采用命令重放机制(默认策略: 每秒将执行过的增/删/改命令保存到一个文件中, 当重新启动redis数据库时, redis系统会读取该文件中的所有命令, 并重新执行一遍)
		- 从数据安全性上, aof机制会更加安全, 但是性能消耗也更大

#### 3. 客户端&服务端 命令

- shutdown 关闭数据库  
	- 如果设置了rdb的自动持久化策略, 则会在关闭数据库前隐式的执行save命令
	- 如果不想让rdb文件同步内存中的数据变化, 则使用 shutdown nosave
	- 如果没有设置rdb的自动持久化策略, 但是想要保存内存中的数据到rdb文件, 则使用 shutdown save
#### 4. String (重点)

- set  添加/修改数据  
- get  获取数据
- mset   添加/修改多个数据
- mget   获取多个数据
- append   对数据进行拼接

#### 5. 键命令 (重点)

- del   删除数据
- keys *  查看键
- exist    查看键是否存在
- type    查看键对应的数据类型
- expire  设置数据的过期时间
- ttl  获取数据的剩余时间

#### 6. hash

- hset  新增/修改数据
- hget  获取数据
- hmset  新增/修改多条数据
- hmget  新增/修改多条数据
- hkeys  获取所有字段名
- hvals  获取所有字段的值
- hdel   删除字段

#### 7. list

- lpush    追加数据
- linsert   插入数据
- lrange   获取数据
- lset   修改数据
- lrem  删除数据

#### 8. zset 和 set

- zset (list的升级版,不仅可以根据索引取值, 也可以根据权重取值)
	- zadd  添加数据
	- zrange  获取数据
	- zrem   删除数据
	- zscore  获取权重
	- zrangebyscore  根据权重取数据
	- zremrangebyscore 根据权重删除数据



- set  ( 无序集合(去重))
	- sadd  添加数据
	- smembers  获取数据
	- srem   删除数据

#### 9. python操作redis (重点)

from redis import StrictRedis

```python
# 创建redis连接  redis数据会自动编码为utf-8, decode_responses会自动解码
sr = StrictRedis(decode_responses=True)

# 执行操作
sr.set("name", "wangwu")
print(sr.get("name"))

# 数据持久化
sr.save()
# sr.bgsave()  # 异常持久化

# 关闭数据库
sr.shutdown()
```

### 三. Redis高级配置 (了解)

#### 1. 数据库主从

- 数据库主从(双机热备): 对数据库中的数据进行备份
- 主数据库:  主要负责增删改数据
- 从数据库:  主要负责对主数据库的数据进行实时同步(备份数据),  并完成数据查询工作(减少主数据库压力, 不具备增删改功能)

- 哨兵模式: 开启一个独立的进程, 来监听数据库状态, 如果主数据库下线, 哨兵会在主数据库的从数据库中推选一个从数据库暂时作为主数据库

#### 2. 数据库集群

- 数据库集群: 如果服务器的数据库非常大, 就需要配置数据库集群, 让多台计算机共同来存储数据库数据
- redis数据库集群 会将数据自动进行分区保存(让数据库容量负载均衡)
- redis数据库集群: 至少3个主数据库, 3个从数据库

- 设置5个配置:  port  3个cluster配置  开启aof  (appendonly)

#### 3. python操作redis集群




