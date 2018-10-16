# flask框架1

[TOC]


### 一. flask介绍

### 二. 虚拟环境 (重点)

- 作用: `独立`的python环境, 有效的避免框架的`多版本冲突`
- 三个命令:
	1. 创建虚拟环境  `mkvirtualenv -p python3 env18`
	2. 退出虚拟环境  `deactivate`
	3. 进入虚拟环境  `workon env18`
	4. 查看所有虚拟环境 `workon 双击tab`


### 三. 基本使用

#### 3.1 第一个flask程序

- pip安装包  `pip install flask==0.10.1`
- pip查看所有安装的包  `pip freeze`


```python
from flask import Flask

# 1. 创建Flask应用
app = Flask(__name__)


@app.route("/")
def index():  # 首页的视图函数   访问指定URL时,就会调用该函数

    a = 10 / 20
    return "hello flask"


if __name__ == '__main__':
    # 2. 运行flask应用 (启动flask内置的测试服务器, 并且可以接收请求)
    
    # 设置服务器绑定的ip 监听的端口 以及设置是否开启调试模式
    # 万能ip 0.0.0.0  可以同时绑定外网ip 局域网ip

    # 调试模式优点: 1> 可以在网页上显示python错误  2> 不需要重启项目, 就可以更新代码
    app.run(host="0.0.0.0", port=8000, debug=True)
```


#### 3.2 路由的基本定义 

- POSTMAN: Web开发调试工具

```python
from flask import Flask

app = Flask(__name__)


# 设置路由支持的请求方式 methods
@app.route('/demo1', methods=['GET', "POST"])  # 路由必须以路径分隔符 / 开头
def index():
    return 'index'


if __name__ == '__main__':
    # 记录所有的路由规则
    print(app.url_map)
    app.run(debug=True)
    
```

#### 3.3 请求对象 

##### 3.3.1 基本数据

```python
# 请求对象是一个上下文变量, 暂时理解为全局变量
from flask import Flask, request

app = Flask(__name__)


@app.route('/')
def index():
    # 获取请求的URL 支持的方法 请求头
    print(request.url)
    print(request.method)
    print(request.headers)  # 类字典对象

    # print(request.headers["Host"])
    print(request.headers.get("Host"))  # 推荐这种方式
	return "index"
```

##### 3.3.2 查询字符串 (重点)

```python
# 获取查询字符串  一般用于GET传递数据给服务器
    print(request.args.get("name"))  # 类字典对象
```

##### 3.3.3 请求体 (重点)

1. 键值对数据  比如form表单的默认post

```python
# 获取POST的键值对数据
print(request.form.get("age"))
```

2. 文件数据  比如头像, 照片

```python
# 获取POST的文件数据
file = request.files.get("avatar")  # type: FileStorage
# 将文件保存到本地
file.save("avatar.jpg")
```

3. 纯文本数据  比如html, json

```python
# 获取POST的纯文本数据  bytes 类字符串对象  存放的是二进制数据
 data = request.data
 # print(data)
 # print(type(data))
 
 # 解码bytes -> str
 print(data.decode("utf-8"))
 
 # 编码: 文本数据 -> 二进制数据  str.encode("utf-8") = bytes
 # 解码: 二进制 -> 文本  bytes.decode("utf-8") = str
```



#### 3.4 响应

##### 3.4.1 自定义响应对象

```python
@app.route('/')
def index():
    # return 'index'  # 可以返回str/bytes, 都会被flask内部封装成响应对象

    # 手动创建响应对象   方便自定义响应头信息
    response = make_response("index")
    print(response.headers)  # 类字典对象 可赋值可取值
    return response
```


##### 3.4.2 返回json (重点)

```python
# 返回json
@app.route('/demo1')
def demo1():
    # json是一种数据交换格式   本质还是字符串
    # json 可以记录 数字/字符串  可以包含 []  {}
    dict1 = {"name": "zs", "age": 30}

    # dict -> json字符串
    json_str = json.dumps(dict1)
    # print(json_str)
    # print(type(json_str))

    # json字符串 -> dict
    dict2 = json.loads(json_str)
    # print(type(dict2))

    # return json_str
    # 可以将dict转化为json字符串, 并且会设置响应头的content-type为application/json
    # return jsonify(dict1)
    return jsonify(name="zs", age=30)  # 也支持关键字实参的形式, 数据只能是系统内置类型
```

##### 3.4.3 重定向

```python
# 重定向: 请求到另一个网络位置  比如页面跳转  a href  js window.location
@app.route('/demo2')
def demo2():
    # 跳转到指定的URL
    # return redirect("http://www.itcast.cn")
    # return redirect("/")

    # 获取视图函数的URL
    # str1 = url_for("demo1")
    # print(str1)
    # return "demo2"
    
    # 使用url_for获取URL,再进行重定向, 会更加有利于项目重构
    return redirect(url_for("index"))
```

##### 3.4.4 自定义状态码

```python
# 自定义状态码  有利于前端开发快速排错
@app.route('/demo3')
def demo3():
    # 第二个返回值会被设置为自定义的状态码
    return "demo3", 700
```


#### 4. 异常捕获

```python
@app.route('/')
def index():
    # a = 10 / 0
    # flask也内置了主动抛出异常的语法
    abort(404)
    return 'index'


@app.errorhandler(404)  # errorhandler可以捕获http异常和系统异常
def error_404(e):  # 一旦捕获了异常, 必须设置参数用于接收异常信息

    return "您访问的页面去浪迹天涯了... %s" % e


@app.errorhandler(ZeroDivisionError)
def error_zero(e):
    return "除数为0"
```

### 四. 状态保持 (重点)

- 状态保持机制: 用于记录访问信息的一种机制, 比如是否显示过帮助信息, 登录状态, 搜索记录等

#### 4.1 cookie

特点:
	1. cookie会将数据`保存在客户端`(浏览器)
	2. 访问某个网站时, 浏览器会`自动`将该网站的cookie发给服务器

场景:
	一般用于保存一些不太重要的数据

![Alt text](./1537005927969.png)

- 浏览器的同源策略: 只有ip和端口一致, 才会将cookie发送给服务器, 这样会让数据更加安全

```python
# 漫画的详情页面
@app.route('/detail')
def detail():
    # 先取出请求头中的cookie数据
    is_help = request.cookies.get("isHelp")
    # 根据cookie数据进行判断
    if is_help:
        # cookie中记录了数据, 说明显示过帮助信息
        return "直接显示漫画详情页面"

    # 手动创建响应对象
    response = make_response("显示帮助信息")  # type: Response
    # 将数据设置到响应头的set_cookie字段
    response.set_cookie("isHelp", "1")  # 值必须是字符串
    return response
```

- Cookie的过期时间    通过`max-age`来设置
	1. `-1`:  默认值, 表示浏览器关闭时cookie会被删除
	2. `0`:  表示立即删除cookie
	3. `正数`:  以秒为单位  如 max-age=5, 表示5秒后cookie被删除

```python
  # max-age用于设置过期时间
  response.set_cookie("isHelp", "1", max_age=86400*30)  # 值必须是字符串
  # 删除cookie数据 本质就是设置max-age=0
  response.delete_cookie("isHelp")
```


#### 4.2 session

特点:
	1. session会将数据保存在服务器, 比如服务器的数据库中 (更安全)


场景:
	一般用于保存一些重要/敏感的数据
