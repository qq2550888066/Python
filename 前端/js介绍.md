# 学习目标:

* 简单的了解JavaScript
* 掌握JavaScript的嵌入页面的方式
* 熟悉变量、数据类型及基本 语法规范
* 掌握JavaScript的嵌入页面的方式
* 掌握JavaScript函数的定义与执行的顺序
* 掌握JavaScript函数的传参及return的作用
* 掌握条件语句得使用
* 熟悉多种获取元素的方法
* 掌握对元素属性的操作



#一  JavaScript 介绍

JavaScript 是运行在浏览器端的脚步语言，JavaScript 主要解决的是前端与用户交互的问题，包括使用交互与数据交互。 JavaScript是浏览器解释执行的，前端脚本语言还有JScript（微软，IE独有），ActionScript( Adobe公司，需要插件)等。

### 

**前端三大块** 
1、HTML：页面结构
2、CSS：页面表现：元素大小、颜色、位置、隐藏或显示、部分动画效果
3、JavaScript：页面行为：部分动画效果、页面与用户的交互、页面功能



## 1. HTML 引入 JavaScript 的方式

1、行间事件（主要用于事件）

```
<input type="button" name="" onclick="alert('ok！');">
```

2、页面script标签嵌

```
<script type="text/javascript">        
    alert('ok！');
</script>
```

3、外部引入

```
<script type="text/javascript" src="js/index.js"></script>
```



## 2. 变量、数据类型及基本语法规范

JavaScript 是一种弱类型语言，javascript的变量类型由它的值来决定。 定义变量需要用关键字 'var'

```
 var iNum = 123
 var sTr = 'asd'

 //同时定义多个变量可以用","隔开，公用一个‘var’关键字
 var iNum = 45, sTr='qwe', sCount='68';
```

**基本数据类型**

5种基本数据类型：
1、number 数字类型
2、string    字符串类型
3、boolean 布尔类型 true 或 false
4、undefined undefined类型，变量声明未初始化，它的值就是undefined
5、null      null类型，表示空对象，如果定义的变量将来准备保存对象，可以将变量初始化为null,在页面上获取不到对象，返回的值就是null

1种复合类型：  

object

**javascript语句与注释**

1、javascript语句开始可缩进也可不缩进，缩进是为了方便代码阅读，一条javascript语句应该以“;”结尾;

```
<script type="text/javascript">    
    var iNum = 123;
    var sTr = 'abc123';
    function fnAlert(){
        alert(sTr);
    };
    fnAlert();
</script>
```

2、javascript注释

```
<script type="text/javascript">    
    // 单行注释
    var iNum = 123;
    
    /*  
        多行注释
        1、...
        2、...
    */
    var sTr = 'abc123';
</script>
```

**变量、函数、属性、函数参数命名规范**

1、区分大小写
2、第一个字符必须是字母、下划线（_）或者美元符号（$）
3、其他字符可以是字母、下划线、美元符或数字

**匈牙利命名风格：**

对象o Object 比如：oDiv
数组a Array 比如：aItems
字符串s String 比如：sUserName
整数i Integer 比如：iItemCount
布尔值b Boolean 比如：bIsComplete
浮点数f Float 比如：fPrice
函数fn Function 比如：fnHandler
正则表达式re RegExp 比如：reEmailCheck



## 3.函数

> 函数就是重复执行的代码片段。

### 1. 函数定义与执行

```html
<script type="text/javascript">
    // 函数定义
    function fnAlert(){
	 alert('hello!');
    }
    // 函数执行
    fnAlert();
</script>
```



**变量 与 函数 预解析** 

JavaScript 解析过程分为两个阶段，先是编译阶段，然后执行阶段，在编译阶段会将function定义的函数提前，并且将var定义

的变量声明提前，将它赋值为 undefined。

```html
<script type="text/javascript">    
    
    fnAlert();       // 弹出 hello！
  
    function fnAlert(){
        alert('hello!');
    }
    

	alert(iNum);  // 弹出 undefined
    var iNum = 123;
    
</script>
```



###2. 函数传参

> Javascript 的函数中可以传递参数。

```
<script type="text/javascript">

    function fnAlert(a,b){
        alert(a);
    }
    
    fnAlert(12345,123);
    
</script>
```



### 3. 函数的返回值 

> JavaScript 中函数使用 return 返回内容

> 函数中 'return' 关键字的作用：
>
> * 返回函数中的值或者对象
> * 结束函数的运行

```html
<script type="text/javascript">
    // 函数的定义
    function addFunc(num1, num2){
        var result = num1 + num2;
        return result;
        alert('here!');
    }
	
    // 函数的调用
    var result = addFunc(3,4);
    // 弹出7
    alert(result);  
 
</script>
```



## 4. 条件语句

> 想要控制程序的走向，一般使用条件语句。

### 1) 条件运算符和逻辑运算符:

| 条件运算符       | 说明                                 | 举例                                              |
| :--------------- | ------------------------------------ | ------------------------------------------------- |
| ==               | 只要求值相等(在比较时会转换数据类型) | "1"  ==  true      (结果为true)                   |
| ===              | 要求值和类型都相等                   | "1" ===  true    (结果为false)                    |
| >                | 大于                                 | 3  > 5                  (结果为false)             |
| <                | 小于                                 | 3  <  5                  (结果为true)             |
| >=               | 大于等于                             | 3  >= 5                 (结果为false)             |
| <=               | 小于等于                             | 3  <= 5                 (结果为true)              |
| !=               | 不等于                               | 3   !=  5                (结果为true)             |
| &&(逻辑与)       | 同真为真,一假则假                    | x  &&   y              (同真为真,一假则假)        |
| \|\|    (逻辑或) | 全假为假, 一真则真                   | x   \|\|     y               (全假为假, 一真则真) |
| !     (逻辑非)   | 非眞则假,非假则真   (取反)           | ! x                         (非眞则假,非假则真)   |



###  2)  条件语句表达式  

* if 语句单独使用:                             

  > 使用时机:   满足一个2条件时,进行处理, 其他情况不考虑的.

  ```
  使用格式: 
  
  if (判断条件) {
      // 如果条件为 true, 进入这里执行
      执行的语句01
      ...
  }
  ```

* if...... else.... 语句:

> 使用时机:   针对一个条件, 满足处理,  不满足也处理.    只针对一个条件, 互为互斥事件.

```
使用格式: 

if (判断条件) {
    // 如果条件为 true, 进入这里执行
    执行的语句01
    ...
} else {
    // 如果条件为 false, 进入这里执行
    执行的语句01
    ...
}
```

* if..... else if ..... 语句

  > 使用时机:   针对不同的条件,  进行不同的处理.   需要注意是针对多个条件, 条件间没有必然联系
  >
  > 注意:  else if   可以有无限个

  ```
  使用格式: 
  
  if (判断条件01) {
      // 如果第一个条件为 true, 进入这里执行
      执行的语句01
      ...
  } else if (判断条件02) {
      // 如果第二个条件为 true, 进入这里执行
      执行的语句01
      ...
  }
  ```

* if.....  else if ...... else...... 语句

  ```
  使用格式: 
  
  if (判断条件01) {
      // 如果第一个条件为 true, 进入这里执行
      执行的语句01
      ...
  } else if (判断条件02) {
      // 如果第二个条件为 true, 进入这里执行
      执行的语句01
      ...
  } else {
  	// 如果上面两个条件都不满足, 进入这里执行
  	执行的语句01
  	...
  }
  ```

  ​

**举例:**

```
var iNum01 = 3;
var iNum02 = 5;
var sTr;
if ( iNum01 > iNum02 ){
    sTr = '大于';
} else {
    sTr = '小于';
}
alert(sTr);
```



**语句嵌套:**

```
var a = 100
if (a > 10) {
    if (a > 20) {
    	alert('大于20啦')
    }
} else {
    alert('没有10大')
}
```

### 3)   总结:

- &&    (同真为真, 一假为假)

  ​	     **True**           &&     **True** 		         ==> 	   **True**     

  ​            `False`    &&     **True**  		 ==> 	  `False`    

  ​	       **True**           &&    `False`	         ==>           `False` 

  ​	      `False`    &&    `False`	         ==> 	  `False`


- ||       (全假为假, 一真则真)

  ​	      **True**               ||               **True**               ===>        **True** 

  ​	          `False`        ||               **True**               ===>        **True** 

  ​	           **True**               ||             `False`         ===>        **True** 

  ​	             `False`       ||             `False`          ===>      `False`

- !   (非,   取反)

  ​		 !       **True**            ===>        `False`

  ​		 !      `False`     ===>          **True**






## 5. 获取元素方法

>  我们可以通过一些方法, 来获取 HTML 中的元素

>  通过内置对象 document 的 getElementById 方法来获取页面上设置了id属性的元素

>  获取到的是一个 html 对象，然后将它赋值给一个变量，比如：

```
JS部分:
<script type="text/javascript">
    var oDiv = document.getElementById('div1');
</script>

HTML部分:
<div id="div1">这是一个div元素</div>
```

**注意: **上面的语句，如果把 javascript 写在元素的上面，会获取不到当前的 HTML 元素:

> 因为页面是从上往下加载执行的，javascript 从页面上获取元素 div1 的时候，元素 div1 还没有加载.

**解决方法:**

* 第一种方法：将 javascript 放到页面最下边

  ```
  <body>
      <div id="div1">这是一个div元素</div>
      
      <script type="text/javascript">
          var oDiv = document.getElementById('div1')
          alert(oDiv)
       </script>
  </body>
  ```


* 第二种方法：将 javascript 语句放到 window.onload 触发的函数里面

  > window.onload 方法会在当前页面加载完成之后触发
  >
  > 获取元素的语句放在这个方法中执行，就可以正常获取了。


  ```
  <script type="text/javascript">
      window.onload = function(){
          var oDiv = document.getElementById('div1');
      }
  </script>



  <div id="div1">这是一个div元素</div>
  ```



## 6. 操作元素属性

> 获取的页面元素，就可以对页面元素的属性进行操作，属性的操作包括属性的读和写。



**操作元素属性**

读取属性:

> var 变量 = 元素.属性名     
>
> ```
> JS部分:
> var oInput = document.getElementById('input1');
> var oA = document.getElementById('link1');
> // 读取属性值
> var sValue = oInput.value;
> var sType = oInput.type;
> var sName = oInput.name;
> var sLinks = oA.href;
>
> HTML部分:
> <input type="text" name="setsize" id="input1" value="20px">
> <a href="http://www.itcast.cn" id="link1">传智播客</a>
> ```



改写属性:

> 元素.属性名 = 新属性值
>
> ```
> JS部分:
> var oA = document.getElementById('link1');
> // 写(设置)属性
> oA.style.color = 'red';
> oA.style.fontSize = sValue;
> 
> HTML部分:
> <a href="http://www.itcast.cn"  id="link1">传智播客</a>
> ```



**如果在 JS 中获取 HTML 的相关属性, 有如下注意点:**

* 如果能够在 HTML 页面正常看到的属性, 我们在 JS 中可以同名获取
* 如果在 JS 中想要获取 HTML 元素的 class 属性, 我们需要使用 className 来获取
* 对于 style 里面的属性, 如果使用 '-' 链接的, 我们要改成驼峰式, 例如:  font-size 改成: style.fontSize

> 上面修改的是标签的属性, 如果我们想要通过 JS 修改标签中的文本内容, 应该怎样修改呢?



**我们可以通过:  innerHTML 来进行修改:** 

> innerHTML 可以读取或者写入标签的文本部分

```
JS部分: 
<script type="text/javascript">
    window.onload = function(){
        var oDiv = document.getElementById('div1');
        //读取
        var sTxt = oDiv.innerHTML;
        alert(sTxt);
        //写入
        oDiv.innerHTML = '<a href="http://www.itcast.cn">传智播客<a/>';
    }
</script>


<div id="div1">这是一个div元素</div>
```



## 7. 事件属性及匿名函数

1)   事件属性

> 标签上除了可以添加 样式, id, class等属性之外,  还可以添加事件属性.

最常用的事件属性有: 

* 鼠标单击事件   onclick
* 鼠标双击事件   ondblclick   (double)
* 鼠标移入事件   onmouseover
* 鼠标移除事件   onmouseout

> 说明: 我们可以通过将函数名赋值给事件属性的形式, 将 事件 和 函数 关联起来

```
<script type="text/javascript">
    window.onload = function(){
    
        var oBtn = document.getElementById('btn1');
        oBtn.onclick = myalert;

        function myalert(){
            alert('ok!');
        }
    }
</script>
```



### 2)  匿名函数 

> 没有名字的函数, 称为匿名函数
>
> 可以将匿名函数的定义直接赋值给元素的事件属性来完成事件和函数的关联，这样可以减少函数命名，并且简化代码。函数如果做公共函数，就可以写成匿名函数的形式。

```
<script type="text/javascript">
    window.onload = function(){
    
    	// 正常的函数赋值调用
        var oBtn = document.getElementById('btn1');
        oBtn.onclick = myalert;
        function myalert(){
            alert('ok!');
        }
        
       
       // 匿名函数的使用
        oBtn.onclick = function (){
            alert('ok!');
        }
    }
</script>
```

# 二. 综合实例

我们将要做两个小的练习: 

* 网页换肤
* 打印名片



## 1. 网页换肤: 

![QQ截图20180508151500](images/QQ截图20180508151500.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="css/skin01.css" id="link01">
    <script>
        window.onload = function(){
            var oBtn01 = document.getElementById('btn01');
            var oBtn02 = document.getElementById('btn02');
            var oLink = document.getElementById('link01');

            oBtn01.onclick = function(){
                oLink.href = 'css/skin01.css';
            }

            oBtn02.onclick = function(){
                oLink.href = 'css/skin02.css';
            }

        }
    
    </script>
</head>
<body>
    <h1>网页内容</h1>
    <input class="box1" type="button" id="btn01" value="皮肤一">
    <input type="button" id="btn02" value="皮肤二">
</body>
</html>
```

skin01.css:  

```css
/* 设置网页的背景色 */
body{
   background:gold;
}

input{
    width:200px;
    height:50px;
    background:green;
    border:0px;
    color:#fff;
}
```

skin02.css:

```css
/* 设置网页的背景色 */
body{
   background:#ddd;
}

input{
    width:200px;
    height:50px;
    background:pink;
    border:0px;
    color:black;
    /* 设置圆角 */
    border-radius:25px;
}
```



## 2. 打印名片: 

![QQ截图20180508151440](images/QQ截图20180508151440.png)

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="css/main02.css">
    <script type="text/javascript">      
        window.onload = function(){
            var oInput01 = document.getElementById('input01');
            var oInput02 = document.getElementById('input02');
            var oInput03 = document.getElementById('input03');
            var oInput04 = document.getElementById('input04');
            var oInput05 = document.getElementById('input05');
            var oInput06 = document.getElementById('input06');
            var oInput07 = document.getElementById('input07');
            var oBtn = document.getElementById('setcard');
            var oCard = document.getElementById('card_wrap');


            oBtn.onclick = function(){
                var sVal01 = oInput01.value;
                var sVal02 = oInput02.value;
                var sVal03 = oInput03.value;
                var sVal04 = oInput04.value;
                var sVal05 = oInput05.value;
                var sVal06 = oInput06.value;
                var sVal07 = oInput07.value;
                
                // 判断输入框不为空
                if(sVal01=='' || sVal02=='' || sVal03=='' || sVal04=='' || sVal05=='' || sVal06==''){
                    alert('输入框不能为空！');
                    //结束程序往下执行
                    return;
                }

                var sTr = '<div class="p01">'+ sVal01 +'<em>'+ sVal02 +'</em></div>'
                          +'<div class="p02">'                    
                          +'<p class="company">'+ sVal03 +'</p>'
                          +'<p>手机：'+ sVal04 +'</p>'
                          +'<p>email：'+ sVal05 +'</p>'
                          +'<p>地址：'+ sVal06 +'</p>'
                          +'</div>';
                
                // 改变名片内容
                oCard.innerHTML = sTr;

                // 改变名片风格
                if(sVal07==0){
                    oCard.className = 'idcard01';
                }else if(sVal07==1){
                    oCard.className = 'idcard02';
                }else{
                    oCard.className = 'idcard03';
                }            
            }
        }
    </script>
</head>
<body>
    <div class="set_con">
        <div class="left_set">
            <label>姓名：</label>
            <input type="text" id="input01">
            <label>职位：</label>
            <input type="text" id="input02">
            <label>公司名称：</label>
            <input type="text" id="input03">
            <label>手机：</label>
            <input type="text" id="input04">
            <label>email：</label>
            <input type="text" id="input05">
            <label>地址：</label>
            <input type="text" id="input06">
            <label>风格：</label>
            <select  id="input07">
                <option value="0">风格一</option>
                <option value="1">风格二</option>
                <option value="2">风格三</option>
            </select>
            <input type="button" value="设 置" class="setbtn" id="setcard">
        </div>
        <div class="right_show">
            <div class="idcard01" id="card_wrap">
                <div class="p01">张大山<em>产品经理</em></div>
                <div class="p02">                    
                    <p class="company">银河科技信息技术有限公司</p>
                    <p>手机：1808888888</p>
                    <p>email：dasan@126.com</p>
                    <p>地址：中关村银河大厦B座2603</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
```

main02.css:

```
.set_con{
    width:900px;
    height:400px;
    border:1px solid #666;
    margin:50px auto 0;
}

.left_set{
    width:299px;
    float:left;
    height:380px;
    border-right:1px solid #666;
    padding-top:20px;
}

.left_set label{
    float:left;
    width:80px;
    height:30px;
    line-height:30px;
    text-align:left;
    text-indent:20px;
    margin-top:10px;
    font-size:12px;
}

.left_set input,.left_set select{
    padding:0px;
    width:198px;
    height:30px;
    border: 1px solid #999;
    float:left;
    margin-top:10px;
    text-indent:10px;
    outline:none;
    border-radius:5px;
    background:#fff;
}

.left_set select{
    height:32px;
}

.left_set .setbtn{
    width:99px;
    height:40px;
    border:0px;
    background:#0181cc;
    color:#fff;
    text-indent:0px;
    margin-left:80px;
    font-size:16px;
    margin-top:20px
}

.right_show{
    width:600px;
    height:400px;
    float:left;
    overflow:auto;
}

.idcard01,.idcard02,.idcard03{
    width:450px;
    height:270px;
    border: 1px solid #ddd;
    background:url(../images/bg01.jpg) no-repeat;
    margin:60px auto 0;
    position:relative;
}

.idcard02{
    background:url(../images/bg02.jpg) no-repeat;
}

.idcard03{
    background:url(../images/bg03.jpg) no-repeat;
}

.idcard01 .p01,.idcard02 .p01,.idcard03 .p01{
    position:absolute;
    right:40px;
    top:123px;
    font-size:22px;
    font-weight:bold;
    color:#666;
}

.idcard02 .p01{
    right:300px;
    top:200px;
}

.idcard03 .p01{
    right:auto;
    left:217px;
    top:149px;
}

.idcard01 .p01 em,.idcard02 .p01 em,.idcard03 .p01 em{
    font-size:14px;
    font-style:normal;
    font-weight:normal;
    margin-left:10px;
    color:#666;
}

.idcard01 .p02,.idcard02 .p02,.idcard03 .p02{
    position:absolute;
    right:40px;
    top:160px;   
}

.idcard03 .p02{
    right:auto;
    left:217px;
    top: 180px;
}

.idcard01 .p02 p,.idcard02 .p02 p,.idcard03 .p02 p{
    text-align:right;
    font-size:12px;
    line-height:24px;
    margin:0px;
    color:#666;
}

.idcard02 .p02 p,.idcard03 .p02 p{
    text-align:left;
}

.idcard03 .p02 p{
    line-height:18px;
}

.idcard01 .p02 .company,.idcard02 .p02 .company,.idcard03 .p02 .company{
    font-size:14px;
    font-weight:bold;
}
```



# 今日学习以及掌握目标:

* ### 掌握定义数组的方法
* 熟悉操作数组中数据的方法
* 掌握循环语句的使用场景及定义
* 掌握JavaScript中常见的字符串的处理方法
* 熟悉调试程序的方法
* 理解定时器在JavaScript中的作用
* 掌握定时器的类型及语法
* 能完成定时器制作移动动画及定时器制作无缝滚动的练习



# 三 .  JS 高级

> 介绍 javascript 数组和字符串的操作方法、循环语句、定时器的使用及实例、变量作用域、封闭函数的使用场景。



## 1. 数组及操作方法

> 数组就是一组数据的集合，javascript 中，数组里面的数据可以是不同类型的, 这里的数组就相当于我们 python 中的列表



###定义数组的方法

```
数组定义形式: 
第一种: 
var 数组名 = new Array(元素一, 元素二, 元素三...) 


第二种: 
var 数组名 = [元素一, 元素二, 元素三...]
```

例如: 

```javascript
// 对象的实例创建
var aList = new Array(1,2,3);

// 直接量创建
var aList2 = [1,2,3,'asd'];
```



##2.  数组常见的操作方法: 

###1、获取数组的长度：

>  一般我们获取数组长度使用: length 

```
var aList = [1,2,3,4];

// 打印输出数组 aList 的长度
console.log(aList.length)
```

结果: 

```
4
```

> var  aList =  ['光头强',   '熊大',  '熊二',   '翠花',   '吉吉',  '萝卜头]



###2、下标索引的使用：

>  和python一样, 我们也可以利用下标索引的思想来操作数组中某一个元素:  aList[0]

```
var aList = [1,2,3,4];

console.log(aList[0]); 
```

结果: 

```
1
```

> var  aList = ['美羊羊',  '慢羊羊',  '红太狼',   '喜羊羊',   '懒羊羊']



###3、join(分隔符) 

> 将数组成员通过一个分隔符合并成字符串

```
var aList = [1, 2, 3, 4]

var newList = aList.join('-')

console.log(newList)
console.log(typeof(newList)) 
```

结果: 

```
1-2-3-4
string
```

>  var   aList = ['七龙珠',  '史努比', '铁壁阿童木',  '忍者神龟',  '兔八哥']



###4、push( ) 和 pop( )

> 从数组最后增加成员或删除成员

```
var aList = [1,2,3,4];

aList.push(5);
console.log(aList)

aList.pop()
console.log(aList)
```

结果:

```
[1, 2, 3, 4, 5]

[1, 2, 3, 4]
```

> var aList = ['灌篮高手',  '邋遢大王奇遇记',  '变形金刚']

###5、reverse( ) 

> 将数组反转

```
var aList = [3,2,1,4];

aList.reverse();
console.log(aList)
```

结果: 

```
[4, 1, 2, 3]

```

> var aList = ['蜡笔小新',  '舒塔和贝塔',  '魔神英雄坛',  '棒球英豪']



###6、indexOf( ) 

> 返回数组中元素第一次2出现的索引值:
>
> * 如果有, 则正常返回索引值
> * 如果检索的内容不存在于数组中, 则返回 -1

```
var aList = [1,2,3,4,1,3,4];

console.log( aList.indexOf(4) )
console.log( aList.indexOf(5) )
```

结果: 

```
3
-1
```

> var aList = ['美少女战士',  '犬夜叉',  '黄金圣斗士',  '猫和老鼠',  '美少女战士',  '猫和老鼠']



###7、splice( ) 

>  在数组中增加或删除成员

```
使用格式: 

数组名.splice(index,howmany,item1,.....,itemX)
```

>   index:    必需。整数，规定添加/删除项目的位置，使用负数可从数组结尾处规定位置。
>
>   howmany:  必需。要删除的项目数量。如果设置为 0，则不会删除项目。
>
>   item1, ..., itemX:   可选。向数组添加的新项目。

例如:

```
var aList = [1,2,3,4];

// 从第2个元素开始，删除1个元素，然后在此位置增加'7,8,9'三个元素
aList.splice(2,1,7,8,9); 
alert(aList); //弹出 1,2,7,8,9,4
```



### 8. 多维数组

>  多维数组指的是数组的成员也是数组的数组。

```
var aList = [[1,2,3],['a','b','c']];

alert(aList[0][1]); //弹出2;
```

批量操作数组中的数据，需要用到循环语句



## 2. 循环

程序中进行有规律的重复性操作，需要用到循环语句。

**for循环**

```
使用格式:

for (var i=0;i<5;i++)
{
    console.log(i)
}
```

打印结果: 

```
0
1
2
3
4
```

### 课堂练习

1、数组去重

>  var aList = [1,2,3,4,4,3,2,1,2,3,4,5,6,5,5,3,3,4,2,1];

```
var aList = [1,2,3,4,4,3,2,1,2,3,4,5,6,5,5,3,3,4,2,1];

var aList2 = [];
// 第一种方法: 
for (var i=0;i< aList.length;i++){
    var value = aList[i]
    if (aList2.indexOf(value) + 1){
        console.log('重复了',value)
    } else {
        aList2.push(value)
    }
}
console.log(aList2)

// 第二种方法:
for(var i=0;i<aList.length;i++)
{
    if(aList.indexOf(aList[i])==i)
    {
        aList2.push(aList[i]);
    }
}

alert(aList2);

// 第三种形式:
   for (var i = 0; i < aList.length; i++) {
            var item = aList[i]
            if (newArray.indexOf(item) == -1) {
                newArray.push(item)
            } else {
                console.log('重复了',item)
            }
        }
```



2、将数组数据放入页面

> var  list = ['弱点',  '看不见的客人', '摔跤吧, 爸爸',  '龙猫',  '全民目击', '触不可及', '萨利机长','消失的爱人]

```
JS部分: 
<script>
    window.onload = function () {
        var ul = document.getElementById('ulbox')
        var  list = ['弱点','看不见的客人','摔跤吧, 爸爸','龙猫','全民目击','触不可及','萨利机长']
        var str = ''
        for (var i=0;i<list.length;i++){
            value = list[i]
            str += '<li>' + value + '</li>'
        }
        console.log(str)
        ul.innerHTML = str
    }
</script>


HTML部分: 
<ul id="ulbox">

</ul>
```



## 3. 字符串处理方法

###1、`+ ` 运算符

> 如果是两个数字进行相加运算, 得到的是 两个数的和
>
> 如果是两个字符串进行相加运算, 得到的是 两个字符串的拼接
>
> 如果是一个字符串, 一个数字的相加运算, 得到的是 拼接的结果

```
var iNum01 = 12;
var iNum02 = 24;
var sNum03 = '12';
var sTr = 'abc';

alert( iNum01 + iNum02 );  // 弹出36
alert( iNum01 + sNum03 );  // 弹出1212 数字和字符串相加等同于字符串相加
alert( sNum03 + sTr );     // 弹出12abc
```



###2、parseInt( ) 

> 将 数字字符串 转化为 整数

```
var sNum01 = '12';
var sNum02 = '24';
var sNum03 = '12.32';


alert( sNum01+sNum02 );                    	  // 弹出1224
alert( parseInt(sNum01) + parseInt(sNum02) )  // 弹出36
alert( parseInt(sNum03) )                     // 弹出数字12 将字符串小数转化为数字整数
```



###3、parseFloat( )

> 将数字字符串转化为小数

```
var sNum03 = '12.62'
alert( parseFloat(sNum03) );  // 弹出 12.32 将字符串小数转化为数字小数
```



###4、split( ) 

> 把 一个字符串 分隔成 字符 组成的 数组

```
var sTr = '2017-4-22';
var aStr1 = sTr.split("-");
var aStr2 = sTr.split("");
var aStr3 = sTr.split();

console.log(aStr1);   
console.log(aStr2);   
console.log(aStr3)    
```

结果: 

```
['2017','4','22']
['2','0','1','7','-','4','-','2','2']
['2017-4-22']

```



练习:  var str="How are you doing today?"

> 如果把空字符串 ("") 用作 separator，那么 stringObject 中的每个字符之间都会被分割。
>
> **注意：** split() 方法不改变原始字符串。

```
<p id="demo">单击按钮显示分割后的数组.</p>
<button onclick="myFunction()">点我</button>
<script>
function myFunction(){
	var str="How are you doing today?";
	var n=str.split(" ");
	document.getElementById("demo").innerHTML=n;
}
</script>
```



###5、indexOf() 

> 方法可返回某个指定的字符串值在字符串中首次出现的位置。
>
> 如果要检索的字符串值没有出现，则该方法返回 -1。

```
var sTr = "abcdefgh";

var iNum = sTr.indexOf("c");
alert(iNum); // 弹出2
```



###6、substring( )        

>  截取字符串 
>
>  左闭右开    [start,  stop)       start <=  x < stop

```
使用方法: 

字符串.substring(start,stop)
```

> start:    必需。一个非负的整数，规定要提取的子串的第一个字符在 字符串 中的位置。
>
> stop:   可选。一个非负的整数，比要提取的子串的最后一个字符在 字符串 中的位置多 1。如果省略该参数，那么返回的子串会一直到字符串的结尾。

例如: 

```
var sTr = "abcdefghijkl";
var sTr2 = sTr.substring(3,5);
var sTr3 = sTr.substring(1);

alert(sTr2); // 弹出 de
alert(sTr3); // 弹出 bcdefghijkl
```



### 7. 字符串反转:

> 将字符串的内容颠倒过来,  不是排序

```
var str = 'asdfj12jlsdkf098';
var str2 = str.split('').reverse().join('');

console.log(str2);
```

结果: 

```
890fkdslj21jfdsa
```



思考:  

如果我们把上面的式子写成下面的样子, 能否达到同样的效果: 

```
var str = 'asdfj12jlsdkf098';
var str2 = str.split().reverse().join('');

console.log(str2);
```

结果:

















```
asdfj12jlsdkf098
```





#四. 调试程序的方法

* alert

  ```
  使用方式: 
  alert(要展示的内容)
  
  alert展示内容的形式是弹出一个对话框, 然后把内容添加上去. 
  通常用于程序需要暂时停止的情况
  ```
  console.log

  ```
  使用方式: 
  console.log(要展示的内容)
  
  console.log()方法能够帮助我们将调试的代码展示在浏览器的控制台
  一般我们使用这样的调试方式较多, 而且浏览器控制台能够直接修改代码, 方便我们多次调试
  ```

* document.title 

  ```
  使用方法: 
  document.title = 要显示的内容
  
  这样的方式可以把要调试的内容,展示在网页的标题区域
  这样的方式适合于偶尔展示
  ```

* document.write( )

  ```
  使用方法: 
  document.write(exp1,exp2,exp3,....)
  
  write() 方法可向文档写入 HTML 表达式或 JavaScript 代码
  可列出多个参数(exp1,exp2,exp3,...) ，它们将按顺序被追加到文档中。
  一般不怎么使用, 偶尔可用
  
  ```

  ​



#五. 定时器

>  定时器在 javascript 中的作用
>
> * 定时调用函数
> * 制作动画
> * 模拟网络延时的情况

## 1. 定时器的种类:

* 执行一次的定时器:   setTimeout
* 执行多次的定时器:   setInterval
* 关闭只执行一次的定时器:    clearTimeout 
* 关闭反复执行的定时器:   clearInterval 

```
定时器的使用方式: 

setInterval(code,millisec)
```

> code    必需。要调用的函数或要执行的代码串。
>
> millisec   必须。周期性执行或调用 code 之间的时间间隔，以毫秒计。

# 

例如: 

```javascript
// 设置定时器
var time1 = setTimeout(myalert,2000);
var time2 = setInterval(myalert,2000);

// 去除定时器
clearTimeout(time1);
clearInterval(time2);

// 定时器调用的方法
function myalert(){
    alert('ok!');
}
```





## 1. 使用定时器 -----  使方框移动

```html
CSS部分: 
<style>
    .box{
        width:300px;
        height:300px;
        background:gold;
        position:fixed;
        left:0px;
        top:100px;
    }
</style>

JS部分: 
<script>
    window.onload = function(){
        var oBox = document.getElementById('box');
        var iLeft = 0;

    	var oTimer = setInterval(fnMove,30);
    	function fnMove(){
            iLeft += 3;                
            if(iLeft>600)
            {
                clearInterval(oTimer);
            }
            oBox.style.left = iLeft + 'px';
         }        
    }    2
</script>

HTML部分: 
 <div class="box" id="box"></div>
```



## 2.  使方框左右移动: 

```html
CSS部分: 
<style>
    .box{
        width:300px;
        height:300px;
        background:gold;
        position:fixed;
        left:0px;
        top:100px;
    }
</style>

JS部分: 
<script>
    window.onload = function(){
        var oBox = document.getElementById('box');
        var iLeft = 0;
        var iSpeed = 3;

        var oTimer = setInterval(fnMove,30);
        function fnMove(){
            iLeft += iSpeed;                
            if(iLeft>600)
            {
                iSpeed = -3;
            }
            
            if(iLeft<0)
            {
                iSpeed = 3;
            }

            oBox.style.left = iLeft + 'px';
        }        
    }    
</script>


HTML部分:
<div class="box" id="box"></div>
```



## 3. 无限轮播动画

```html
CSS部分: 
<style type="text/css">
	body,ul{
		margin:0;
		padding:0;
	}

	.list_con{
		
		width:1000px;
		height:200px;
		border:1px solid #000;
		margin:10px auto 0;
		background-color:#f0f0f0;
		position:relative;
		overflow:hidden;
	}

	.list_con ul{
		list-style:none;
		width:2000px;
		height:200px;
		position:absolute;
		left:0;
		top:0;
	}


	.list_con li{
		width:180px;
		height:180px;
		float:left;
		margin:10px;
	}

	.btns_con{
		width:1000px;
		height:30px;
		margin:50px auto 0;
		position:relative;
	}

	.left,.right{
		width:30px;
		height:30px;
		background-color:gold;
		position:absolute;
		left:-40px;
		top:124px;
		font-size:30px;
		line-height:30px;
		color:#000;
		font-family: 'Arial';
		text-align:center;
		cursor:pointer;
		border-radius:15px;
		opacity:0.5;
	}
	.right{
		left:1010px;			
		top:124px;			
	}
</style>

JS部分:
<script type="text/javascript">
	window.onload = function(){
		// 获取图片的容器
		var oUl = document.getElementById('list');

		// 获取左右两个按钮
		var oLeft = document.getElementById('btn01');
		var oRight = document.getElementById('btn02');

		// ul的容器
		var oSlide = document.getElementById('slide');

		// 将ul中的5个li复制一份
		oUl.innerHTML = oUl.innerHTML + oUl.innerHTML;

		var iLeft = 0;
		var iSpeed = -3;

		// 定义变量存储iSpeed的值
		var iLastSpeed = 0;

		var oTimer = setInterval(fnMove,30);

		function fnMove(){
			iLeft += iSpeed;
			
			// 当移动到最左边的时候
			if(iLeft<-1000)
			{
				iLeft = 0;
			}

			// 当移动到最右边的时候
			if(iLeft>0){
				iLeft = -1000;
			}

			oUl.style.left = iLeft + 'px';
		}

		oLeft.onclick = function(){
			iSpeed = -3;
		}

		oRight.onclick = function(){
			iSpeed = 3;
		}

		// 定义鼠标移入事件
		oSlide.onmouseover = function(){
			iLastSpeed = iSpeed;
			iSpeed = 0;
			//clearInterval(oTimer);
		}
		
		// 定义鼠标移出事件
		oSlide.onmouseout = function(){
			iSpeed = iLastSpeed;
			//oTimer = setInterval(fnMove,30);
		}
	}		
</script>

HTML部分: 
<body>
	<div class="btns_con">
		<div class="left" id="btn01">&lt;</div>
		<div class="right" id="btn02">&gt;</div>
	</div>
	<div class="list_con" id="slide">
		<ul id="list">
            <li><a href=""><img src="images/goods001.jpg" alt="商品图片"></a></li>
            <li><a href=""><img src="images/goods002.jpg" alt="商品图片"></a></li>
            <li><a href=""><img src="images/goods003.jpg" alt="商品图片"></a></li>
            <li><a href=""><img src="images/goods004.jpg" alt="商品图片"></a></li>
            <li><a href=""><img src="images/goods005.jpg" alt="商品图片"></a></li>
		</ul>
	</div>
</body>
```





# 今日学习以及掌握目标总结:

- 掌握定义数组的方法
- 熟悉操作数组中数据的方法
- 掌握循环语句的使用场景及定义
- 掌握JavaScript中常见的字符串的处理方法
- 熟悉调试程序的方法
- 理解定时器在JavaScript中的作用
- 掌握定时器的类型及语法
- 能完成定时器制作移动动画及定时器制作无缝滚动的练习



#六.  变量作用域

变量作用域指的是变量的作用范围，javascript 中的变量分为全局变量和局部变量。

>  全局变量：在函数之外定义的变量，为整个页面公用，函数内部外部都可以访问。

>  局部变量：在函数内部定义的变量，只能在定义该变量的函数内部访问，外部无法访问。

```html
<script type="text/javascript">
    // 定义全局变量
    var a = 12;
    function myalert()
    {
        // 定义局部变量
       // a = 12
        var b = 23;
        alert(a);
        // 修改全局变量
        a++;
        alert(b);
    }
    myalert(); // 弹出12和23
    alert(a);  // 弹出13    
    alert(b);  // 出错
</script>
```





# 七.  封闭函数

封闭函数是 javascript 中匿名函数的另外一种写法，创建一个一开始就执行而不用命名的函数。

执行函数：

```
function myalert(){
    alert('hello!');
};

myalert();
```

封闭函数：

```
(function(){
    alert('hello!');
})();
```

还可以在函数定义前加上“~”和“!”等符号来定义匿名函数

```
!function(){
    alert('hello!');
}()
```

**封闭函数的作用** 

> 封闭函数可以创造一个独立的空间
>
> 在封闭函数内定义的变量和函数不会影响外部同名的函数和变量，可以避免命名冲突
>
> 在页面上引入多个 js 文件时，用这种方式添加 js 文件比较安全，比如：

```
var iNum01 = 12;
function myalert(){
    alert('hello!');
}

(function(){
    var iNum01 = 24;
    function myalert(){
        alert('hello!world');
    }
    alert(iNum01);
    myalert()
})()

alert(iNum01);
myalert();
```



