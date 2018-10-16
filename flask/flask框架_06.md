# flask框架6

[TOC]


### 一. 数据迁移

- 作用: 在`保留原数据`的前提下， `升级数据库结构`（添加字段，添加表等）
- 安装第三方包 `pip install flask-migrate`
- 数据迁移需要依赖 `flask-script`
- 迁移命令
	- 初始化 `python demo.py mc init`
	- 生成版本 `python demo.py mc migrate -m 注释`
	- 升级   `python demo.py mc upgrade`
	-  降级   `python demo.py mc downgrade`
	-  查看当前版本 `python demo.py mc current`
	-  查看历史版本 `python demo.py mc history`


```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand


app = Flask(__name__)
# 设置数据库连接地址
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:mysql@127.0.0.1:3306/migrate_test"
# 是否追踪数据库修改  开启后, 会影响性能, 不建议开启
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# 控制台会打印底层执行的SQL语句
app.config["SQLALCHEMY_ECHO"] = True
# 创建数据库连接
db = SQLAlchemy(app)
# 创建管理器
mgr = Manager(app)
# 初始化迁移器
Migrate(app, db)
# 使用管理器添加迁移命令
mgr.add_command("mc", MigrateCommand)


# 映射关系 : 类->表  属性->字段  对象->记录
class User(db.Model):
    __tablename__ = "users"  # 设置表名, 表名默认为类名小写
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)
    age = db.Column(db.Integer, unique=True)



@app.route('/')
def index():
    # 增加数据
    user = User(name="zs")


    # 添加到会话中
    db.session.add(user)

    # 提交会话 不提交的话, 数据库不会更新
    db.session.commit()

    return 'index'


if __name__ == '__main__':
    mgr.run()
```

### 二. Git

#### 1. Git介绍

![Alt text](./1537599954554.png)


#### 2. Git本地结构

- 创建本地仓库  `git init`
- 配置仓库作者信息  `git config user.name zs`   `git config user.email zs@itcast.cn`

#### 3. git基本操作 (重点)

- 将工作区内容提交到暂存区    `git add 文件名 git add .`
- 将暂存区内容提交到仓库区   `git commit -m 注释`
- 查看仓库状态 `git status`
- 查看仓库当前版本  `git log`

#### 4. 撤销修改和切换版本

##### 4.1 撤销修改

- 按照暂存区还原工作区  `git checkout 文件名`
- 按照仓库区还原暂存区  `git reset HEAD`

![Alt text](./1537602546919.png)


##### 4.2 切换版本

- HEAD 表示当前版本
- HEAD^  表示当前版本的上一个版本
- HEAD~100 表示当前版本的前100个版本
- 切换到上一个版本(并且`让暂存区随着仓库区一起还原`)  `git reset HEAD^`
- 切换到指定的版本(版本号前7位)  `git reset jwdswe2`
- 查看版本更新历史  `git reflog`


#### 5. 删除文件

- 删除文件
	- 删除工作区和暂存区文件   `git rm 文件名`
	- 提交版本  `git commit -m 注释` 

- 恢复误删
	- 如果已经生成了新版本，先切换到上一个版本 `git reset HEAD^`
	- 如果还没有生成新版本， 直接根据仓库区还原 `git reset HEAD`
	- 恢复工作区文件   `git checkout 文件名`

- 拓展命令
	- 删除暂存区文件 `git rm 文件名 --cached`
	- 还原仓库区和暂存区  `git reset HEAD^ --mixed`  默认
	- 还原仓库区  `git reset HEAD^ --soft`
	- 还原仓库区&暂存区&工作区   `git reset HEAD^ --hard`


### 三. Git远程管理 


#### 1. 创建远程仓库

- 代码托管网站 `码云 gitee.com`    `github.com`

![Alt text](./1537606120898.png)

#### 2. git远程操作 (重点)
- 克隆远程仓库  `git clone https://gitee.com/cz_zzz/InfoNews13.git`
- 推送本地版本到远程仓库  `git push`
- 从远程仓库拉取版本  `git pull`
- 免密码设置  `git config --global credential.helper store`


#### 3. 代码冲突
- 原因: 远程仓库中的版本，在本地仓库中没有
- 解决办法：
	- 先拉取远程仓库的版本 `git pull`
	- git会自动合并两个版本：
		- 如果修改的不是同一个文件， 就会自动合并成功， 然后生成新版本再推送
		- 如果修改的是同一个文件， 就会自动合并失败， 需要开发者手动进行代码合并（注意先和同事沟通），合成后生成新版本再推送

- 好的习惯：
	- 项目中模块化， 不要多人修改同一个文件
	- 多提交多拉取数据
	- 不要擅自修改别人的代码

#### 4. 标签
- 作用： 给`重要的版本`设置`标记`， 方便快速取出、切换到该版本
- 经理
	- 给指定的版本添加标签   `git tag -a v1.0 -m "1.0版本" 787557d`
	- 将标签推送到远程仓库  `git push origin v1.0`
- 程序员
	- 拉取数据，才会获取远程仓库的标签 `git pull`
	- 查看所有的标签  `git tag`
	- 显示标签信息 `git show v1.0`
	- 切换到标签对应的版本  `git checkout v1.0`

#### 5. 分支

- 作用： 区分生产环境和开发环境， 主分支`只存放稳定的版本`， `实际开发都是在开发分支`中完成的
- 分支：可以理解为复制了一个新的远程仓库
- 经理
	- 创建开发分支 `git branch dev`
	- 将开发分支推送到远程仓库  `git push origin dev -u`
	- 合并分支（将开发分支中的稳定版合并到主分支中）先切换到主分支 `git checkout master`  再合并开发分支  `git merge dev`
- 程序员
	- 拉取数据， 才会获取远程仓库的分支  `git pull`
	- 切换到开发分支 `git checkout dev`
	- 在开发分支中进行开发

![Alt text](./1537611079657.png)

#### 6. pycharm进行git管理 （重要）