# flask框架2

[TOC]

### 一. 状态保持 (重点)

#### 1. Session

- 特点: 
	1. 将数据`保存在服务器`, 比如服务器的数据库中
	2. Session机制需要依赖Cookie机制

- 场景:
	- 更适合保存重要/敏感的数据


![Alt text](./1537080529955.png)

```python
app = Flask(__name__)
# 设置秘钥  用于对SessionID进行加密
app.secret_key = "test"


@app.route('/')
def index():
    # 取出session中的数据, 进行判断
    username = session.get("username")
    if username:
        return "欢迎回来, %s" % username

    return redirect(url_for("login"))


# 登录
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == "GET":
        # 读取html文件中的内容
        with open("login.html") as f:
            content = f.read()
            # 将html格式的字符串返回
            return content

    # POST处理
    username = request.form.get("username")
    password = request.form.get("password")
    # 判断用户名密码是否正确
    if username == "zs" and password == "123":
        # 让session记录登录信息
        session["username"] = username
        # 登录成功, 重定向到首页
        return redirect(url_for("index"))
    else:
        return "登录失败"
```

- session细节
	1. 生成随机字符串  `base64.b64encode(os.urandom(48))`
	2. session过期时间
```python
    # 设置session支持过期时间  默认31天
    session.permanent = True
    # 设置Session的过期时间
	app.permanent_session_lifetime = timedelta(days=7)
```
    3.删除session数据
 
```python
# 删除session数据  
   session.pop("username", default="no_key")
```
	4.flask中默认的session存储机制不是传统的sesson存储机制(数据保存在服务器的数据库中), 而是将session全部加密后保存到cookie中


### 二. 高级处理

#### 1. 上下文

```python
# 上下文变量: 并不是真正的全局变量, 是存在使用范围, 范围是 从某次请求开始, 到该请求结束的这段时间
# 请求上下文: 记录一些和请求有关的数据  request session
# 应用上下文: 记录一些和应用有关的数据  current_app  g
# current_app  会自动引用创建的Flask应用, 在其他模块中使用Flask应用时应该使用current_app来获取
# g  flask为开发者预留的一个容器, 可以让开发者记录一些自定义的数据   每次请求后,数据会重置

# 上下文变量: 实现了线程隔离, 每个线程会对应一个独有的上下文, 当请求到来时创建上下文, 请求结束时销毁上下文(上下文变量随之销毁)

from flask import Flask, request, g

import news

app = Flask(__name__)


@app.route('/')
def index():
    # print(request.url)

    g.name = "zs"
    # print(g.name)

    news.func1()
    return 'index'


@app.route('/demo1')
def demo1():
    print(g.name)
    return "demo1"
```

> https://segmentfault.com/a/1190000009152655

#### 2. 请求勾子

- 请求勾子: 用于对请求事件监听, 当发生了指定的请求事件时, 可以让开发者进行一些自定义处理
```python
@app.before_first_request
def initial():
    print("当服务器被第一次请求前调用, 用于完成初始化工作, 比如建立数据库连接")


@app.before_request
def prepare():
    print('每次请求前调用, 用于完成请求准备工作, 比如参数校验, 数据统计, 过滤黑名单')


@app.after_request
def process(response):  # 监听了这个处理, 就需要设置形参来接收响应对象
    print("每次请求后调用(响应发给前端之前), 用于对响应进行加工处理, 比如设置统一的响应头信息, 包装数据")

    return response  # 加工后必须将响应返回


@app.teardown_request
def error_handle(error):  # 监听了这个处理, 就需要设置形成那来接收异常信息, 如果没有异常 error = None
    print("每次请求后调用, 无论是否出现异常, 一般完成一些善后工作, 比如异常统计")
```


#### 3. 路由变量

##### 3.1 绑定动态URL (重点)


```python
# 路由变量  用于让视图函数可以绑定动态URL
# 路由变量格式:  /user/<路由变量>

from flask import Flask, url_for

app = Flask(__name__)


# 设置路由变量
@app.route('/user/<userid>')
def user_detail(userid):  # 视图如果绑定的是动态URL, 则必须设置路由变量同名的形参(用于接收动态部分内容)
     print(userid)
     return "detail"


@app.route('/')
def index():
    # 获取视图函数的动态URL, 必须手动设置动态部分内容
    url1 = url_for("user_detail", userid="1002")
    print(url1)
    return 'index'
```


##### 3.2 正则转换器

```python
# 正则转换器 用于对动态部分内容进行格式过滤

from flask import Flask

app = Flask(__name__)


@app.route('/user/<int:userid>')
def index(userid):
    print(userid)
    return 'index'


# 部分转换器可以设置参数, 用于进行复杂的条件过滤
@app.route('/demo1/<string(minlength=3, maxlength=5):userid>')
def demo1(userid):
     print(userid)

     return "demo1"
```


#### 4. werkzerg库结构 (了解)

![Alt text](./1537093831736.png)

![Alt text](./1537093853347.png)


### 三. 参数和配置

#### 1. Flask( )参数

```python
app = Flask(__name__,  # 导入名称. 项目会根据这个名称来查询静态文件/模板文件路径
            # 官方推荐使用__name__, 如果使用__name__, 从当前文件所在的文件夹中查询静态文件/模板文件路径
            static_folder="static",  # 用于设置静态文件的存储路径
            static_url_path="/image",  # 用于设置静态文件的访问路径  http://127.0.0.1:5000/image/123.jpeg
            template_folder="templates"  # 用于设置模板文件的存储路径
            )
```

#### 2. Flask应用配置

```python
app = Flask(__name__)
# config是一个字典
# app.config["DEBUG"] = True


# 开发中,一般会将配置信息封装起来
# 三种封装方式

# 从对象中导入  掌握
class Config:
    # 定义和配置同名的类属性
    DEBUG = True

app.config.from_object(Config)

# 从py文件中导入
# app.config.from_pyfile("config.py")

# 从环境变量中导入
# app.config.from_envvar("ENV_CONFIG")
```



### 四. 脚本启动

- 安装脚本启动组件 `pip install flask-script`
- 作用: 可以让开发者更方便通过 `文本模式` 来启动Web应用, 方便修改常用配置
- 启动Web应用  `python demo1.py runserver -d -h 0.0.0.0 -p 8000`

![Alt text](./1537092163990.png)


```python
from flask import Flask
from flask_script import Manager

app = Flask(__name__)
# 创建管理器
mgr = Manager(app)


@app.route('/')
def index():
    return 'index'


if __name__ == '__main__':
    # app.run(debug=True, host="0.0.0.0")
    mgr.run()
```


