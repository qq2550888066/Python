# flask框架4

[TOC]


### 一. flask-SQLAlchemy

#### 1. ORM

- ORM: 对象关系映射, 可以让开发者以`原生代码的方式来操作数据库`
	- 优点: 让开发者不再关注SQL语句, 也不需要学习其他的数据库的语法
	- 缺点: 会有一定的性能的损失

![Alt text](./1537339033348.png)


#### 2. 配置和连接

- 需要安装 `flask-sqlalchemy` 和 `flask-mysqldb`

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# 设置数据库连接地址
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:mysql@127.0.0.1:3306/test18"
# 是否追踪数据库修改  很消耗性能, 不建议使用
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# 设置在控制台显示底层执行的SQL语句
app.config["SQLALCHEMY_ECHO"] = True

# 创建数据库连接
db = SQLAlchemy(app)


@app.route('/')
def index():
    return 'index'
```


#### 3. 构建表

```python
# 关系映射:  类->表  属性->字段  对象->记录
# 定义类(构建表)
class User(db.Model):
    __tablename__ = "users"  # 设置表名 表名默认为类名的小写
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)


@app.route('/')
def index():
    # 创建 所有的继承自db.Model的表
    db.create_all()
    return 'index'
```


#### 4. 增删改

```python
@app.route('/')
def index():
    # 删除 所有继承自db.Model的表
    db.drop_all()
    # 创建 所有的继承自db.Model的表
    db.create_all()

    # 增加数据
    user = User(name="zs")
    # user.name = "zs"  # 主键不需要手动设置, 当数据保存到数据库中, 主键会自增创建
    # 添加到会话中
    db.session.add(user)
    # 提交会话   不提交数据库不会更新
    db.session.commit()

    # 修改数据
    user.name = "li"
    # 提交会话   不提交数据库不会更新
    db.session.commit()

    # 删除数据
    db.session.delete(user)
    db.session.commit()

    return 'index'
```

#### 5. 数据查询 (重点)

  

```python
  """
    查询所有用户数据
    User.query.all()
    查询有多少个用户
    User.query.count()
    查询第1个用户
    User.query.first()
    User.query.get(1)  # 根据id查询

    查询id为4的用户[3种方式]
    User.query.get(4)
    User.query.filter_by(id=4).all()  # 简单查询  关键字实参设置字段名
    User.query.filter(User.id==4).first()  # 复杂查询  使用恒等式等其他语法查询

    查询名字结尾字符为g的所有用户[开始 / 包含]
    User.query.filter(User.name.endswith("g")).all()
    User.query.filter(User.name.startswith("w")).all()
    User.query.filter(User.name.contains("n")).all()
    User.query.filter(User.name.like("w%n%")).all()  # 模糊查询

    查询名字和邮箱都以li开头的所有用户[2种方式]
    User.query.filter(User.name.startswith("li"), User.email.startswith("li")).all()

    from sqlalchemy import and_
    User.query.filter(and_(User.name.startswith("li"), User.email.startswith("li"))).all()


    查询age是25 或者 `email`以`itheima.com`结尾的所有用户
    from sqlalchemy import or_
    User.query.filter(or_(User.age==25, User.email.endswith("itheima.com"))).all()

    查询名字不等于wang的所有用户[2种方式]
    from sqlalchemy import not_
    User.query.filter(not_(User.name=="wang")).all()

    User.query.filter(User.name!="wang").all()

    查询id为[1, 3, 5, 7, 9]的用户
    User.query.filter(User.id.in_([1, 3, 5, 7, 9])).all()

    所有用户先按年龄从小到大, 再按id从大到小排序, 取前5个
    User.query.order_by(User.age, User.id.desc()).limit(5).all()

    分页查询, 每页3个, 查询第2页的数据
    pn = User.query.paginate(2, 3)
    pn.items 获取该页的所有数据  pn.page 当前页码  pn.pages 总页数

    """
```

#### 6. 一对多关系 (重点)
- 多表关系中, 通过`外键`来关联数据
- 一对多关系中, 外键设置在 `多的一方`

![Alt text](./1537343140912.png)

- 通过关系属性来关系/查询数据 操作简单  
	- 1> 仍需要定义外键 
	- 2> 定义关系属性 
	- 3> 使用关系属性来关联数据

```python
# 用户表  一个用户有多个地址  一
class User(db.Model):
    __tablename__ = "users"  # 设置表名 表名默认为类名的小写
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)
    # 创建关系属性  relationship("关联的类名", backref="对方表查询关联数据时的属性名")
    addresses = db.relationship("Address", backref="user")


# 地址表   多
class Address(db.Model):
    __tablename__ = "addresses"  # 设置表名 表名默认为类名的小写
    id = db.Column(db.Integer, primary_key=True)
    detail = db.Column(db.String(64), unique=True)
    # 设置外键(一般记录的是另一张表的主键)
    user_id = db.Column(db.Integer, db.ForeignKey("users.id"))


@app.route('/')
def index():
    # 删除 所有继承自db.Model的表
    db.drop_all()
    # 创建 所有的继承自db.Model的表
    db.create_all()
    """只通过外键来关联/查询数据 操作复杂"""
    # # 添加用户
    # user = User(name="zs")
    # db.session.add(user)
    # db.session.commit()  # 必须先提交, 否则没有生成主键, 设置外键无效
    #
    # # 添加地址
    # adr1 = Address(detail="中关村1号", user_id=user.id)
    # adr2 = Address(detail="陆家嘴1号", user_id=user.id)
    # db.session.add_all([adr1, adr2])
    # db.session.commit()
    #
    # # 查询数据  根据用户查询地址
    # adrs = Address.query.filter_by(user_id=user.id).all()
    # for adr in adrs:
    #     print(adr.detail)

    """通过关系属性来关系/查询数据 操作简单  1> 仍需要定义外键 2> 定义关系属性 3> 使用关系属性来关联数据"""
    user = User(name="zs")
    adr1 = Address(detail="中关村1号", user_id=user.id)
    adr2 = Address(detail="陆家嘴1号", user_id=user.id)
    # 关联数据
    # user.addresses = [adr1, adr2]
    user.addresses.append(adr1)
    user.addresses.append(adr2)
    # 添加到数据库中
    db.session.add_all([user, adr1, adr2])
    db.session.commit()
    # 使用关系属性来查询数据
    print(user.addresses)
    print(adr1.user)

    return 'index'
```


#### 7. 图书案例 (重点)

##### 1. 定义模型&添加测试数据

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# 设置数据库连接地址
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:mysql@127.0.0.1:3306/book_test"
# 是否追踪数据库修改  很消耗性能, 不建议使用
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# 设置在控制台显示底层执行的SQL语句
app.config["SQLALCHEMY_ECHO"] = False

# 创建数据库连接
db = SQLAlchemy(app)


# 作者表 一
class Author(db.Model):
    __tablename__ = "authors"  # 设置表名 表名默认为类名的小写
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)
    # 创建关系属性
    books = db.relationship("Book", backref="author")


# 书表  多
class Book(db.Model):
    __tablename__ = "books"  # 设置表名 表名默认为类名的小写
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)
    # 设置外键
    author_id = db.Column(db.Integer, db.ForeignKey("authors.id"))


if __name__ == '__main__':
    db.drop_all()
    db.create_all()

    # 生成数据
    au1 = Author(name='老王')
    au2 = Author(name='老尹')
    au3 = Author(name='老刘')
    # 把数据提交给用户会话
    db.session.add_all([au1, au2, au3])
    # 提交会话
    db.session.commit()
    bk1 = Book(name='老王回忆录', author_id=au1.id)
    bk2 = Book(name='我读书少，你别骗我', author_id=au1.id)
    bk3 = Book(name='如何才能让自己更骚', author_id=au2.id)
    bk4 = Book(name='怎样征服美丽少女', author_id=au3.id)
    bk5 = Book(name='如何征服英俊少男', author_id=au3.id)
    # 把数据提交给用户会话
    db.session.add_all([bk1, bk2, bk3, bk4, bk5])
    # 提交会话
    db.session.commit()

    app.run(debug=True)
```

##### 2. 显示界面


```python
@app.route('/')
def index():
    # 查询数据库中的所有作者
    authors = Author.query.all()
    # 将数据传到模板中, 进行渲染
    return render_template("book_test.html", authors=authors)
```

```htmlbars
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

<h1>图书管理</h1>

<form method="post">
    <label>作者名: </label><input type="text" name="author_name" placeholder="请输入作者名"><br/>
    <label>书名： </label><input type="text" name="book_name" placeholder="请输入书名"><br/>
    <input type="submit" value="保存">
</form>

<hr>

<ul>
    {% for author in authors %}

        <li>{{ author.name }}<a href=""> 删除</a></li>
        <ul>
            {% for book in author.books %}
                <li>{{ book.name }} <a href=""> 删除</a></li>

            {% endfor %}

        </ul>
    {% endfor %}

</ul>


</body>
</html>
```

##### 3. 增加数据

- 获取&校验数据
- 判断作者是否存在
- 根据作者情况, 实现数据库处理

```python
@app.route('/', methods=['GET', "POST"])
def index():
    if request.method == "GET":
        # 查询数据库中的所有作者
        authors = Author.query.all()
        # 将数据传到模板中, 进行渲染
        return render_template("book_test.html", authors=authors)

    # POST的处理
    # 获取参数
    author_name = request.form.get("author_name")
    book_name = request.form.get("book_name")
    # 校验参数  all([])  只有当列表中的所有元素都有值(不是0/空字符串/None)时, 才会返回True
    if not all([author_name, book_name]):
        flash("参数不足")
        return redirect(url_for("index"))

    # 判断是否有该作者
    author = Author.query.filter_by(name=author_name).first()
    if author:  # 有作者, 创建书籍对象, 关联该作者, 添加到数据库中
        book = Book(name=book_name)
        author.books.append(book)
        db.session.add(book)
        db.session.commit()

    else:  # 没有作者, 创建书籍和作者对象, 关联作者和书籍, 添加到数据库
        new_book = Book(name=book_name)
        new_author = Author(name=author_name)
        new_author.books.append(new_book)
        db.session.add_all([new_book, new_author])
        db.session.commit()

    return redirect(url_for("index"))
```

- 数据库操作必须进行异常处理
- 增删改处理 失败后还需要进行回滚  `db.session.rollback()`
- 细节判断: 书籍是否已存在

##### 4. 删除数据

- 实现删除作者和书籍的路由, 采用`动态URL`来获取数据
- 删除作者时, 注意先删除关联数据  (删除一对多的关联数据时, `先删多的一方`, 再删除一的一方)

```python
# 删除书籍
@app.route('/delete_book/<int:book_id>')
def delete_book(book_id):
    # 根据书籍id取出该书籍
    book = Book.query.get(book_id)
    # 将书籍从数据库中删除
    db.session.delete(book)
    db.session.commit()

    return redirect(url_for("index"))


# 删除作者
@app.route('/delete_author/<int:author_id>')
def delete_author(author_id):
    # 根据作者id取出该作者
    author = Author.query.get(author_id)
    # 删除一对多的关联数据时, 先删多的一方, 再删除一的一方
    for book in author.books:
        db.session.delete(book)

    db.session.delete(author)
    db.session.commit()
    # Book.query.filter_by(author_id=author.id).delete()  # 也可以删除作者所有的书籍

    return redirect(url_for("index"))
```

### 8. 多对多关系

- 多对多关系中, 必须创建独立的关系表来关联数据

![Alt text](./1537353107717.png)

- 多对多中, 通过关系属性来关连/查询数据
	- 1> 定义`关系表`来设置外键 
	- 2> 定义关系属性   `多对多关系属性, 还需要设置参数secondary="关系表名"`
	- 3> 使用关系属性来关联数据

```python
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# 设置数据库连接地址
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql://root:mysql@127.0.0.1:3306/test18"
# 是否追踪数据库修改  很消耗性能, 不建议使用
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# 设置在控制台显示底层执行的SQL语句
app.config["SQLALCHEMY_ECHO"] = False

# 创建数据库连接
db = SQLAlchemy(app)

# 创建关系表  多对多关系必须创建单独的表来记录关联数据
t_stu_cur = db.Table("table_stu_cur",
         db.Column("stu_id", db.Integer, db.ForeignKey("students.id"), primary_key=True),
         db.Column("cur_id", db.Integer, db.ForeignKey("courses.id"), primary_key=True)
         )


# 学生表  多  一个学生可以选多门课, 一门课也可以被多个学生选
class Student(db.Model):
    __tablename__ = "students"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)
    # 多对多关系属性, 还需要设置参数secondary="关系表名"
    courses = db.relationship("Course", backref="students", secondary="table_stu_cur")


# 课程表   多
class Course(db.Model):
    __tablename__ = "courses"
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), unique=True)



@app.route('/')
def index():
    # 删除 所有继承自db.Model的表
    db.drop_all()
    # 创建 所有的继承自db.Model的表
    db.create_all()
    """多对多 通过关系属性来关连/查询数据 操作简单  1> 定义关系表来设置外键 2> 定义关系属性 3> 使用关系属性来关联数据"""
    stu1 = Student(name="zs")
    stu2 = Student(name="ls")
    cur1 = Course(name="python")
    cur2 = Course(name="c")
    cur3 = Course(name="java")
    # 关联数据
    stu1.courses.append(cur1)
    stu1.courses.append(cur2)
    stu2.courses.append(cur2)
    stu2.courses.append(cur3)
    # 添加到数据库
    db.session.add_all([stu1, stu2, cur1, cur2, cur3])
    db.session.commit()

    print(stu1.courses)
    print(cur2.students)
    return 'index'


if __name__ == '__main__':
    app.run(debug=True)
```

- 懒查询机制

```python
# 默认一旦查询出数据, 就会该数据关联数据一起全查出来, 如果不想直接查询出所有的关联数据, 就可以使用懒查询机制
# 懒查询机制优点: 减少不必要的性能消耗, 按需获取
# 如果想要获取关联数据, 使用具体的all/first/count查询即可
# 懒查询机制只能用于对多关系 (1对多, 多对多)
courses = db.relationship("Course", backref=db.backref("students", lazy="dynamic"), secondary="table_stu_cur", lazy="dynamic")
```


