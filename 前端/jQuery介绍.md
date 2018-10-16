# 学习目标:

* 掌握jquery文档的加载及执行的顺序
* 掌握jquery选择器对选择集进行过滤
* 掌握jquery选择器对选择集转移
* 掌握判断jquery选择器是否选择到了元素
* 掌握jquery样式操作
* 掌握绑定click事件的使用
* 熟悉jquery动画的使用



## 一. jquery介绍

> jQuery 是目前使用最广泛的 javascript 函数库。据统计，全世界排名前100万的网站，有46%使用 jQuery，远远超过其他库。微软公司甚至把 jQuery 作为他们的官方库。

jQuery的版本分为1.x系列和2.x、3.x系列，1.x系列兼容低版本的浏览器，2.x、3.x系列放弃支持低版本浏览器，目前使用最多的是1.x系列的。



###导入jquery

jquery是一个函数库，一个js文件，页面用 script 标签引入这个js文件就可以使用。

```
<script type="text/javascript" src="js/jquery-1.12.2.js"></script>
```

jquery的口号和愿望 Write Less, Do More（写得少，做得多）

1、<http://jquery.com/> 官方网站
2、<https://code.jquery.com/> 版本下载





## 二. 使用 jquery 加载代码

###  不适用 jquery

我们不适用 jquery 时导入文件的方式: 

```html
<head>
    <script>
        window.onload = function () {
            var oDiv = document.getElementById('app')
            oDiv.innerHTML = 'hello world'
        }
    </script>
</head>
<body>
    <div id="app"></div>
</body>
```



### 使用 jquery

> 将获取元素的语句写到页面头部，会因为元素还没有加载而出错，jquery提供了ready方法解决这个问题，它的速度比原生的 window.onload 更快。

```
使用格式:

$(document).ready(function(){
	...
})
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(document).ready(function(){
            var $div = $('#app')
            $div.html('hello world')
        })
    </script>
</head>
<body>
    <div id="app"></div>
</body>
```

可以简写为：

```
使用格式:

$(function(){
	...
})
```



```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#app')
            $div.html('hello world')
        })
    </script>
</head>
<body>
    <div id="app"></div>
</body>
```

### 总结: 

* 使用 **jquery** 能够简化我们书写的代码
* jquery 的 ready 调用方法比我们之前接触的 window.onload 方法调用的要早:  ready 是html加载完毕之后就调用, onload是在资源文件也加载完毕之后才调用.
* jquery 的 ready 有简略写法, 我们往往使用它的简略写法.

****



## 三. jquery选择器

###**jquery使用思想** 

先, 选择某个网页元素，然后, 对它进行某种操作



###jquery选择器 

> jquery 选择器可以快速地选择元素，选择规则和 css 样式相同，使用 length 属性判断是否选择成功。

```
$('#myId') 			 	 // 选择id为myId的网页元素
$('.myClass') 		 	 // 选择class为myClass的元素
$('li') 				// 选择所有的li元素
$('#ul1 li span')   	 // 选择id为为ul1元素下的所有li下的span元素
$('input[name="first"]')   // 选择name属性等于first的input元素
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#app')
            $div.html('hello!!')
            
            var $div1 = $('.box')
            $div1.html('box登场')
            
            var $div2 = $('#divbox')
            $div2.html('会不会把p标签给替换掉?')
            
            var $span = $('ul li p span')
            $span.html('强调强调强调')
            
            var $a = $('a[href="www"]')
            $a.html('a标签修改的文字')
        })
    </script>
</head>
<body>
    <div id="app">nihao</div>
    <div class="box"></div>
    <div id="divbox">
        <p>哈哈,这里是p标签的主场</p>
    </div>
    <a href="com">这是第一个a标签</a>
    <a href="www">这是第二个a标签</a>
    <ul>
        <li>
            <p>这里是p标签内部,添加了<span>强调的字体</span></p>
        </li>
    </ul>
</body>
```



###对选择集进行过滤

> 我们可以剔除一些不需要的,保留需要的元素

```
$('div').has('p'); 			// 选择包含p元素的div元素
$('div').not('.myClass');	// 选择class不等于myClass的div元素
$('div').eq(5); 		    //	 选择第6个div元素  equal:相等
```

例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('div').has('p')
            $div.html('哈哈,选中的')
            var $p = $('p').not('.pbox')
            $p.html('更改的是p标签里面的东西')
            var $li = $('li').eq(2)
            $li.html('hahhaa')
        })
    </script>
</head>
<body>
    <div>
        <p>div中的p标签</p>
    </div>
    <div>哈哈哈哈哈</div>
    <p class="pbox">含有pbox的p标签</p>
    <p>纯粹的p标签</p>
    <ul>
        <li>11</li>
        <li>22</li>
        <li>33</li>
        <li>44</li>
    </ul>
</body>
```

效果: 

![QQ截图20180528094239](images/QQ截图20180528094239.png)



###选择集转移

```
$('#box').prev();  			//	选择id是box的元素前面紧挨的同辈元素
$('#box').prevAll(); 		//	选择id是box的元素之前所有的同辈元素
$('#box').next(); 			//	选择id是box的元素后面紧挨的同辈元素
$('#box').nextAll(); 	 	//	选择id是box的元素后面所有的同辈元素
$('#box').parent(); 		//	选择id是box的元素的父元素
$('#box').children(); 		//	选择id是box的元素的所有子元素
$('#box').siblings(); 		//	选择id是box的元素的同级元素
$('#box').find('.myClass'); //	选择id是box的元素内的class等于myClass的元素
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('.box')
            $div1.html('哈哈')  

            var $div2 = $('.box').prev()
            $div2.html('嘿嘿')

            var $div3 = $('.box').next()
            $div3.html('呵呵')

            var $div4 = $('.box').parent()
            $div4.append('哇哇')
        })
    </script>
</head>
<body>
    <div>
        <div>第一个div标签</div>
        <div>第二个div标签</div>
        <div class="box">
            <p>div.box中的p标签</p>
        </div>
        <div>下面倒数第二个div标签</div>
        <div>下面倒数第一个div标签</div> 
    </div>
</body>
```

结果:

![QQ截图20180528100334](images/QQ截图20180528100334.png)

再例如:

```html
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div5 = $('.box').siblings()
            $div5.html('good')

            var $div6 = $('.box').find('.pbox')
            $div6.html('呜啊呜啊')
        })
    </script>
</head>
<body>
    <div>
        <div>第一个div标签</div>
        <div>第二个div标签</div>
        <div class="box">
            <p class="pbox">div.box中添加有class的p标签</p>
            <p>div.box中没有添加class的p标签</p>
        </div>
        <div>下面倒数第二个div标签</div>
        <div>下面倒数第一个div标签</div> 
    </div>
</body>
```

结果:

![QQ截图20180528101009](images/QQ截图20180528101009.png)





**判断是否选择到了元素** 

> jquery 有容错机制，即使没有找到元素，也不会出错，可以用 length 属性来判断是否找到了元素, length 等于0，就是没选择到元素，length 大于0，就是选择到了元素。

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div1 = $('#div1')
            var $div2 = $('#div2')

            // 找到了,   length大于0
            console.log( $div1.length ) 
            // 没有找到, length等于0
            console.log( $div2.length )
        })
    </script>
</head>
<body>
    <div id="div1"></div>
</body>
```

结果:

```
1 
0
```



### 总结:

* 通过使用 jquery 的选择器, 我们会发现选中元素变得更加简单

* 通过这章,我们对标识符有了更深入的了解,  js 中的标识符是可以包含 $ 的, 并且可以以它开头

* 我们可以直接通过某些属性选中需要的元素, 也可以间接通过别的元素选中, 这样的选中方式就是我们说的**选择集转移**

* 选择集过滤, 是为了剔除有相同属性的元素, 这样的技能需要掌握, 公司标签多的时候,会使用到.

  



## 四. jquery样式操作

###jquery用法思想

使用同一个函数完成读取和赋值



###操作样式

```
使用方法: 

// 获取div的样式
$("div").css("width");
$("div").css("color");

// 设置div的样式
$("div").css("width","30px");
$("div").css("height","30px");
// 可以使用引号引起来,也可以不使用,但是不使用时必须写成小驼峰命名的形式:  例如:
$("div").css({'font-size':"30px",'color':'red'})
$("div").css({fontSize:"30px",color:"red"});
```

例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('div')
            $div.css('width','200px')
            $div.css('height','200px')
            // 需要注意: 多个属性同时设置,需要使用 {} 包裹
            $div.css({'background-color':'pink','color':'red'})
            $div.css({fontWeight:'bold',fontSize:'30px'})
            
            var width = $div.css('width')
            var height = $div.css('height')
            console.log(width)
            console.log(height)
        })
    </script>
</head>
<body>
    <div>这里有个div</div>
</body>
```

效果: 

![QQ截图20180528104516](images/QQ截图20180528104516.png)

```
200px
200px
```



**特别注意**

> 如果使用选择器获取了多个元素，那么, 获取的信息是第一个元素的，比如：$("li").css("width")，获取的是第一个 li 的 width。





### 操作额外样式

```
使用方法: 

$("#div1").addClass("divClass2") 				//	给id为div1的对象追加样式divClass2
$("#div1").removeClass("divClass")  			//	移除div1的divClass的样式类名
$("#div1").removeClass("divClass divClass2") 	 //	 移除多个样式
$("#div1").toggleClass("anotherClass") 			//	重复切换anotherClass样式
```

例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#div1')
            $div.addClass('divClass2')
            // $div[0] 可以将jquery对象变为元素对象
            console.log($div[0])
        })
    </script>
</head>
<body>
    <div id="div1" class="divClass">hahha</div>
</body>
```

效果: 

```
<div id="div1" class="divClass divClass2">hahha</div>
```



再例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#div1')
            $div.removeClass('divClass')
            console.log($div[0])
        })
    </script>
</head>
<body>
    <div id="div1" class="divClass">hahha</div>
</body>
```

结果: 

```
<div id="div1" class="">hahha</div>
```



或者例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#div1')
            $div.addClass('divClass2')
            $div.removeClass('divClass divClass2')
            console.log($div[0])
        })
    </script>
</head>
<body>
    <div id="div1" class="divClass">hahha</div>
</body>
```

结果:

```
<div id="div1" class="">hahha</div>
```



下一个例如:

```html
<head>
    <script src="./jquery-1.12.4.min.js">
    </script>
    <style type="text/css">
        .c1 {
            color: red;
        }
    </style>
</head>

<body>
    <div id="div" class="c1">hello world</div>
    <button id="button"> click me</button>
    
    
    <script type="text/javascript">
        $('#button').click(function(){
            // 点击一个添加当前c1样式,再点击一次取消当前c1样式
            $("#div").toggleClass('c1');
        })
	</script>
</body>
```

效果: 

![QQ截图20180528113307](images/QQ截图20180528113307.png)



![QQ截图20180528113314](images/QQ截图20180528113314.png)

### 总结: 

* 使用 jquery 获取当前的标签, 得到标签之后,如果要对标签进行CSS样式的修改,直接调用 .css( ) 方法即可.

* .css( ) 方法, 可以当做 读取css样式值 来使用, 也可以当做 设置css样式值来使用

* 额外操作样式的方法就三个:  addClass( )    removeClass( )    toggleClass( )

  ​

### 



## 五. 绑定事件

> 给元素绑定click事件，可以用如下方法：



### 添加绑定事件

```
使用方法:


$('#btn1').click(function(){

    // 内部的this指的是原生对象
    // 使用jquery对象用 $(this)

})
```

例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('.box')
            $div.click(function(){
                console.log('haha')

                console.log($(this))

                console.log(this)
            })
        })
    </script>
</head>
<body>
    <div class="box">哈哈</div>
</body>
```

点击之后的结果: 

![QQ截图20180528114507](images/QQ截图20180528114507.png)









###获取元素的索引值

> 有时候需要获得匹配元素相对于其同胞元素的索引位置，此时可以用index()方法获取

```
使用方法:

var $li = $('.list li').eq(1);

alert( $li.index() ); // 弹出1


<ul class="list">
    <li>1</li>
    <li>2</li>
    <li>4</li>
    <li>5</li>
    <li>6</li>
</ul>
```

例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function () {
            var $li = $('li')
            $li.click(function(){
                console.log( $(this).index() )
            })
        })
    </script>
</head>
<body>
    <ul>
        <li>11</li>
        <li>22</li>
        <li>33</li>
    </ul>
</body>
```

运行结果: 

![QQ截图20180528115712](images/QQ截图20180528115712.png)

###课堂练习

> 选项卡的制作

![QQ截图20180528115919](images/QQ截图20180528115919.png)

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $btn = $('input')
            var $div = $('.tab_cons div')
            // console.log($btn)
            $btn.click(function(){
                var index = $(this).index()
                // console.log($btn[index])
                // 给当前点击元素添加样式
                $($btn[index]).addClass('active')
                // 给其他元素去除样式
                $($btn[index]).siblings().removeClass('active')                

                // 给当前点击元素添加样式
                $($div[index]).addClass('current')
                // 给其他元素去除样式
                $($div[index]).siblings().removeClass('current')
            })
        })
    </script>
</head>

<body>
    <div class="tab_con">
        <div class="tab_btns">
            <input type="button" value="按钮一" class="active">
            <input type="button" value="按钮二">
            <input type="button" value="按钮三">
        </div>
        <div class="tab_cons">
            <div class="current">按钮一对应的内容</div>
            <div>按钮二对应的内容</div>
            <div>按钮三对应的内容</div>
        </div>
    </div>
</body>
```



或者可以写成这样: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $btn = $('input')
            var $div = $('.tab_cons div')
            $btn.click(function(){
                // 当前元素添加, 其他元素去除
			   $(this).addClass('active').siblings().removeClass('active')
                
                $div.eq( $(this).index() ).addClass('current').siblings().removeClass('current')
            })
        })
    </script>
</head>

<body>
    <div class="tab_con">
        <div class="tab_btns">
            <input type="button" value="按钮一" class="active">
            <input type="button" value="按钮二">
            <input type="button" value="按钮三">
        </div>
        <div class="tab_cons">
            <div class="current">按钮一对应的内容</div>
            <div>按钮二对应的内容</div>
            <div>按钮三对应的内容</div>
        </div>
    </div>
</body>
```

### 总结:

* 我们想要给当前元素添加事件, 只需要选中当前元素, 这里调用 click 即可, 和原生 js 不同的是: 不用'on'开头
* 在点击事件之中,$(this) 就代表当前选中元素(jquery对象),  想要获取当前元素的索引值,可以使用 index( )方法
* 如果当前元素是一个dom对象, 变成 jquery 对象的方法是外边加`$`符号:  $(dom元素)
* 调用 jquery对象的下标,获取的是 dom元素对象:  $div[0]  ===>  dom元素对象





## 六.  jquery动画

> 通过 animate 方法可以设置元素21某属性值上的动画，可以设置一个或多个属性值，动画执行完成后会执行一个函数。

```
使用方法:


/*
    animate参数：
    参数一：要改变的样式属性值，写成字典的形式
    参数二：动画持续的时间，单位为毫秒，一般不写单位
    参数三：动画曲线，默认为‘swing’，缓冲运动，还可以设置为‘linear’，匀速运动
    参数四：动画回调函数，动画完成后执行的匿名函数
*/

$('#div1').animate({
	要改变的属性值
},动画持续时间,动画的效果,function(){
    动画执行完成之后调用的代码
});
```
例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: pink;
        }
    </style>
    <script>
        $(function(){
            $('.btn').click(function(){
                $('.box').animate({
                    'width':'200px'
                },1000,'swing',function () {
                    $('.box').animate({
                        'height':'200px'
                    },1000,'swing',function(){

                    })
                })   
       
            })
        })
    </script>
</head>
<body>
    <div class="box"></div>
    <button class="btn">按钮</button>
</body>
```

最终效果: 

![QQ截图20180528141302](images/QQ截图20180528141302.png)

![QQ截图20180528141314](images/QQ截图20180528141314.png)

### 总结:

* 我们使用 animate( ) 方法来设置动画
* 动画内部有四个参数:  要更改的元素属性,  动画时长( 以毫秒计 ),    动画曲线,   动画完成之后所做操作
* 我们可以使用这样的方式来做一些简单动画.



# 学习目标总结:

- 掌握jquery文档的加载及执行的顺序
- 掌握jquery选择器对选择集进行过滤
- 掌握jquery选择器对选择集转移
- 掌握判断jquery选择器是否选择到了元素
- 掌握jquery样式操作
- 掌握绑定click事件的使用
- 熟悉jquery动画的使用





# 学习目标:

* 熟悉jquery特殊效果的使用
* 掌握jquery的链式调用
* 能完成层级菜单的练习
* 掌握jquery的html()、prop等属性的操作
* 能完成聊天效果的练习
* 熟练的使用jquery的blur()、focus()、mouseover()、hover()、ready()等事件



## 七.  jquery特殊效果

```
fadeIn() 			淡入  opacity
fadeOut() 			淡出
fadeToggle()		切换淡入淡出
hide() 				隐藏元素  dispay:none
show() 				显示元素
toggle() 			切换元素的可见状态
slideDown() 		向下展开  height
slideUp() 			向上卷起
slideToggle() 		依次展开或卷起某个元素

使用方式: 

$('div').fadeIn()
```

例如: 

```html
<head>
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: pink;
            display:none;
        }
    </style>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            $('.btn').click(function(){
                $('.box').fadeIn()
            })
        })
    </script>
</head>
<body>
    <button class="btn">按钮</button>
    <div class="box"></div>
</body>
```

显示效果: 

`fadeIn()效果:`

![11](images/11.gif)



`fadeOut( )效果:`

![12](images/12.gif)

`fadeToggle( )效果: `

![13](images/13.gif)
`hide()效果:`

![14](images/14.gif)

`show()效果:`

![15](images/15.gif)

`toggle()效果:`

![16](images/16.gif)

`slideDown()效果:`

![17](images/17.gif)

`slideUp()效果:`

![18](images/18.gif)

`slideToggle()效果:`

![19](images/19.gif)



### 总结: 

* jquery 帮助我们封装了一些特殊的动画效果, 我们可以直接调用这些动画效果来实现一部分常见的操作
* 这些动画效果的使用方式都是一样的:  1. 找到当前标签      2. 调用标签的对应动画效果
* 使用格式: `$(获取元素).动画效果()`
  



## 八. jquery链式调用

>  jquery 对象的方法会在执行完后返回这个 jquery 对象，所有 jquery 对象的方法可以连起来写：

```
$('#div1') 				 //  id为div1的元素
.children('ul') 		 //	该元素下面的ul子元素
.slideDown() 		     //	高度从零变到实际高度来显示ul元素
.parent()  				//	跳到ul的父元素，也就是id为div1的元素
.siblings()  			//	跳到div1元素平级的所有兄弟元素
.children('ul') 		//	这些兄弟元素中的ul子元素
.slideUp(); 		    //	高度实际高度变换到零来隐藏ul元素
```

层级菜单 ---- 课堂练习

![QQ截图20180604222010](images/QQ截图20180604222010.png)

层级菜单

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>层级菜单</title>	
	<style type="text/css">
		body{
			font-family:'Microsoft Yahei';
		}
		body,ul{
			margin:0px;
			padding:0px;
		}
		
		ul{list-style:none;}


		.menu{
			width:200px;
			margin:20px auto 0;
		}

		.menu .level1,.menu li ul a{
			display:block;
			width:200px;
			height:30px;
			line-height:30px;
			text-decoration:none;
			background-color:#3366cc;
			color:#fff;
			font-size:16px;
			text-indent:10px;			
		}

		.menu .level1{
			border-bottom:1px solid #afc6f6;
			
		}

		.menu li ul a{
			font-size:14px;
			text-indent:20px;
			background-color:#7aa1ef;
					
		}

		.menu li ul li{
			border-bottom:1px solid #afc6f6;
		}

		

		.menu li ul{
			display:none;
		}

		.menu li ul.current{
			display:block;
		}

		.menu li ul li a:hover{
			background-color:#f6b544;
		}


	</style>
	
	<script src="./jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var $a = $('.level1')
			$a.click(function(){
				$(this).next().stop().slideToggle().parent().siblings().children('ul').slideUp()
			})
		})
	</script>
</head>
<body>
	<ul class="menu">
		<li>
			<a href="#" class="level1">手机</a>
			<ul class="current">
				<li><a href="#">iPhone X 256G</a></li>
				<li><a href="#">红米4A 全网通</a></li>
				<li><a href="#">HUAWEI Mate10</a></li>
				<li><a href="#">vivo X20A 4GB</a></li>
			</ul>
		</li>
		<li>
			<a href="#" class="level1">笔记本</a>
			<ul>
				<li><a href="#">MacBook Pro</a></li>
				<li><a href="#">ThinkPad</a></li>
				<li><a href="#">外星人(Alienware)</a></li>
				<li><a href="#">惠普(HP)薄锐ENVY</a></li>
			</ul>
		</li>
		<li>
			<a href="#" class="level1">电视</a>
			<ul>
				<li><a href="#">海信(hisense)</a></li>
				<li><a href="#">长虹(CHANGHONG)</a></li>
				<li><a href="#">TCL彩电L65E5800A</a></li>				
			</ul>
		</li>
		<li>
			<a href="#" class="level1">鞋子</a>
			<ul>
				<li><a href="#">新百伦</a></li>
				<li><a href="#">adidas</a></li>
				<li><a href="#">特步</a></li>
				<li><a href="#">安踏</a></li>
			</ul>
		</li>
		<li>
			<a href="#" class="level1">玩具</a>
			<ul>
				<li><a href="#">乐高</a></li>
				<li><a href="#">费雪</a></li>
				<li><a href="#">铭塔</a></li>
				<li><a href="#">贝恩斯</a></li>
			</ul>
		</li>
		
	</ul>
</body>
</html>
```





# 九.  jquery 属性操作

###html ( )

>  使用: html( ) 取出元素文本 或设置元素内容
>
> 作用类似于 innerHTML( )

```
使用方式: 

// 取出html内容
var $htm = $('#div1').html();

// 设置html内容
$('#div1').html('<span>添加文字</span>');
```



###val( ) 

> val( ) 方法返回或设置被选元素的值。
>
> 元素的值##是通过 value 属性设置的。该方法大多用于 input 元素。
>
> 如果该方法未设置参数，则返回被选元素的当前值。

```
使用方式:

// 取出html内容
var val = $("input").val();

// 设置html内容
$("input").val("Hello World");
```

 

###prop( ) / attr( )  

> attributes : 属性

> 取出或设置某个属性的值
>
> 这里的属性是指标签除 css 样式以外的其他属性

```
使用方式:


// 取出图片的地址
var $src = $('#img1').prop('src');

// 设置图片的地址和alt属性
$('#img1').prop({src: "test.jpg", alt: "Test Image" });
```

```html
<head>
    <script src="js/jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $div = $('#div1');
            var $a = $('#link01');
            
            // 读取元素包裹的内容
            var sTr = $div.html();            
            // alert(sTr);

            // 写入或者叫设置元素包裹的内容
            $div.html('改变的文字');

            $div.html('<a href="http://www.baidu.com">百度网</a>')
            $div.html('<ul><li>列表文字</li><li>列表文字</li><li>列表文字</li></ul>');

            // 操作元素标签内除样式之外的其他的属性
            // 读取属性值：
            alert( $a.prop('id') );

            // 写入或者叫设置属性值
            $a.prop({'href':'http://www.itcast.cn','title':'这是去到传智播客的网站的链接'});
            $a.html('传智播客');
        })
    </script>
</head>
<body>
    <div class="box" id="div1">这是一个div</div>
    <a href="#" id="link01">这是一个链接</a>
</body>
```





###聊天 ---- 课堂练习 

聊天效果

![Snipaste_2018-05-29_16-27-47](images/Snipaste_2018-05-29_16-27-47.png)

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
    <script src="./jquery-1.12.4.min.js"></script>
    <script type="text/javascript">      
         $(function(){
            var $words = $('#words');
            var $who = $('#who');
            var $talk = $('#talkwords');
            var $btn = $('#talksub');

            $btn.click(function(){
                // 读取value属性值
                // var sVal = $talk.prop('value');

                // 操作元素的value属性封装成了 val() 方法
                var sVal = $talk.val();
                
                // 清空输入框里面的内容
                // $talk.prop({'value':''});
                $talk.val('');

               
                // 判断输入框是否为空
                if(sVal=='')
                {
                    alert('请输入内容！');
                    return;
                }
                
 			   var sVal02 = $who.prop('value');
                var sTr = '';
                if(sVal02==0)
                {
                    sTr = '<div class="atalk"><span>A说：'+ sVal +'</span></div>';
                }
                else{
                    sTr = '<div class="btalk"><span>B说：'+ sVal +'</span></div>';
                }
                $words.html( $words.html() + sTr);
            })
        })  
    </script>
</head>
<body>
    <div class="talk_con">
        <div class="talk_show" id="words">
            <div class="atalk"><span>A说：吃饭了吗？</span></div>
            <div class="btalk"><span>B说：还没呢，你呢？</span></div>
        </div>
        <div class="talk_input">
            <select class="whotalk" id="who">
                <option value="0">A说：</option>
                <option value="1">B说：</option>
            </select>
            <input type="text" class="talk_word" id="talkwords">
            <input type="button" value="发送" class="talk_sub" id="talksub">
        </div>
    </div>
</body>
</html>
```









## 十.  jquery循环( 去掉,不讲,可以自己自学一下,就是遍历 )

### each(  )

>  对 jquery 选择的对象集合分别进行操作，需要用到 jquery 循环操作，此时可以用对象上的each方法：

```
使用方式: 


$(selector).each( function(){} )
```

例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $li = $('li')
            // 使用for循环写法: 
            // var length = $li.length
            // for(var i = 0;i < length; i++){
            //     $li.eq(i).css({'background-color':'red'})
            // }
            $li.each(function(){
                $(this).css({'background-color':'pink'})
            })
            $li.click(function(){
                $(this).css({'background-color':'pink'})
            })
        })
    </script>
</head>
<body>
    <ul>
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
        <li>5</li>
        <li>6</li>
        <li>7</li>
    </ul>
</body>
```







## 十一.  jquery事件

###事件函数列表：

> 比原生 js  省略了 'on'
>
> 这里涉及到一些事件冒泡的内容, 主要原理:
>
> 我们点击子元素的时候,子元素会将事件传递到父元素去,进而触发父元素的事件.

```
blur() 				元素失去焦点
focus() 			元素获得焦点
click() 			鼠标单击
mouseover() 		鼠标进入（进入子元素也触发）
mouseout() 			鼠标离开（离开子元素也触发）
mouseenter() 		鼠标进入（进入子元素不触发）
mouseleave() 		鼠标离开（离开子元素不触发）
hover() 			同时为mouseenter和mouseleave事件指定处理函数
ready() 			DOM加载完成
submit() 			用户递交表单
```

例如: 

```html
<head>
    <style>
        .box {
            width: 200px;
            height: 200px;
            background-color: pink;
        }
        .son {
            width: 100px;
            height: 100px;
            background-color: red;
        }
    </style>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $input = $('#input1')
            // 默认,一上来就选中
            $input.focus()
            // 取消焦点时调用的方法
            $input.blur(function(){
                // alert('haha')
            })

            var $div1 = $('.box')
            // mouseover和mouseout的使用
            // $div1.mouseover(function(){
            //     $div1.stop().animate({'margin-top':'60px'})
            // })
            // $div1.mouseout(function(){
            //     $div1.stop().animate({'margin-top':'0px'})
            // })

            // mouseenter和mouseleave的使用
            // $div1.mouseenter(function(){
            //     $div1.animate({'margin-top':'100px'})
            // })
            // $div1.mouseleave(function(){
            //     $div1.animate({'margin-top':'0px'})
            // })

            // hover的使用
            $div1.hover(function(){
                $div1.animate({'margin-top':'100px'})
            },function(){
                $div1.animate({'margin':'0px'})
            })
        })
    </script>
</head>
<body>
    <input type="text" id="input1">
    <div class="box">
        <div class="son"></div>
    </div>
</body>
```



再例如: 

```html
<head>
    <script src="./jquery-1.12.4.min.js"></script>
    <script>
        $(function(){
            var $form = $('#form1')
            var $user = $('#name')
            $form.submit(function(){
                alert($user.val())
                // 阻止提交事件
                return false
            })
        })
    </script>
</head>
<body>
    <form action="" id="form1">
        <p>
            <label for="name">姓名:</label>
            <input type="text" id="name"> 
        </p>
       
        <p>
            <label for="pswd">密码:</label>
            <input type="password" id="pswd">
        </p>
      
        <input type="submit">
    </form>
</body>
```









## 十二.  表单验证

###正则表达式 

> 能让计算机读懂的字符串匹配规则。



###正则表达式的写法

```
使用方法: 


// 定义一个正则表达式(两种方法)
var re = new RegExp('规则', '可选参数');
var re = /规则/参数;


// 测试正则表达式: 
var result = re.test(要测试的字符串)
// result  --->  true  
// result  --->  false 
```



###规则中的字符

####普通字符匹配

```
规则使用方式:

/a/                  匹配字符 ‘a’  
/a,b/ 				匹配字符 ‘a,b’
```





####转义字符匹配

```
规则使用方式: 



\d 		匹配一个数字，即0-9
\D 		匹配一个非数字，即除了0-9
\w 		匹配一个单词字符（字母、数字、下划线）
\W 		匹配任何非单词字符。单词字符包括：a-z、A-Z、0-9，以及下划线。
\s 		匹配一个空白符
\S 		匹配一个非空白符
. 		匹配一个任意字符
```

例如: 

```javascript
var sTr01 = '123456asdf';
var re01 = /\d+/;
//匹配纯数字字符串
var re02 = /^\d+$/;
alert(re01.test(sTr01)); //弹出true
alert(re02.test(sTr01)); //弹出false
```



###量词 

####对左边的匹配字符定义个数

```
规则使用方式: 


? 			出现零次或一次（最多出现一次）
+ 			出现一次或多次（至少出现一次）
* 			出现零次或多次（任意次）
{n} 		出现n次
{n,m} 		出现n到m次
{n,} 		至少出现n次
```





###任意一个或者范围

```
[abc123] : 	匹配‘abc123’中的任意一个字符

[a-z0-9] : 	匹配a到z或者0到9中的任意一个字符
```



###限制开头结尾 

```
^ 		以紧挨的元素开头

$ 		以紧挨的元素结尾
```



###修饰参数

```
g： 		global: 全文搜索，默认搜索到第一个结果接停止

i： 		ingore case: 忽略大小写，默认大小写敏感
```



###常用函数  test##

```
使用方法: 

正则.test(字符串) 

// 匹配成功，就返回真，否则就返回假
```



###正则默认规则 

匹配成功就结束，不会继续匹配，区分大小写

####常用正则规则

```javascript
// 用户名验证：(数字字母或下划线6到20位)
var reUser = /^\w{6,20}$/;

// 邮箱验证：        
var reMail = /^[a-z0-9][\w\.\-]*@[a-z0-9\-]+(\.[a-z]{2,5}){1,2}$/i;

// 密码验证：
var rePass = /^[\w!@#$%^&*]{6,20}$/;

// 手机号码验证：
var rePhone = /^1[345678]\d{9}$/;
```

例如: 

```html
<script src="./jquery-1.12.4.min.js"></script>
<script>
    // var str = 'helloA world'
    // var reg = /a/i

    var str = 'a123ab'
    var reg = /^\d/

    var result = reg.test(str)
    alert(result)
</script>
```



###注册页面表单验证 --- 课堂实例

注册页面表单验证

![QQ截图20180530164522](images/QQ截图20180530164522.png)

```javascript
$(function(){
    alert('11111')
    // 定义一个变量
    // 记录用户输入的用户名是否有错
    // true   有错  false  没错
    var isNameHaveError = true

    // 获取用户名输入框
    var $input1 = $('#user_name')

    // 当用户输入完信息后调用这个方法进行验证.
    $input1.blur(function(){

        // 定义一个验证的方法
        checkUserNameFunc()

    }).click(function(){
        // 输入框点击之后调用这个方法
        // 用户点击输入框后,需要把验证的提示信息隐藏
        $(this).next().hide()
    })


    // 进行表单中用户名的验证方法
    function checkUserNameFunc(){
        // 获取用户输入的信息
        var value = $input1.val()
        // 定义正则表达式
        var reUser = /^\w{6,20}$/;
        // 判断信息是否为空
        if (value == '') {
            // 如果为空, 显示span, 展示提示信息
            $input1.next().html('用户名不能为空1111').show()
            isNameHaveError = false
            return
        }

        // 判断输入字符是否符合正则表达式的要求
        if (reUser.test(value)) {
            // 用户名格式没有出错
            isNameHaveError = false
        } else {
            isNameHaveError = true
             // 如果格式出错, 显示span, 展示提示信息
             $input1.next().html('用户名是6-20位数字,字母或下划线').show()
        }
    }
})
```



# 学习目标总结: 

- 熟悉jquery特殊效果的使用
- 掌握jquery的链式调用
- 能完成层级菜单的练习
- 掌握jquery的html()、prop等属性的操作
- 能完成聊天效果的练习
- 熟练的使用jquery的blur()、focus()、mouseover()、hover()、ready()等事件