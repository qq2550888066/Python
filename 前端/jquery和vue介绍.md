#今日学习目标:

* 理解什么是事件冒泡
* 掌握事件冒泡的作用
* 掌握怎么阻止事件冒泡
* 掌握怎么阻止默认行为，如:阻止表单提交
* 掌握怎么合并阻止操作
* 理解什么是事件委托
* 掌握一般绑定事件的写法
* 掌握事件委托的写法
* 掌握jquery将新创建的标签插入到现有的标签中
* 熟悉ajax基础
* 熟悉json基础和书写格式



## 一.  事件冒泡

###什么是事件冒泡 

> 在一个对象上触发某类事件（比如单击onclick事件），如果此对象定义了此事件的处理程序，那么此事件就会调用这个处理程序，如果没有定义此事件处理程序或者事件返回true，那么这个事件会向这个对象的父级对象传播，从里到外，直至它被处理（父级对象所有同类事件都将被激活），或者它到达了对象层次的最顶层，即document对象（有些浏览器是window）。



###事件冒泡的作用

> 事件冒泡允许多个操作被集中处理（把事件处理器添加到一个父级元素上，避免把事件处理器添加到多个子级元素上），它还可以让你在对象层的不同级别捕获事件。

###阻止事件冒泡 

> 事件冒泡机制有时候是不需要的，需要阻止掉，通过 event.stopPropagation() 来阻止

```html
<script>
$(function(){
    var $father = $('.father');
    var $son = $('.son');
    var $grandson = $('.grandson');
    $father.click(function() {
        alert('father');
    });
    
    $son.click(function() {
        alert('son');
    });
    
    $grandson.click(function(event) {
        alert('grandson');
        event.stopPropagation();
    });
    
    $(document).click(function(event) {
        alert('grandfather');
    });
})
</script>

    
<div class="father">
    <div class="son">
        <div class="grandson"></div>
    </div>
</div>
```



###阻止默认行为

> 阻止表单提交

```
$('#form1').submit(function(event){
    event.preventDefault();
})
```



###合并阻止操作

实际开发中，一般把阻止冒泡和阻止默认行为合并起来写，合并写法可以用

```
// event.stopPropagation();
// event.preventDefault();

// 合并写法：
return false;
```

###课堂练习

![QQ截图20180530201505](新建文件夹/QQ截图20180530201505.png)

页面弹框（点击弹框外弹框关闭):

```html
<head>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#btn01').click(function(){
                $('#pop').show();
                return false;
            })

            $('#shutoff').click(function(){
                $('#pop').hide();
            })
            
            $(document).click(function(){
                $('#pop').hide();
            })

            $('.pop_con').click(function(){
                return false;
            })

        })
    </script>
</head>
<body>
    <input type="button" value="弹出弹框" id="btn01">
    <div class="pop_main" id="pop">

        <div class="pop_con">
            <div class="pop_title">
                <h3>系统提示</h3>
                <a href="#" id="shutoff">×</a>
            </div>
            <div class="pop_detail">
                <p class="pop_text">亲！请关注近期的优惠活动！</p>
            </div>
            <div class="pop_footer">       
            </div>
        </div>
        
        <div class="mask"></div>
    </div>
</body>
```



### 总结:

* 事件冒泡是一种常用的思想
* 事件冒泡是 js 对对象事件的处理策略,是 js 是的一种实现机制
* 事件冒泡:   子元素会把事件, 传递给它的父级, 以此类推
* 我们可以阻止事件冒泡:  使用: stopPropagation( )的方法
* 我们也可以通过调用某些事件, 然后以 return false 的形式,阻止事件冒泡
* 阻止默认行为:   preventDefault( )





## 二. 事件委托

> 事件委托就是利用冒泡的原理，把事件加到父级上，通过判断事件来源的子集，执行相应的操作
>
> 事件委托首先可以极大减少事件绑定次数，提高性能；
>
> 其次可以让新加入的子元素也可以拥有相同的操作。

###一般绑定事件的写法

```
$(function(){
    $ali = $('#list li');
    $ali.click(function() {
        $(this).css({background:'red'});
    });
})


<ul id="list">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
</ul>
```

###事件委托的写法

```html
<script>
$(function(){
    $ul = $('#list');
    $ul.delegate('li', 'click', function() {
        $(this).css({background:'red'});
    });
})
</script>


<ul id="list">
    <li>1</li>
    <li>2</li>
    <li>3</li>
    <li>4</li>
    <li>5</li>
</ul>
```

### 总结: 

* 事件委托就是将本体不方便做的事情,委托给别的对象
* 事件委托是我们集中处理某些事件的一种方式
* 事件委托用的是delegate方法, 其中的参数为:
  * 第一个参数: 请求委托的对象
  * 第二个参数: 请求委托的事件类型
  * 第三个参数: 请求委托的处理方式(回调函数)



## 三.  Dom操作

元素节点操作指的是改变 html 的标签结构，它有两种情况：
1、移动现有标签的位置
2、将新创建的标签插入到现有的标签中



###创建新标签

```
var $div = $('<div>'); //创建一个空的div
var $div2 = $('<div>这是一个div元素</div>');
```



移动或者插入标签的方法

####append( )

> 在元素内部添加，从后面放入

```
使用方法: 


$(selector).append(content)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#app')
            var $span = $('<span>这是一个span元素</span>')
            $div.append($span)
        })
    </script>
</head>
<body>
    <div id="app">div元素</div>
</body>
```

效果:

```
div元素这是一个span元素
```



####appendTo( )

> 在元素内部添加，从后面放入

```
使用方式:

$(content).appendTo(selector)
```

例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){

            var $div1 = $('#app')
            var $div2 = $('#box')
            
            var $span = $('<span>这是一个span元素11</span>')
            $span.appendTo($div1)

            $('<em>哈哈哈,斜体</em>').appendTo($div2)
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
    <div id="box">第二个div元素</div>
</body>
```

结果:

```
第一个div元素这是一个span元素11
第二个div元素哈哈哈,斜体
```





####prepend( )

> 在元素内部添加，从前面放入

```
使用方式:

$(selector).prepend(content)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $div1.prepend('<a href="#">a标签</a>')
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
</body>
```

结果:

```
a标签第一个div元素
```



#### prependTo( )

> 在元素内部添加，从前面放入

```
使用方法:

$(content).prependTo(selector)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $('<a href="#">a标签</a>').prependTo($div1)
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
</body>
```

结果:

```
a标签第一个div元素
```



####after( )

>  在元素外部添加，从后面放入

```
使用方式:

$(selector).after(content)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $div1.after("<em>哈哈,斜体</em>")
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
</body>
```

结果:

```
第一个div元素
哈哈,斜体                // 斜的,这里可能看不出来...
```



####insertAfter( )：

> 在元素外部添加，从后面放入
>
> 注释：如果该方法用于已有元素，这些元素会被从当前位置移走，然后被添加到被选元素之后。

```
使用方法:

$(content).insertAfter(selector)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $('<em>哈哈,斜体</em>').insertAfter($div1)
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
</body>
```

结果:

```
第一个div元素
哈哈,斜体
```





####before( )

> 在被选元素前插入指定的内容。 

```
使用方式:

$(selector).before(content)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $div1.before("<em>哈哈,斜体</em>")
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
</body>
```

结果:

```
哈哈,斜体
第一个div元素
```



####insertBefore( )

> insertBefore() 方法在您指定的已有子节点之前插入新的子节点。

```
使用方式:

$(content).insertBefore(selector)
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $('<em>哈哈,斜体</em>').insertBefore($div1)
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
</body>
```

结果:

```
哈哈,斜体
第一个div元素
```





###删除标签

```
使用方式: 


$(selector).remove()
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#app')
            $div1.remove()
        })
    </script>
</head>
<body>
    <div id="app">第一个div元素</div>
    <div id="box">第二个div元素</div>
</body>
```

结果:

```
第二个div元素
```



### 总结:

* Dom 元素这里指的就是 HTML标签,有时候大家会听到 DOM树的概念, 那是因为 HTML 中的标签,就像是树一样, 根部是 `<html>`标签, 然后是`<body>`和`<head>`,再然后一级一级往下排,最终形成树形结构
* 我们可以通过 jquery 来动态的修改 HTML 的结构,使用的就是上述的方法
* append( ) 方法可以在元素内部后方, 添加新的元素,   appendTo( ) 也差不多, 只是添加的顺序进行了调换
* prepend( ) 方法可以在元素内部前方, 添加新的元素, prependTo( ) 与之类似, 添加的顺序进行了调换.
* after( ) 方法是指在当前元素外部,从后方插入一个新的元素
* before( ) 这个方法则正好和after( ) 方法相反, 在当前元素前方,插入一个新的元素
* insertBefore( )  则是在指定的元素之前插入子元素, 这些内容大家只需要简单了解, 使用起来的时候能够想的起来即可, 实在是忘记了, 可以到时候查一下文档.
* 删除某个元素不必多说就是:  某个想要删除的元素调用remove( ) 方法即可.





###todolist ---- 课堂练习 

todolist(计划列表)实例

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>todolist</title>
	<style type="text/css">
		.list_con{
			width:600px;
			margin:50px auto 0;
		}
		.inputtxt{
			width:550px;
			height:30px;
			border:1px solid #ccc;
			padding:0px;
			text-indent:10px;			
		}
		.inputbtn{
			width:40px;
			height:32px;
			padding:0px;
			border:1px solid #ccc;
		}
		.list{
			margin:0;
			padding:0;
			list-style:none;
			margin-top:20px;
		}
		.list li{
			height:40px;
			line-height:40px;
			border-bottom:1px solid #ccc;
		}

		.list li span{
			float:left;
		}

		.list li a{
			float:right;
			text-decoration:none;
			margin:0 10px;
		}
	</style>
	<script type="text/javascript" src="./jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
        $(function(){
            // 增加
            var $input = $('#txt1')
            var $addBtn = $('#btn1')
            var $ul = $('#list')
            $addBtn.click(function(){
                if($input.val() == ''){
                    alert('请输入内容')
                    return
                }

                // $ul.append($input.val())
                $ul.append('<li><span>'+$input.val()+'</span><a href="javascript:;" class="up"> ↑ </a><a href="javascript:;" class="down"> ↓ </a><a href="javascript:;" class="del">删除</a></li>')
                
                $input.val('')
            })

            // 删除
            $ul.delegate('a','click',function(){
                var className = $(this).prop('class')
                if (className == 'up') {
                    if($(this).parent().prev().length == 0){
                        alert('到顶了')
                        return;
                    }
                    $(this).parent().insertBefore( $(this).parent().prev() )
                }
                if(className == 'del'){
                    $(this).parent().remove()
                }
                if(className == 'down'){
                    if($(this).parent().next().length == 0){
                        alert('到底了')
                        return
                    }
                    $(this).parent().insertAfter($(this).parent().next())
                }
            })
        })
	</script>	
</head>
<body>

	<div class="list_con">
	<h2>To do list</h2>
		<input type="text" name="" id="txt1" class="inputtxt">
		<input type="button" name="" value="增加" id="btn1" class="inputbtn">
		
		<ul id="list" class="list">

			<li><span>学习html</span><a href="javascript:;" class="up"> ↑ </a><a href="javascript:;" class="down"> ↓ </a><a href="javascript:;" class="del">删除</a></li>
			<li><span>学习css</span><a href="javascript:;" class="up"> ↑ </a><a href="javascript:;" class="down"> ↓ </a><a href="javascript:;" class="del">删除</a></li>
			<li><span>学习javascript</span><a href="javascript:;" class="up"> ↑ </a><a href="javascript:;" class="down"> ↓ </a><a href="javascript:;" class="del">删除</a></li>
			
		</ul>

	</div>
</body>
</html>
```





## 四.  JavaScript对象

> JavaScript 中的对象，可以理解成是一个键值对的集合，键是调用每个值的名称，值可以是基本变量，还可以是函数和对象。

创建 JavaScript 对象有两种方法:

* 一种是通过顶级 Object 类来实例化一个对象，然后在对象上面添加属性和方法：(此方法不常使用)

```
常用方法:

var person = new Object();

// 添加属性：
person.name = 'tom';
person.age = '25';

// 添加方法：
person.sayName = function(){
    alert(this.name);
}

// 调用属性和方法：
alert(person.age);
person.sayName();
```

* 还可以通过对象直接量的方式创建对象：( 经常使用 )

```
var person2 = {
    name:'Rose',
    age: 18,
    sayName:function(a){
        alert('My name is' + this.name);
    }
}

// 调用属性和方法：
alert(person2.age);
person2.sayName(10);
```

### 总结:

* JS 对象和我们在 python 中了解的对象略有不同, 最主要的区别还是 JS 对象不要类也可以定义
* 我们一般会在 JS 中使用 { } 直接创建对象的形式来使用







## 五.  Json

> json 是 JavaScript Object Notation 的首字母缩写，单词的意思是 javascript 对象表示法，这里说的 json 指的是类似于 javascript 对象的一种数据格式对象，目前这种数据格式比较流行，逐渐替换掉了传统的 xml 数据格式。

json 数据对象类似于JavaScript 中2的对象，但是它的键对应的值里面是没有函数方法的，值可以是普通变量，不支持 undefined，值还可以是数组或者 json 对象。

与 JavaScript 对象写法不同的是，json 对象的属性名称和字符串值需要用双引号引起来，用单引号或者不用引号会导致读取数据错误。

json 格式的数据：

```
{
    "name":"tom",
    "age":18
}
```

json 的另外一个数据格式是数组，和 javascript 中的数组字面量相同。

```
["tom",18,"programmer"]
```

还可以是更复杂的数据机构：

```
{
    "name":"jack",
    "age":29,
    "hobby":["reading","travel","photography"]
    "school":{
        "name":"Merrimack College",
        "location":"North Andover, MA"
    }
}
```



### json字符串转js对象: 

```
var json_str = '{"name" : "zs", "age" : 20}'
json_obj = JSON.parse(json_str)
console.log(json_obj)
```



### js对象转为 json字符串

```
var json_str = '{"name" : "zs", "age" : 20}'
json_obj = JSON.parse(json_str)
str = JSON.stringify(json_obj)
console.log(str)
```









#### 总结: 

* json 是现在市面上普遍使用的数据传输形式.
* json 中如果是字符串, 则需要使用双引号, 如果是数字, 则不需要
* json 的数据和是和对象非常相似, 这点需要注意
* 现在市场上使用 json 比较多的原因是这种数据传输方式非常方便, 简洁.



## 六. ajax 与 jsonp

> ajax 技术的目的是让 javascript 发送 http 请求，与后台通信，获取数据和信息。ajax技术的原理是实例化 xml  http 对象，使用此对象与后台通信。ajax通信的过程不会影响后续javascript的执行，从而实现异步。



####同步和异步

现实生活中，同步指的是同时做几件事情，异步指的是做完一件事后再做另外一件事，程序中的同步和异步是把现实生活中的概念对调，也就是程序中的异步指的是现实生活中的同步，程序中的同步指的是现实生活中的异步。



###局部刷新和无刷新

ajax 可以实现局部刷新，也叫做无刷新，无刷新指的是整个页面不刷新，只是局部刷新，ajax可以自己发送http请求，不用通过浏览器的地址栏，所以页面整体不会刷新，ajax获取到后台数据，更新页面显示数据的部分，就做到了页面局部刷新。



###数据接口

数据接口是后台程序提供的，它是一个 url 地址，访问这个地址，会对数据进行增、删、改、查的操作，最终会返回 json 格式的数据或者操作信息，格式也可以是text、xml等。



###$.ajax使用方法

```
使用方法: 

$.ajax({
    url:'请求地址',
    type: '请求方式: 默认是'GET'，常用的还有'POST' ',
    dataType: '设置返回的数据格式，常用的是'json'格式，也可以设置为'html' ',
    data: '设置发送给服务器的数据',
    success: '设置请求成功后的回调函数',
    error: '设置请求失败后的回调函数',
    async: '设置是否异步，默认值是'true'，表示异步'
})
```

> 常用参数：
>
> 1、url 			请求地址
> 2、type 			请求方式，默认是'GET'，常用的还有'POST'
> 3、dataType 		设置返回的数据格式，常用的是'json'格式，也可以设置为'html'
> 4、data 			设置发送给服务器的数据
> 5、success 		设置请求成功后的回调函数
> 6、error 			设置请求失败后的回调函数
> 7、async 		设置是否异步，默认值是'true'，表示异步



以前的写法：

```
$.ajax({
    url: '/change_data',
    type: 'GET',
    dataType: 'json',
    data:{'code':300268}
    success:function(dat){
        alert(dat.name);
    },
    error:function(){
        alert('服务器超时，请重试！');
    }
});
```

新的写法(推荐)：

```
$.ajax({
    url: '/change_data',
    type: 'GET',
    dataType: 'json',
    data:{'code':300268}
})
.done(function(dat) {
    alert(dat.name);
})
.fail(function() {
    alert('服务器超时，请重试！');
});

```

例如:

```html
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        // {"movieType":"in_theaters","pageIndex":2,"start":0,"count":10}
        $(function(){
            $.ajax({
                url:'http://localhost:3008/getMovieListData?message={"movieType":"in_theaters","pageIndex":2,"start":0,"count":10}',
                type:'get',
                dataType:'json'
            }).done(function(data){
                console.log(data)
            }).fail(function(error){
                
            })
        })
    </script>
```



###$.ajax的简写方式

`$.ajax`按照请求方式可以简写成`$.get`或者`$.post`方式

```
$.get("/change_data", {'code':300268},
  function(dat){
    alert(dat.name);
});

$.post("/change_data", {'code':300268},
  function(dat){
    alert(dat.name);
});
```



###同源策略

ajax 请求的页面或资源只能是同一个域下面的资源，不能是其他域的资源，这是在设计 ajax 时基于安全的考虑。特征报错提示：

```
XMLHttpRequest cannot load https://www.baidu.com/. No  
'Access-Control-Allow-Origin' header is present on the requested resource.  
Origin 'null' is therefore not allowed access.
```



###jsonp  (删除部分)

> ajax 只能请求同一个域下的数据或资源，有时候需要跨域请求数据，就需要用到 jsonp 技术，jsonp 可以跨域请求数据，它的原理主要是利用了`<script>`标签可以跨域链接资源的特性。jsonp 和 ajax 原理完全不一样，不过 jquery 将它们封装成同一个函数。



###获取豆瓣电影数据 --- 课堂实例

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
             $('.btn').click(function(){
             
                $.ajax({
                    url:'https://api.douban.com/v2/movie/in_theaters?start=0&count=10',
                    type:'get',
                    dataType:'jsonp',
                }).done(function(data){
                    console.log(data)
                    var array = data.subjects
                    $('.list').append(array[0].title)
                })
            })
        })
    </script>
</head>
<body>
    <div class="btn">点此获取电影数据</div>
    <ul class="list"></ul>
</body>
```

一般 ajax 数据接口和 jsonp 数据接口的区别

> 开发返回数据的接口，如果是一般的 ajax 接口，让接口直接返回 json 格式的数据字符串就可以了，这种接口的数据是不能跨域请求的，如果要跨域请求数据，需要开发jsonp的接口，开发jsonp的接口，需要获取请求地址中的参数，也就是'callback'键对应的值，然后将这个值和json数据拼装成一个函数调用的形式的字符串返回，就完成了一个jsonp的接口，这个键值对是由$.ajax函数自动产生的。比如：'callback'键对应的值一般是这样的：jQuery1124018787969015631711_1522330257607，所以：

- 一般接口返回的数据形式：

  '{"iNum":12,'sTr':'abc'}';

- jsonp返回的数据形式：

  'jQuery1124018787969015631711_1522330257607({"iNum":12,"sTr":"abc"})';



###总结:

* 这章的概念比较多, 但是我们不需要都了解掌握, 我们只需要能够简单的使用 $.ajax即可
* 现在市面上数据请求的形式比较多, 普遍有 get  post  jsonp
* 同步和异步的概念也要明白,  异步指的是多个步骤同时进行.   同步指的是多个步骤一步一步执行.





# 总结今日学习目标:

- 理解什么是事件冒泡
- 掌握事件冒泡的作用
- 掌握怎么阻止事件冒泡
- 掌握怎么阻止默认行为，如:阻止表单提交
- 掌握怎么合并阻止操作
- 理解什么是事件委托
- 掌握一般绑定事件的写法
- 掌握事件委托的写法
- 掌握jquery将新创建的标签插入到现有的标签中
- 熟悉ajax基础
- 熟悉json基础和书写格式



# 今日学习目标:

* 掌握vue模板语法
* 掌握vue计算属性
* 了解vue侦听属性
* 掌握vue Class与Style绑定
* 掌握vue条件渲染



### 

## 七.  `vue.js` 简介

> `Vue.js`读音 /vjuː/, 类似于 view

> `Vue.js`是前端三大新框架：`Angular.js`、`React.js`、`Vue.js`之一，Vue.js目前的使用和关注程度在三大框架中稍微胜出，并且它的热度还在递增。

> `Vue.js`可以作为一个 js 库来使用，也可以用它全套的工具来构建系统界面，这些可以根据项目的需要灵活选择，所以说，`Vue.js`是一套构建用户界面的渐进式框架。

> `Vue`的核心库只关注视图层，`Vue`的目标是通过尽可能简单的 API 实现响应的数据绑定，在这一点上`Vue.js`类似于后台的模板语言。

> `Vue`也可以将界面拆分成一个个的组件，通过组件来构建界面，然后用自动化工具来生成单页面(SPA - single page application)系统。



#### `Vue.js`使用

> 文档及下载 Vue

`Vue.js`使用文档已经写的很完备和详细了，通过以下地址可以查看： 

https://cn.vuejs.org/v2/guide/

`vue.js`如果当成一个库来使用，可以通过下面地址下载： 

https://cn.vuejs.org/v2/guide/installation.html





## 八. `Vue.js`基本概念

首先通过将vue.js作为一个js库来使用，来学习vue的一些基本概念，我们下载了vue.js后，需要在页面上通过script标签引入vue.js，开发中可以使用开发版本vue.js，产品上线要换成vue.min.js。

```
<script type="text/javascript" src="js/vue.min.js"></script>
```

####`Vue`实例

每个 Vue 应用都是通过实例化一个新的 Vue对象开始的：

```html
<script>
   window.onload = function(){
        var vm = new Vue({
            el:'#app',
            data:{message:'hello world!'}
        });
	}   
</script>
 

<div id="app">
	{{ message }}
</div>
```

> 其中，el属性对应一个标签，当vue对象创建后，这个标签内的区域就被vue对象接管，在这个区域内就可以使用vue对象中定义的属性和方法。



#### 数据与方法

当一个 Vue 实例被创建时，它向 Vue 的响应式系统中加入了其data对象中能找到的所有的属性。当这些属性的值发生改变时，视图将会产生“响应”，即匹配更新为新的值。还可以在Vue实例中定义方法，通过方法来改变实例中data对象中的数据，数据改变了，视图中的数据也改变。

```html
<script>
    window.onload = function(){
        var vm = new Vue({
            el:'#app',
            data:{message:'hello world!'},
            methods:{
                fnChangeMsg:function(){
                    this.message = 'hello Vue.js!';
                }
            }
        });
    }    
</script>


<div id="app">
    <p>{{ message }}</p>
    <button v-on:click="fnChangeMsg">改变数据和视图</button>
</div>
```

####总结:

* vue使用的时候,必须要通过 new Vue( ) 来实例化一个对象

* vue实例化的对象中, 常见的参数为:  

  * el:     关联 HTML 部分的标签, 使 vue 中的内容能够加载到 HTML里面去
  * data:   页面中需要的数据, 可以通过这个属性进行初始化, 进而赋值到 HTML 页面去
  * methods:   可以给当前vue对象添加方法, 一般我们都会把方法放在这个对象里面
  * computed:   后面会学到, 这个是计算属性, 我们可以给data里面的值添加一些管理,放在这里
  * watch:   如果需要监控data中的某些属性值, 可以在watch中添加监听方法.

* vue 中一般会使用小胡子语法:  {{ }} (插值表达式)

* vue 中添加点击事件使用的不是 onclick ,  而是 v-on:click   大家先记一下, 下面会仔细讲

  



## 九. Vue 模板语法

> 模板语法指的是如何将数据放入 html 中，Vue.js使用了基于 HTML的模板语法，允许开发者声明式地将DOM绑定至底层 Vue 实例的数据。所有 Vue.js的模板都是合法的 HTML ，所以能被遵循规范的浏览器和 HTML 解析器解析。

#### 插入值

数据绑定最常见的形式就是使用“Mustache”语法 (双大括号) 的文本插值：

```
<span>Message: {{ msg }}</span>
```

如果是标签的属性要使用值，就不能使用“Mustache”语法，需要写成使用v-bind指令：

```html
<a v-bind:href="url" v-bind:title='tip'>百度网</a>
```

### 插入的值当中还可以写表达式：

```
{{ number + 1 }}
{{ ok ? 'YES' : 'NO' }}
{{ message.split('').reverse().join('') }}
<a v-bind:href="url">链接文字</a>
```



#### 指令

指令 (Directives) 是带有“v-”前缀的特殊属性。指令属性的值预期是单个JavaScript表达式，指令的职责是，当表达式的值改变时，将其产生的连带影响，响应式地作用于DOM。常见的指令有v-bind、v-if、v-on。

```
<!-- 根据ok的布尔值来插入/移除 <p> 元素 -->
<p v-if="ok">是否显示这一段</p>

<!-- 监听按钮的click事件来执行fnChangeMsg方法 -->
<button v-on:click="fnChangeMsg">按钮</button>
```



#### 缩写

v-bind和v-on事件这两个指令会经常用，所以有简写方式：

```
<!-- 完整语法 -->
<a v-bind:href="url">...</a>

<!-- 缩写 -->
<a :href="url">...</a>


<!-- 完整语法 -->
<button v-on:click="fnChangeMsg">按钮</button>

<!-- 缩写 -->
<button @click="fnChangeMsg">按钮</button>
```



#### 总结:

* 我们可以通过小胡子语法 {{ }} 向 HTML 中添加数据
* vue 中有指令的概念:  以 v- 开头 ,这里是参考的 angular  框架,  angular 框架以: ng- 开头
* v-bind:   这个方法是绑定的意思,  主要是把 data 中的属性和 HTML 页面中的属性值绑定到一起
* 事件在 vue 中:   v-on:  click 表示.            可以简写成:  @click             
  * 简写的形式经常使用, 但是需要了解 v-on:的意义
* v-bind:  绑定方法也可以简写:  简写为`:`
* 小胡子语法中可以进行简单的逻辑运算,这个属于了解层次, 知道就够了, 一般不会这样用



## 十.  计算属性和侦听属性

#### 计算属性

模板内的表达式非常便利，但是设计它们的初衷是用于简单运算的。在模板中放入太多的逻辑会让模板过重且难以维护。例如：

```html
<div id="example">
  {{ message.split('').reverse().join('') }}
</div>
```

这个表达式的功能是将message字符串进行反转，这种带有复杂逻辑的表达式，我们可以使用计算属性

```
<div id="example">
  <p>Original message: "{{ message }}"</p>
  <p>Computed reversed message: "{{ reversedMessage }}"</p>
</div>



var vm = new Vue({
  el: '#example',
  data: {
    message: 'Hello'
  },
  computed: {
    // 计算属性的 getter
    reversedMessage: function () {
      // `this` 指向 vm 实例
      return this.message.split('').reverse().join('')
    }
  }
})
```



#### 监听属性

侦听属性的作用是侦听某属性值的变化，从而做相应的操作，侦听属性是一个对象，它的键是要监听的对象或者变量，值一般是函数,当你侦听的元素发生变化时，需要执行的函数，这个函数有两个形参，第一个是新值,   第二个是旧值。

```html
<head>
    <script src="./vue.js"></script>
    <script>
        window.onload = function (){
            var vm = new Vue({
                el:'#app',
                data:{
                    msg:'haha'
                },
                watch: {
                    msg:function(newvalue,oldvalue){
                        alert('哈哈')
                    }
                }
            })
        }
    </script>
</head>
<body>
    <div id="app">
        <input type="text" v-model="msg">
        {{ msg }}
    </div>
</body>
```

#### 总结: 

* 计算属性总体来说就是为了把一些data中属性的逻辑运算移除小胡子以外, 这是 vue 作者针对这个框架进行的优化, 作者推荐这样使用, 但是不会的话可以不用. 没有实际意义
* 监听属性,最主要的就是记住 watch  这个关键字在所有的编程语言中差不多都是监听,监视的意思.  通过这个属性, 我们可以得到别的属性什么时候发生了变化, 这样对于我们来说非常重要, 在公司, 很多时候会用到这个方法.  watch 监听的属性,  属性一旦发生变化,就会调用对应的方法, 方法中有两个参数, 一个是老的值, 一个是新值.





## 十一. Class 与 Style 绑定

使用 v-bind 指令来设置元素的 class 属性或者sytle属性，它们的属性值可以是表达式，vue.js在这一块做了增强，表达式结果除了是字符串之外，还可以是对象或者数组。

### Class绑定

##### 用法一: 可以用一个布尔值控制类名加载

>  控制类名的加载与否

```html
<style>
    .basic {
        color:red;
    }
    .box {
        background-color:red;
    }
    .divbox {
        width:100px;
        height:100px;
    }
</style>


<div id="app">
    <div class="box divbox"></div>
    <div class="basic" v-bind:class="{box:isActive, divbox:isHave}"></div>
</div>


<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
            // 控制类名是否加载的变量
             isActive: true,
  			isHave:   false
        }
    })
</script>
```

最终渲染的效果：

```
<div class="static box"></div>
```



#####用法二:  可以给 class 传一个对象

>  对象内部控制类名的加载与否

```html
<style>
    .basic {
        color:red;
    }
    .box {
        background-color:red;
    }
    .divbox {
        width:100px;
        height:100px;
    }
</style>

<div id="app">
    <div class="basic" v-bind:class="{box:isActive, divbox:isHave}"></div>
    <div class="basic" v-bind:class="objName"></div>
</div>

<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
            objName:{
                // 控制类名是否加载的变量
                box:false, 
                divbox:true
            }
        }
    })
</script>
```

最终渲染的效果：

```
<div class="static active"></div>
```



例如:

```html
<head>
    <script src="./vue.js"></script>
    <script>
        window.onload = function (){
            var vm = new Vue({
                el:'#app',
                data:{
                    isActive:false,
                    objName:{
                        active:true
                    }
                },
                methods: {
                    // 添加点击事件
                    btnBeclicked:function(){
                        // 属性值取反
                        this.isActive = !this.isActive
                        this.objName.isHave = !this.objName.isHave
                    }
                }
            })
        }
    </script>
    <style>
        .active {
            background-color: pink;
        }
    </style>
</head>
<body>
    <div id="app">
        <button @click="btnBeclicked">按钮控制样式切换</button>
        <div v-bind:class="{active:isActive}">这是第一个div标签</div>
        <div v-bind:class="objName">这是第二个div标签</div>
    </div>
</body>
```





#####用法三:  可以给 class 传一个数组

>  数组内部控制类名的加载与否

```html
<style>
    .basic {
        color:red;
    }
    .box {
        background-color:red;
    }
    .divbox {
        width:100px;
        height:100px;
    }
</style>

<div id="app">
    <div class="basic" v-bind:class="[firstName, secondName]"></div>
</div>

<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
            firstName:'box',
            secondName:'divbox'
        }
    })
</script>
```

最终渲染为：

```
<div class="basic box divbox"></div>
```



##### 用法四:  可以给 class 传一个三元表达式

>  用三元表达式来控制类名是否加载

> 需要注意:  三元表达式需要写在数组中

```html
<style>
    .basic {
        color:red;
    }
    .box {
        background-color:red;
    }
    .divbox {
        width:100px;
        height:100px;
    }
</style>

<div id="app">
    <div class="basic" v-bind:class="[isActive ? box : '', divbox]"></div>
</div>

<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
			isActive: true
        }
    })
</script>
```

最终渲染为：

```
<div class="basic box divbox"></div>
```





不过，当有多个条件class时这样写有些繁琐。所以在数组语法中也可以使用对象语法：

> 这样的使用方法了解即可, 一般我们不会使用

```html
<div v-bind:class="[{ active: isActive }, errorClass]"></div>
```



总结: 

* 正常使用class:  `class="box divbox"`
* 用变量控制类名的加载与否:  `:class="{box: true/false, divbox}"`
* 上面的式子我们也可以把对象赋一个名字, 调用名字: `:class="objName"`,其中:  `objName={box: true/false}`
* 可以使用数组来包裹类名: `:class=[firstName]`,其中: `firstName="divbox"`
* 也可以使用三元表达式,但是三元表达式需要放在数组中.



### style绑定

##### 用法一:  可以使用一个布尔值来决定样式是否作用到标签上

```html
<div id="app">
   	<!--正常的用法:-->
    <div style="color:red;font-size:30px;">
    <!--vue中的使用方法:-->
    <div v-bind:style="{color: colorName, fontSize: fontName + 'px'}"></div>
</div>

<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
			colorName: 'red',
             fontName: 30
        }
    })
</script>
```



##### 用法二:  也可以给 style 传一个对象

> 对象中

```html
<div id="app">
   	<!--正常的用法:-->
    <div style="color:red;font-size:30px;">
    <!--vue中的使用方法:-->
    <div v-bind:style="objName"></div>
</div>

<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
            objName:{
              	color: 'red',
                fontSize: '30px'  
            }
        }
    })
</script>
```





##### 用法三: style 上可以添加数组, 通过数组控制样式的加载

```html
<div id="app">
   	<!--正常的用法:-->
    <div style="color:red;font-size:30px;">
    <!--vue中的使用方法:-->
    <div v-bind:style="[style01, style02]"></div>
</div>

<script>
    var vm = new Vue({
        el:'#app',
        // data属性值如下：
        data:{
            style01:{
                color:'red',
                fontSize:'30px'
            },
            style02:{
                background:'pink'
            }
        }
    })
</script>
```



总结:  style可以这样使用: 

```html
<body>
    <div id="app">
        <p :style="{'color':colorName,'fontSize':fontSizeName}">设置style属性的p标签1</p>
        <p :style="sty01">设置style属性的p标签2</p>
        <p :style="[sty01,sty02]">设置style属性的p标签3</p>
    </div>

    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                colorName:'red',
                fontSizeName:'30px',
                sty01:{
                    color:'blue',
                    fontSize:'40px'
                },
                sty02:{
                    background:'gold'
                }
            }
        })
    </script>
</body>
```





#### 选项卡 --- 课堂实例

> 选项卡

![QQ截图20180528115919](新建文件夹/QQ截图20180528115919.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .tab_con{
            width:500px;
            height:350px;
            margin:50px auto 0;
        }
        .tab_btns{
            height:50px;
        }
        .tab_btns input{
            width:100px;
            height:50px;
            background:#ddd;
            border:0px;
            outline:none;
        }

        .tab_btns .active{
            background:gold;
        }

        .tab_cons{
            height:300px;
            background:gold;
        }

        .tab_cons div{
            height:300px;
            line-height:300px;
            text-align:center;
            display:none;
            font-size:30px;
        }

        .tab_cons .current{
            display:block;
        }
    </style>
    <script src="js/vue.js"></script>   
</head>

<body>
    <div class="tab_con" id="app">
        <div class="tab_btns">
            <input type="button" value="按钮一" :class="[(iNow==0)?'active':'']" @click="iNow=0">
            <input type="button" value="按钮二" :class="[(iNow==1)?'active':'']" @click="iNow=1">
            <input type="button" value="按钮三" :class="[(iNow==2)?'active':'']" @click="iNow=2">
        </div>
        <div class="tab_cons">
            <div :class="[(iNow==0)?'current':'']">按钮一对应的内容</div>
            <div :class="[(iNow==1)?'current':'']">按钮二对应的内容</div>
            <div :class="[(iNow==2)?'current':'']">按钮三对应的内容</div>
        </div>
    </div>
    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                iNow:0
            }
        })
    </script>
</body>
</html>
```

#### 总结: 

* class 和 style 往往就是和v-bind配合使用, 来使 data 中的属性能够加载到 HTML 部分
* 这里用的其实和小胡子语法很像, 但是大家需要注意一个问题:  在标签的属性位置, 不能添加小胡子语法:   也就是说在标签的属性位置不能够出现: `{{ }}`这样的符号.    
* class 和 style, 使用的是单个的对象 { }  





## 十二.  条件渲染

通过条件指令可以控制元素的创建(显示)或者销毁(隐藏)，常用的条件指令如下：

#### v-if

v-if可以控制元素的创建或者销毁

```
<h1 v-if="ok">Yes</h1>
```



#### v-else

v-else指令来表示 v-if 的“else 块”，v-else 元素必须紧跟在带 v-if 或者 v-else-if 的元素的后面，否则它将不会被识别。

```
<div v-if="Math.random() > 0.5">
  Now you see me
</div>
<div v-else>
  Now you don't
</div>
```

#### v-else-if

v-else-if，顾名思义，充当 v-if 的“else-if 块”，可以连续使用：

```
<div v-if="type === 'A'">
  A
</div>
<div v-else-if="type === 'B'">
  B
</div>
<div v-else-if="type === 'C'">
  C
</div>
<div v-else>
  Not A/B/C
</div>
```

#### v-show

另一个用于根据条件展示元素的选项是 v-show 指令。用法和v-if大致一样，但是它不支持v-else,它和v-if的区别是，它制作元素样式的显示和隐藏，元素一直是存在的：

```
<h1 v-show="ok">Hello!</h1>
```

案例: 

```html
<head>
    <script src="js/vue.js"></script>
</head>
<body>
    <div id="app">
        <div v-if="ok">使用v-if的div标签</div>
        <div v-else>使用v-else的div标签，要和v-if写在一起</div>

        <div v-if="type=='A'">
            A
        </div>
        <div v-else-if="type=='B'">
            B
        </div>
        <div v-else-if="type=='C'">
            C
        </div>
        <div v-else>
            Not A/B/C
        </div>

        <input type="button" value="改变字母" @click="fnChange">
        <p v-if="ok">使用v-if的p标签</p>
        <p v-show="ok">使用v-show的p标签</p>
    </div>
    
    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                ok:true,
                type:'B'
            },
            methods:{
                fnChange:function(){
                    this.type = 'D';
                }
            }
        })
    </script>
</body>
```



### 总结: 

* vue 这个框架会使我们使用非常方便, 所以它推出了很多的指令, 这些指令能够帮助我们快速方便的书写代码
* v-if  能够决定元素是否显隐, 如果隐藏, 则不会在 DOM 树中存在, 即一旦使用 v-if   隐藏某个元素,其实是销毁当前元素.
* v-else  一般和 v-if 配合使用, 不能够单独使用, 这一点请大家牢记
* v-show  和 v-if 的功能类似, 都能够控制元素的显隐, 但是它是通过样式: display: none;  来控制元素的, 而不像 v-if 是通过销毁与创建来控制.
* v-show  和 v-if  使用哪个的问题:  随意, 想使用哪个就使用哪个, 这个没有强制的要求, 只要能够达到目的就可以. 如果有的选,还是使用 v-show 好点, 不会频繁的操作 DOM 树.

 

# 总结今日学习目标:

- 掌握vue模板语法
- 掌握vue计算属性
- 了解vue侦听属性
- 掌握vue Class与Style绑定
- 掌握vue条件渲染







#今日学习目标:

* 掌握vue列表渲染
* 掌握vue事件处理
* 掌握vue表单输入绑定
* 了解vue实例生命周期
* 了解vue数据交互



## 十三.  列表渲染

> 通过 v-for 指令可以将一组数据渲染到页面中，数据可以是数组或者对象，v-for 指令需要使用 item in items 形式的特殊语法，items 是源数据数组并且 item 是数组元素迭代的别名。

#### 遍历数组

```html
<ul id="example-1">
  <li v-for="item in items">
    {{ item}}
  </li>
</ul>
```

vue对象创建如下：

```javascript
var example1 = new Vue({
  el: '#example-1',
  data: {
    items: ['foo','bar']
  }
})
```

如果想加上索引值，可以加上第二个参数

```html
<ul id="example-2">
  <li v-for="(item, index) in items">
    {{ index }} - {{ item.message }}
  </li>
</ul>
```

#### 遍历对象

> 可以通过 v-for 遍历一个对象, 获取对象中的 value 值

```html
<ul id="v-for-object">
  <li v-for="value in objects">
    {{ value }}
  </li>
</ul>
```

除了对象中的 value 值之外, 还可以获取对象中的元素的索引值

```html
<ul id="v-for-object">
  <li v-for="(value,key) in objects">
    {{ key }}-{{ value }}
  </li>
</ul>
```

如果想再加上对象的 key 值, 也是可行的

```html
<div v-for="(value, key, index) in object">
  {{ index }}. {{ key }}: {{ value }}
</div>
```



```javascript
new Vue({
  el: '#v-for-object',
  data: {
    objects: {
      firstName: 'John',
      lastName: 'Doe',
      age: 30
    }
  }
})
```

案例: 

```html
<head>
    <script src="js/vue.js"></script>
</head>
<body>
    <div id="app">
        <ul>
            <li v-for="item in movieName">
                {{ item }}
            </li>
        </ul>

        <ul>
            <li v-for="(item,index) in movieName">
                {{ index+1 }}、{{ item }}
            </li>
        </ul>

        <ul>
            <li v-for="val in peron01">
                {{ val }}
            </li>
        </ul>

        <ul>
            <li v-for="(val,key) in peron01">
                {{ key }}:{{ val }}
            </li>
        </ul>

    </div>

    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                movieName:['古墓丽影3','唐人街探案2','芳华','环太平洋2','大话西游5'],
                peron01:{'name':'李思','age':18,'gender':'男'}
            }
        })
    </script>
</body>
```





### 总结:

* 通过这章的学习, 我们知道 vue 框架中给我们定义了一些标签的属性, 通过这些属性我们可以快速的构建项目的整体结构
* v-for 就和我们python中学习的一样, 通过 for .....  in.... 的形式将将 data 中的数据, 遍历加载到 DOM 元素中
* vue 框架也可以使用 v-for 遍历对象 例如:  使用 v-for 遍历对象, 将对象中的数据也可以遍历出来.





## 十四.  事件处理

#### 事件绑定方法

> 可以用 v-on 指令监听 DOM 事件，并在触发时运行一些 JavaScript 代码，事件的处理，简单的逻辑可以写在指令中，复杂的需要在vue对象的methods属性中指定处理函数。

```html
<div id="example-1">
  <!-- 在指令中写处理逻辑 -->
  <button v-on:click="counter += 1">Add 1</button>
  <p>The button above has been clicked {{ counter }} times.</p>
</div>


<script>
    var example1 = new Vue({
      el: '#example-1',
      data: {
        counter: 0
      }
    })
</script>
```

methods属性中指定处理函数：

```html
<div id="example-2">
  <!-- greet 是在下面定义的方法名 -->
  <button v-on:click="greet">Greet</button>
</div>


<script>
    var example2 = new Vue({
      el: '#example-2',
      data: {
        name: 'Vue.js'
      },
      // 在 `methods` 对象中定义方法
      methods: {
        greet: function () {
          // `this` 在方法里指向当前 Vue 实例
          alert('Hello ' + this.name + '!')
        }
      }
    })
</script>
```

#### 事件修饰符

实际开发中，事件绑定有时候牵涉到阻止事件冒泡以及阻止默认行为，在vue.js可以加上事件修饰符

```
<!-- 阻止单击事件继续传播 -->
<a v-on:click.stop="func"></a>

<!-- 提交事件不再重载页面 -->
<form v-on:submit.prevent="onSubmit"></form>

<!-- 修饰符可以串联 -->
<a v-on:click.stop.prevent="doThat"></a>

<!-- 只有修饰符 -->
<form v-on:submit.stop.prevent></form>
```

案例: 

```html
<head>
    <style>
        .con{
            width:200px;
            height:200px;
            background:orange;
        }
        .box{
            width:100px;
            height:100px;
            background:gold;
        }
    </style>
    <script src="js/vue.js"></script>
</head>
<body>
    <div id="app">
        <!-- 通过方法来操作要做的事情 -->
        <div class="con" @click="fnAdd">

            <!-- 直接在等号内写要做到事情 -->
            <!-- .stop 可以阻止click事件往上冒泡 -->
            <div class="box" @click.stop="iNum+=1">{{ iNum }}</div>
        </div>
    </div>

    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                iNum:0
            },
            methods:{
                fnAdd:function(){
                    this.iNum +=1;
                }
            }
        })    
    </script>
</body>
```



#### 弹框 ---- 课堂实例

![QQ截图20180530201505](新建文件夹/QQ截图20180530201505.png)

> 阻止事件冒泡的弹框

```html
<head>
    <script src="js/vue.js"></script>   
</head>
<body>
<div id="app"  @click="isShow=false">
    <input type="button" value="弹出弹框" id="btn01" @click.stop="isShow=true">
    <div class="pop_main" id="pop" v-show="isShow">
        <!-- 弹框本身制作阻止冒泡的操作 -->
        <div class="pop_con" @click.stop>
            <div class="pop_title">
                <h3>系统提示</h3>
                <a href="#" id="shutoff" @click="isShow=false">×</a>
            </div>
            <div class="pop_detail">
                <p class="pop_text">亲！请关注近期的优惠活动！</p>
            </div>
            <div class="pop_footer">                              
            </div>
        </div>
        <div class="mask"></div>
    </div>
</div>
    
<script>
    var vm = new Vue({
        el:'#app',
        data:{
            isShow:false
        }
    })
</script>
</body>
```

### 总结: 

* vue 框架中绑定事件使用的是 v-on:   我们也可以使用简写的形式: @ 来表示

* 因为我们知道 Dom树 有一些默认行为和默认事件, 但是在某些情况下我们不希望有这些, 所以我们可以使用 @click.stop  或者 @click.prevent  设置两者的联合 @click.stop.prevent 等来阻止这些行为和事件. 这个比较关键, 希望大家都能够好好把握.

  



## 十五. 表单输入绑定

> 可以用 v-model 指令在表单` <input>` 及 `<textarea> `元素上创建双向数据绑定。它会根据控件类型自动选取正确的方法来更新元素

#### 单行文本框

```html
<input v-model="message" placeholder="edit me">
<p>Message is: {{ message }}</p>
```

#### 多行文本框

```html
<span>Multiline message is:</span>
<p>{{ message }}</p>
<textarea v-model="message" placeholder="add multiple lines"></textarea>
```

#### 复选框

单个复选框，绑定到布尔值：

```html
<input type="checkbox" id="checkbox" v-model="checked">
<label for="checkbox">{{ checked }}</label>
```

多个复选框，绑定到同一个数组：

```html
<div id='example-3'>
  <input type="checkbox" id="jack" value="Jack" v-model="checkedNames">
  <label for="jack">Jack</label>
  <input type="checkbox" id="john" value="John" v-model="checkedNames">
  <label for="john">John</label>
  <input type="checkbox" id="mike" value="Mike" v-model="checkedNames">
  <label for="mike">Mike</label>
  <br>
  <span>Checked names: {{ checkedNames }}</span>
</div>


<script>
    new Vue({
      el: '#example-3',
      data: {
        checkedNames: []
      }
    })
</script>
```

#### 单选框

```html
<div id="example-4">
  <input type="radio" id="one" value="One" v-model="picked">
  <label for="one">One</label>
  <br>
  <input type="radio" id="two" value="Two" v-model="picked">
  <label for="two">Two</label>
  <br>
  <span>Picked: {{ picked }}</span>
</div>

<script>
    new Vue({
      el: '#example-4',
      data: {
        picked: ''
      }
    })
</script>
```

#### 下拉框

```html
<div id="example-5">
  <select v-model="selected">
    <option disabled value="">请选择</option>
    <option>A</option>
    <option>B</option>
    <option>C</option>
  </select>
  <span>Selected: {{ selected }}</span>
</div>

<script>
    new Vue({
      el: '...',
      data: {
        selected:''
      }
    })
</script>
```

案例:

```html
<head>
    <script src="js/vue.js"></script>
</head>
<body>
    <div id="app">
        <!-- input 用v-model绑定vue对象里面的一个数据，可以实现双向数据绑定 -->
        <input type="text" v-model="txt01">
        <div>{{ txt01 }}</div>
        <input type="button" value="改变值" @click="txt01=100">
        
        <select v-model="sel01">
            <option value="0">北京</option>
            <option value="1">上海</option>
            <option value="2">广州</option>
            <option value="3">深圳</option>
        </select>
        <div>{{ sel01 }}</div>
    </div>
    <script>
        var vm = new Vue({
            el:'#app',
            data:{
               txt01:'',
               sel01:0 
            }
        })
    </script>
</body>
```



#### 聊天对话框 ---- 课堂实例

> 聊天对话框 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style type="text/css">
        .talk_con{
            width:600px;
            height:500px;
            border:1px solid #666;
            margin:50px auto 0;
            background:#f9f9f9;
        }
        .talk_show{
            width:580px;
            height:420px;
            border:1px solid #666;
            background:#fff;
            margin:10px auto 0;
            overflow:auto;
        }
        .talk_input{
            width:580px;
            margin:10px auto 0;
        }
        .whotalk{
            width:80px;
            height:30px;
            float:left;
            outline:none;
        }
        .talk_word{
            width:420px;
            height:26px;
            padding:0px;
            float:left;
            margin-left:10px;
            outline:none;
            text-indent:10px;
        }        
        .talk_sub{
            width:56px;
            height:30px;
            float:left;
            margin-left:10px;
        }
        .atalk{
           margin:10px; 
        }
        .atalk span{
            display:inline-block;
            background:#0181cc;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
        .btalk{
            margin:10px;
            text-align:right;
        }
        .btalk span{
            display:inline-block;
            background:#ef8201;
            border-radius:10px;
            color:#fff;
            padding:5px 10px;
        }
    </style>
    <script src="js/vue.js"></script>
    
</head>
<body>
    <div class="talk_con" id="app">
        <div class="talk_show" id="words">
            <div v-for="item in talks" v-bind:class="[(item.who=='A')?'atalk':'btalk']"><span>{{item.who}}说：{{item.word}}</span></div>
           
        </div>
        <div class="talk_input">
            <select class="whotalk" id="who" v-model="who">
                <option value="0">A说：</option>
                <option value="1">B说：</option>
            </select>
            <input type="text" class="talk_word" id="talkwords" v-model="talk">
            <input type="button" value="发送" class="talk_sub" id="talksub" @click="fnAddTalk">
        </div>
    </div>

    <script type="text/javascript">      
        var vm = new Vue({
            el:'#app',
            data:{
                talks:[
                    {who:'A',word:'吃饭了吗？'},
                    {who:'B',word:'还没呢，你呢？'},
                ],
                talk:'',
                who:0
            },
            methods:{
                fnAddTalk:function(){
                   if(this.talk=='')
                   {
                       alert('请输入内容！');
                       return;
                   }
                   // 将数据添加的数组中
                   this.talks.push({who:(this.who==0)?'A':'B',word:this.talk});
                   
                   // 清空输入框里面的内容
                   this.talk = '';
                }
            }
        })

    </script>
</body>
</html>
```

####总结:

* 这章我们重点介绍的就一个知识点:   v-model  指令
* 这个指令一般是和表单元素共同使用的, 通过该指令的使用, 可以双向绑定数据
* 整个 vue 框架中, 只有该指令能够达到双向绑定的目的, 其他的指令都是单项绑定的.





## 十六.  过滤器

> Vue.js 允许你自定义过滤器，可被用于一些常见的文本格式化。过滤器可以用在两个地方：双花括号插值和 v-bind 表达式

```html
<!-- 在双花括号中 -->
{{ prize | RMB }}

<!-- 在v-bind中 -->
<div v-bind:id="prize | Yuan"></div>
```

过滤器实际上是一个函数，可以在一个组件的选项中定义组件内部过滤器：

```
filters:{
  RMB:function(value){
    if(value=='')
    {
      return;
    }
    return '¥ '+value;
  }
}
```

或者在创建 Vue 实例之前全局定义过滤器：

```
Vue.filter('Yuan',function(value){
  if(value=='')
  {
    return;
  }
  return value+'元';
});
```

此时过滤器'RMB'只能在定义它的对象接管标签内使用，而'Yuan'可以全局使用

案例:

```html
<head>
    <script src="./vue.js"></script>
</head>
<body>
    <div id="app">
        {{ msg | upper() }}
        {{ title | lower() }}
       <div type="text" v-bind:id="flag | rever()">这是个div标签</div>
    </div>

    <script>
        Vue.filter('rever', function (value) {
            return value.split('').reverse().join('')
        })
        var vm = new Vue({
            el:'#app',
            data:{
                msg: 'abcdefg',
                title: 'ABDEEDJSOIFDOS',
                flag: 'hello world'
            },
            filters: {
                 upper :function(value){

                     return value.toUpperCase()
                 },
                 lower : function (value){
                     return value.toLowerCase()
                 }
            }
        })
    </script>
</body>
```

### 总结: 

* filter 是 vue 中的过滤器, 过滤器顾名思义就是把数据进行过滤, 得到过滤的数据的作用.
* 在 vue 中, 过滤器有两种写法, 一种是写在 vue 对象内部的过滤器, 另一种是写对象外部的过滤器
  * 其中写在内部的过滤器:   以  filters 开头, 且内部都是方法
  * 写在外部的过滤器, 以 filter 开头, 且过滤器名称和方法分开
* 过滤器在vue中也是一个非常重要的部分, 但是具体的使用还是需要结合公司的情况.
* 从 vue 2.x 开始, 过滤器推出了与 v-bind  结合使用的情况, 所以这个地方需要大家注意





## 十七.  自定义指令

> 指令是用来做dom操作的，如果vue现有的指令不能满足开发要求，我们需要对普通DOM元素进行底层操作，这时候就会用到自定义指令。

定义一个全局指令，让input框自动获取焦点

```html
Vue.directive('focus',{
  inserted:function(el){
    el.focus();
    el.style.background = 'gold';
  }     
})


<div id="app">    
  <input type="text" v-focus>
</div>
```

如果定义成 vue 对象局部的，可以用vue对象的directives属性：

```
directives: {
  focus: {
    inserted: function(el) {
      el.focus();
      el.style.background = 'gold';
    }
  }
}
```

案例:

```html
<head>
    <script src="./vue.js"></script>
</head>
<body>
    <div id="app">
        <input type="text" v-fodc>
        <div v-fodd> sss</div>
    </div>
    <script>
        Vue.directive('fodd',{
            inserted:function(el){
                el.style.width = '100px'
                el.style.height = '100px'
                el.style.border = '1px solid gold'
            }
        })
        var vm = new Vue({
            el:'#app',
            directives:{
                fodc:{
                    inserted:function(el){
                        el.focus()
                        el.style.background = 'gold'
                    }
                }
            }
        })

    </script>
</body>
```

### 总结: 

* 自定义指令指的就是我们自己制作自己想要的指令效果
* 每个插件都会给予用户一些自主权限, 让使用者自由发挥, 以满足公司不同的业务需要
* directive(自定义指令)  和上面的过滤器一样,也有两种, 分别为内部和外部,  这两个不同点就是名字和书写格式上, 希望下去后多多练习.



## 十八.  实例生命周期

> 每个Vue实例在被创建时都要经过一系列的初始化过程——例如，需要设置数据监听、编译模板、将实例挂载到DOM并在数据变化时更新 DOM 等。同时在这个过程中会自动运行一些叫做生命周期钩子的函数，我们可以使用这些函数，在实例的不同阶段加上我们需要的代码，实现特定的功能。

#### beforeCreate

在实例初始化之后，数据观测 (data observer) 和 event/watcher 事件配置之前被调用。

#### created

在实例创建完成后被立即调用。在这一步，实例已完成以下的配置：数据观测 (data observer)，属性和方法的运算，watch/event 事件回调。然而，挂载阶段还没开始

#### beforeMount

在挂载开始之前被调用：相关的 render 函数首次被调用。

#### mounted

实例挂载到dom之后被调用，可以当成是vue对象的ready方法来使用，一般用它来做dom的初始化操作。

#### beforeUpdate

数据发生变化前调用

#### updated

数据发生变化后调用

![lifecycle](新建文件夹/lifecycle.jpg)





## 十九.  数据交互

> vue.js没有集成 ajax 功能，要使用 ajax 功能，可以使用vue官方推荐的 axios.js 库来做ajax的交互。 axios库的下载地址：<https://github.com/axios/axios/releases>

#### axios完整写法：

```
axios({
  method: 'post',
  url: '/user/12345',
  data: {
    firstName: 'Fred',
    lastName: 'Flint2stone',
    start:0,
    count:10
  }
});
```

axios的请求也分为get请求和post请求。



#### 执行get请求

```javascript
// 为给定 ID 的 user 创建请求
// then是请求成功时的响应，catch是请求失败时的响应

axios.get('/user?ID=12345&start=0&count=10')
.then(function (response) {
  console.log(response);
})
.catch(function (error) {
  console.log(error);
});


// 可选地，上面的请求可以这样做
axios.get('/user', {
  params: {
    ID: 12345,
    start:0,
    count:10
  }
})
.then(function (response) {
  console.log(response);
})
.catch(function (error) {
  console.log(error);
});
```

#### 执行post请求

```javascript
axios.post('/user', {
  firstName: 'Fred',
  lastName: 'Flintstone'
})
.then(function (response) {
  console.log(response);
})
.catch(function (error) {
  console.log(error);
});
```
案例:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="./vue.js"></script>
    <script src="./axios.min.js"></script>
    <script>
        window.onload = function () {
            var vm = new Vue({
                el: '#app',
                methods: {
                    getFunc: function () {
                        axios.get(
                                'http://localhost:3008/getMovieListData?message={"movieType":"in_theaters","pageIndex":2,"start":0,"count":10}'
                            ).then(function (data) {
                                // document.write(data)
                                var div = document.getElementById('box')
                                // div.innerHTML = data
                                console.log(data.data.subjects)
                                div.innerHTML = data.data.subjects[0].title 
                            })
                            .catch(function (error) {
                                alert(error)
                            })
                    }
                }
            })
        }
    </script>
</head>

<body>
    <div id="app">
        <button @click="getFunc">按钮</button>
        <div id="box"></div>
    </div>
</body>
```

### 总结: 

* axios 不是vue作者写的框架, 而是 github 上面开源的第三方框架, vue作者自己写的框架是vue-resource.  但是因为不如axios好用, 所以最终作者推荐大家使用这个框架来获取数据.
* axios  只有get 和 post 方法, 不支持jsonp.  也就是说axios框架不能够跨域请求数据,希望大家注意这一点.
* 请求分为两种 get 和 post 





# 总结今日学习目标:

- 掌握vue列表渲染
- 掌握vue事件处理
- 掌握vue表单输入绑定
- 了解vue实例生命周期
- 了解vue数据交互

