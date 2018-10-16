# flask框架3

[TOC]

### 一. 模板

#### 1. 模板的基本使用

```python
# 模板: 需要进行内容替换的静态页面
# 模板渲染: 对模板进行内容替换  底层原理使用正则表达式进行匹配

"""
模板渲染:
1.将模板文件放入模板文件夹, 并且设置模板语言
2.使用render_template()来渲染模板, 将需要替换的内容设置模板变量并传入模板
3.在模板中使用模板变量替换内容
"""

from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def index():
    # 读取出模板文件中的内容, 对指定内容进行替换后, 将替换后的html字符串返回给前端
    keyword = "上海"
    html_str = render_template("baidu.html", kw=keyword)
    return html_str
```


#### 2. 模板变量 (重点)

```python
class User:
    type = "vip"

    def is_login(self):
        return True

@app.route('/demo1')
def demo1():
    name = "zs"
    age_dict = {"zs": 20, "ls": 30}
    height_list = [1.7, 1.8]
    user = User()
    return render_template("demo1_template.html", name=name, age_dict=age_dict, height_list=height_list, user=user)
```

```htmlbars
<label>{{ name }}</label><br/>
<label>{{ age_dict["zs"] }}</label><br/>
<label>{{ age_dict.zs }}</label><br/>  {# 支持点语法 #}
<label>{{ height_list[0] }}</label><br/>
<label>{{ height_list.0 }}</label><br/>
<label>{{ height_list.0 + age_dict.ls }}</label><br/>  {# 支持运算 #}
<label>{{ user.type }}</label><br/>  {# 支持自定义类型 #}
<label>{{ user.is_login() }}</label><br/>
```


#### 3. 过滤器

##### 1. 内置过滤器

- 作用: 对模板变量进行格式转换

```python
<label>{{ name | upper }}</label><br/>
<label>{{ name | upper | reverse }}</label><br/> {# 支持链式调用 #}
<label>{{ height_list | sum }}</label><br/>
<label>{{ age_list | sum(attribute="age") }}</label><br/> {# 部分过滤器支持传参 #}
{{ h1_tag | safe }} {# jinja2模板会自动对html语法进行转义 使用safe过滤器可以取消转义(浏览器正常解析标签) #}

{# 过滤代码块 #}
<label>
    {% filter upper %}
        hello world, python
    {% endfilter %}
</label>
```


##### 2. 自定义过滤器

```python
# 定义过滤器  本质 函数
@app.template_filter("li_reverse")  # 装饰器形式添加过滤器
def do_list_reverse(s):  # 参数用于接收模板变量
    # 将转换后的数据返回
    return s[::-1]


# 添加过滤器
# app.add_template_filter(do_list_reverse, "li_reverse")
```


#### 4. 控制代码块 (重点)

```python
{% for item in my_list if item.id != 5 %}
    {% if loop.index == 1 %}
        <li style="background-color: #cd4971">{{ item.value }}</li>
    {% elif loop.index == 2 %}
        <li style="background-color: #3c8dff">{{ item.value }}</li>
    {% elif loop.index == 3 %}
        <li style="background-color: #4cc74c">{{ item.value }}</li>
    {% else %}
        <li style="background-color: #525252">{{ item.value }}</li>
    {% endif %}
{% endfor %}
```

#### 5. 前端渲染 vs 后端渲染 (理解)

- 后端渲染: 后端使用`正则表达式`直接对html内容进行替换
	- 缺点: 开发时前后端不分离,  开发效率较低
	- 优点: 有利于`SEO`(搜索引擎优化)
- 前端渲染: 前端`js` 利用`html DOM对象`对html进行更新
	- 一般会使用`ajax`发起请求, 然后由后端将数据以`json`形式返回, 以便前端进行模板渲染
	- 优点: 可以对页面进行`局部动态刷新`

#### 6. 模板继承 (重点)

- 作用: 对html中的相同内容进行抽取, 减少重复的代码
- 基类文件
	- 将共同的内容抽取到文件中
	- 在需要自定义内容的位置 定义代码块

```htmlbars
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<body>
<h2>顶部内容</h2>
{# 对需要进行自定义的位置 定义代码块 #}
{% block content_block %}

{% endblock %}

<h2>底部内容</h2>
</body>

</html>
```

- 子类文件
	- 继承父类文件中的内容
	- 对需要自定义的位置进行重写

```htmlbars
{% extends "demo4_base.html" %}  {# 继承父类文件中的所有内容 #}

{# 子类文件对需要自定义的位置进行重写 #}
{% block content_block %}
<li>势如破竹！人民币再度连闯四道关口 在岸、离岸双双升破6.42</li>
<li>凛冬已至，还有多少银行人在假装干银行</li>
<li>人民日报：部分城市楼市放松限制引关注，楼市调控不会“拉抽屉”</li>

    {{ super() }}  {# 调用被重写的父类代码块 #}
{% endblock %}
```

#### 7. 模板中可用的变量/函数

```python
{# 可以直接在模板中使用的变量  request session  g #}
<label>{{ request.url }}</label><br/>
<label>{{ session.name }}</label><br/>
<label>{{ g.age }}</label><br/>

{# 可以直接在模板中使用的函数  url_for  get_flashed_messages #}
{# get_flashed_messages 取出所有的闪现消息(一般用于进行状态提示 如弹窗)  #}
<label>{{ url_for("index") }}</label><br/>

{% for get_flashed_message in get_flashed_messages() %}
<script>alert("{{ get_flashed_message }}")</script>
{% endfor %}
```

```python
@app.route('/')
def index():
    session["name"] = "zs"
    g.age = 20
    # 发出闪现消息  会被保存到一个容器中
    flash("你好")
    flash("再见")
    return render_template("demo5_template_var.html")

@app.route('/demo1')
def demo1():
    # flash消息特点: 如果闪现消息没有在当前请求中取出, 会被保留到下一个请求中
    flash("呵呵")
    return "demo1"
```

### 二. CSRF

#### 1. CSRF攻击过程

- CSRF 跨站请求伪造
- 攻击对象: 实现了免密码登录的目标网站(`使用状态保持机制`)
- 攻击形式: 使用`隐藏表单`发起`跨站请求`, 利用`状态保持`机制, 实现攻击

![Alt text](./1537262043425.png)

#### 2. CSRF保护 (理解)

- 生成`随机令牌`, 派发到`cookie`和`表单`中
- 提交表单时, `取出`cookie和表单中的令牌, 进行校验

![Alt text](./1537262818252.png)


```python
# 转账页面路由
@app.route('/transfer', methods=["POST", "GET"])
def transfer():
    # 从session中取到用户名
    username = session.get('username')
    # 如果没有取到，代表没有登录
    if not username:
        return redirect(url_for('index'))

    if request.method == "POST":
        # 取出cookie和表单中的令牌
        cookie_token = request.cookies.get("csrf_token")
        form_token = request.form.get("csrf_token")
        # 校验是否一致, 如果不一致, 非法请求
        if cookie_token != form_token:
            return redirect(url_for("index"))

        # 获取表单数据
        to_account = request.form.get("to_account")
        money = request.form.get("money")
        return '转账 %s 元到 %s 成功' % (money, to_account)

    # 生成随机令牌, 并派发到cookie和表单中
    token = base64.b64encode(os.urandom(48)).decode()
    # cookie保存令牌
    response = make_response(render_template("temp_transfer.html", csrf_token=token))
    response.set_cookie("csrf_token", token)
    return response
```


#### 3. Flask中的CSRF保护  (重点)

- flask组件`flask-wtf`中内置了CSRF保护机制

- 校验令牌

```python
# 开启CSRF保护 (一旦开启, 就会对所有的POST请求进行CSRF保护, 从cookie和表单中取出csrf_token对应的令牌,并校验是否一致, 如果不一致,页面提示拒绝访问)
CSRFProtect(app)
```

- 生成和派发令牌

```htmlbars
{# 将生成的令牌通过模板变量设置到表单中 #}
{# 调用函数csrf_token(), 会自动生成一个随机令牌, 并记录到cookie中, 最后将令牌返回给表单 #}
<input type="hidden" name="csrf_token" value="{{ csrf_token() }}">
```