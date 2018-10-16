# 学习目标:

* 能熟练使用相对地址、绝对地址
* 熟悉overflow的设置项
* 理解css盒子模型
* 掌握html<form>标签定义表单区域
* 掌握<form>标签action属性、method属性
* 掌握<label>为表单元素定义文字标注
* 掌握<input>标签定义通用的表单元素:type属性、value属性、name属性
* 掌握<tetarea>标签定义多行文本输入框
* 掌握<select>标签定义下拉表单元素
* 掌握<option>标签与<select>标签配合定义下拉表单元素中的选项



# 一. 地址

网页上引入或链接到外部文件，需要定义文件的地址，常见引入或链接外部文件包括以下几种：

```
<!-- 引入外部图片   -->
<img src="images/001.jpg" alt="图片" />

<!-- 添加一个图片 -->
<img src="C:\course5\03day\images\001.jpg" alt="图片" />


<!-- 链接到另外一个网页   -->
<a href="002.html">链接到网页2</a>

<!-- 链接到另外一个网页   -->
<a href="C:\source2\002.html">链接到网页2</a>


<!-- 外链一个css文件   -->
<link rel="stylesheet" type="text/css" href="css/main.css" />

<!-- 外链一个js文件   -->
<script type="text/javascript" src="js/jquery.js"></script>
```

这些地址分为相对地址和绝对地址:







## 1. 相对地址 

> 相对于引用文件本身去定位被引用的文件地址，相对地址的定义技巧：

- “ ./ ” 表示当前文件所在目录下，比如：“./pic.jpg” 表示当前目录下的pic.jpg的图片，这个使用时可以省略。

- “ ../ ” 表示当前文件所在目录下的上一级目录，比如：“../images/pic.jpg” 表示当前目录下的上一级目录下的images文件夹中的pic.jpg的图片。

  

## 2. 绝对地址 

> 相对于磁盘的位置去定位文件的地址:

例如:`<img src="C:\course5\03day\images\001.jpg" alt="图片" /> `

>  相对地址在整体文件迁移时会因为磁盘和顶层目录的改变而找不到文件，绝对地址就没有这个问题。





#二. CSS--内外边距

![6c224f4a20a44623c4d9f4ee9222720e0cf3d72f](../../../%E4%B8%8A%E8%AF%BE%E5%B7%A5%E5%85%B7/python%E5%89%8D%E7%AB%AF%E9%83%A8%E5%88%86/day01/images/6c224f4a20a44623c4d9f4ee9222720e0cf3d72f.jpg)

- margin:  用于控制元素与元素之间的距离, margin的最基本用途就是控制元素周围空间的间隔,从视觉角度上达到互相隔开的目的
- padding:  用于控制内容与边框之间的距离
- border(边框):   围绕在内边距和内容外的边框
- content(内容):  盒子的内容, 显示文本和图像.

重要提示:  

​	当你指定一个CSS元素的宽度和高度属性时, 你只是设置内容区域的宽度和高度.

​	完全大小的元素, 你还必须加上内边距, 边框和外边距.

```html
<style>
    .div1 {
        width: 100px;
        height: 100px;
        background-color: pink;
        border: 40px solid blue;
        padding: 40px;
    }
    .div2 {
        width: 100px;
        height: 100px;
        background-color: lightblue;
        border: 1px solid red;
    }
</style>


<div class="div1">hello div1</div>
<div class="div2">hello div222</div>
```

![QQ截图20180526142251](../../../%E4%B8%8A%E8%AF%BE%E5%B7%A5%E5%85%B7/python%E5%89%8D%E7%AB%AF%E9%83%A8%E5%88%86/day02&day03/images/QQ%E6%88%AA%E5%9B%BE20180526142251.png)

**如果上下两个元素都有设置相对的margin值, 则选择大的添加, 小的不添加.这个称谓margin兄弟塌陷**

**margin父子塌陷问题: **

- 如果父级 div 中没有 border,   padding,   inline content(文本), 子级 div 的 margin 会一直往上找,直到找到某个标签包括 border,  padding,   inline content(文本) 中的其中一个, 然后按此 div 进行 margin.

```html
<style>
    .div1 {
        width:200px;
        height:200px;
        background-color: pink;
        border: 20px solid red;
        padding: 5px;
        margin-bottom: 40px;
    }
    .div2 {
        width:200px;
        height:200px;
        background-color: blue;
        border: 20px solid red;
        padding: 5px;
        margin-top: 40px;
    }
    .outer {
        height: 1000px;
        background-color: lightblue;
    }
    .box {
        width:100px;
        height:100px;
        background-color: orange;
    }
</style>



<div class="box"></div>

<div class="outer">
    <div class="div1">hello div1</div>
    <div class="div2">hello div2</div>
</div>
```





补充说明: 

background-color 背景颜色

background-image 背景图片

background-repeat 背景重复

我们可以对上面的代码进行合并书写: 

background: url(bgimg.gif)  no-repeat  5px  5px;

![1_100324090828_1](../../../%E4%B8%8A%E8%AF%BE%E5%B7%A5%E5%85%B7/python%E5%89%8D%E7%AB%AF%E9%83%A8%E5%88%86/day01/images/1_100324090828_1.png)



## 1.  CSS盒子模型 

**盒子模型解释** 

> 元素在页面中显示成一个方块，类似一个盒子，CSS盒子模型就是使用现实中盒子来做比喻，帮助我们设置元素对应的样式。盒子模型示意图如下：

![view01](images/view01.jpg)

> 把元素叫做盒子，设置对应的样式分别为：盒子的宽度(width)、盒子的高度(height)、盒子的边框(border)、盒子内的内容和边框之间的间距(padding)、盒子与盒子之间的间距(margin)。



**设置宽高  width  height**

```
width:200px;  /* 设置盒子的宽度，此宽度是指盒子内容的宽度，不是盒子整体宽度(难点) */ 
height:200px; /* 设置盒子的高度，此高度是指盒子内容的高度，不是盒子整体高度(难点) */
```





**设置边框** border

>  设置一边的边框，比如顶部边框，可以按如下设置：

```
border-top:10px solid red;
```

其中10px表示线框的粗细；solid表示线性。

设置其它三个边的方法和上面一样，把上面的'top'换成'left'就是设置左边，换成'right'就是设置右边，换成'bottom'就是设置底边。

四个边如果设置一样，可以将四个边的设置合并成一句：

```
border:10px solid red;
```







**设置内间距  padding**

设置盒子四边的内间距，可设置如下：

```
padding-top：20px;     /* 设置顶部内间距20px */ 
padding-left:30px;     /* 设置左边内间距30px */ 
padding-right:40px;    /* 设置右边内间距40px */ 
padding-bottom:50px;   /* 设置底部内间距50px */
```

上面的设置可以简写如下：

```
/* 四个值按照顺时针方向，分别设置的是 上 右 下 左  四个方向的内边距值。 */
padding：20px 40px 50px 30px; 
```

padding后面还可以跟3个值，2个值和1个值，它们分别设置的项目如下：

```
padding：20px 40px 50px; /* 设置顶部内边距为20px，左右内边距为40px，底部内边距为50px */ 
padding：20px 40px; /* 设置上下内边距为20px，左右内边距为40px*/ 
padding：20px; /* 设置四边内边距为20px */
```



**设置外间距margin** 
外边距的设置方法和padding的设置方法相同，将上面设置项中的'padding'换成'margin'就是外边距设置方法。



**外间距居中技巧** 
如果子元素是块元素，且它的宽度小于父元素，可以将子元素左右设置auto来水平居中子元素

```
/* 子元素上下外边距设为0，左右设置为auto */
margin:0px auto;
```





**盒子的真实尺寸** 
盒子的width和height值固定时，如果盒子增加border和padding，盒子整体的尺寸会变大，所以盒子的真实尺寸为：

- 盒子宽度 = width + padding左右 + border左右
- 盒子高度 = height + padding上下 + border上下




# 三. 列表 标签

> 前端中列表分为两种:   
>
> * 有序列表
> * 无序列表

## 1. 无序列表

无序列表一般应用在布局中的新闻标题列表和文章标题列表以及菜单，它是含有语义的，标签结构如下：

```
使用方式:         ul>li{列表标题}*3


<ul>
    <li>列表标题</li>
    <li>列表标题</li>
    <li>列表标题</li>
</ul>
```

列表的内容一般是可以链接的，点击链接到新闻或者文章的具体内容，所以具体结构一般是这样的：

```
ul>(li>a[href=#]{列表标题 $})*3

<ul>
    <li><a href="#">列表标题 1</a></li>
    <li><a href="#">列表标题 2</a></li>
    <li><a href="#">列表标题 3</a></li>
</ul>
```

显示效果:

![1525662639410](images/1525662639410.png)



## 2. 有序列表

```
使用方式:         ol>li{列表标题}*3

<ol>
    <li>列表标题</li>
    <li>列表标题</li>
    <li>列表标题</li>
</ol>
```

显示效果:

![QQ截图20180507111216](images/QQ截图20180507111216.png)



请进行如下的 emmet 语法练习: 

```
.box>.box1+.box2
```

```
#page>div.logo+ul#navigation>li*5>a{Item $}
```

```
div#header+div.page+div#footer.class1.class2.class3
```







**总结:**

* 我们在写页面的时候经常会使用列表标签

* 写列表标签的时候, 我们可以去掉前面的点或者是序号: 

  * ```css
    <style>
    	li {
            list-style:none; /* 取消列表前面的序号或者是点 */
    	}
    </style>
    ```

* 写所有 html 页面的时候, 都可以使用 emmet 语法













# 四. HTML表单

表单用于搜集不同类型的用户输入，表单由不同类型的标签组成，相关标签及属性用法如下：

1、`<form>`标签 定义整体的表单区域

> action属性 定义表单数据提交地址
>
> method属性 定义表单提交的方式，一般有“get”方式和“post”方式

```
使用方式:

<form action="" method="">
	
</form>
```



2、`<label>`标签 为表单元素定义文字标注

> label 的 for 属性值可以和 input 的 id 名书写一致, 使 label 的点击也能够触发 input 的聚焦

```
label的使用方式:
<label for="">Male</label>
<label for="">Female</label>

label的for属性设置: 
<label for="male">用户名:
<input type="text" id="male">
```



3、`<input>`标签 定义通用的表单元素

- type属性
  - type="text" 定义单行文本输入框
  - type="password" 定义密码输入框
  - type="radio" 定义单选框
  - type="checkbox" 定义复选框
  - type="file" 定义上传文件
  - type="submit" 定义提交按钮
  - type="reset" 定义重置按钮
  - type="button" 定义一个普通按钮
  - type="hidden"
- value属性 定义表单元素的值
- name属性 定义表单元素的名称，此名称是提交数据时的键名


```
使用方法:

<input type="text" name="username" placeholder="请您输入姓名">

<input type="password" name="password">

<input type="radio" name="gender" value="1"> 男
<input type="radio" name="gender" value="0"> 女

<input type="checkbox" name="hobby" value="1"> 唱歌

<input type="file" name="file"> 

<input type="submit">
<input type="reset">
<input type="button" value="按钮1">
```






4、`<textarea>`标签 定义多行文本输入框

```
使用方法:
<textarea name="" placeholder="提示信息..." id="" cols="30" rows="10">
	textarea的使用
</textarea>
```





5、`<select>`标签 定义下拉表单元素

6、`<option>`标签 与`<select>`标签配合，定义下拉表单元素中的选项

```
使用方法: 

创建带有 4 个选项的选择列表：
<select name="province" id="">
    <option value="1">北京</option>
    <option value="2">河北</option>
    <option value="3">河南</option>
    <option value="4">湖北</option>
</select>
```



练习:

![QQ截图20180506164312](images/QQ截图20180506164312.png)

**注册表单实例：**

```html
<form action="http://www..." method="get">
        <p>
            <label>姓名：</label>
            <input type="text" name="username" />
        </p>
        <p>
            <label>密码：</label>
            <input type="password" name="password" />
        </p>
        <p>
            <label>性别：</label>
            <input type="radio" name="gender" value="0" /> 男
            <input type="radio" name="gender" value="1" /> 女
        </p>
        <p>
            <label>爱好：</label>
            <input type="checkbox" name="like" value="sing" /> 唱歌
            <input type="checkbox" name="like" value="run" /> 跑步
            <input type="checkbox" name="like" value="swiming" /> 游泳
        </p>
        <p>
            <label>照片：</label>
            <input type="file" name="person_pic">
        </p>
        <p>
            <label>个人描述：</label>
            <textarea name="about"></textarea>
        </p>
        <p>
            <label>籍贯：</label>
            <select name="site">
                <option value="0">北京</option>
                <option value="1">上海</option>
                <option value="2">广州</option>
                <option value="3">深圳</option>
            </select>
        </p>
        <p>
            <input type="submit" name="" value="提交">
            <input type="reset" name="" value="重置">
        </p>
</form>
```

**单行文本框文字提示**

- placeholder 设置input输入框的默认提示文字。




**总结:**

* 在前端页面中, 我们往往用表单来制作用户的注册, 登录等功能.
* 表单包含很多内容, 例如:
  * 单选:  radio
  * 多选:  checkbox
  * 密码: password
  * 文本: text
  * 按钮:  reset,   submit,  file
  * 多行文本输入:  textarea
  * 下拉菜单:  select    option
* 表单( form )可以直接提交:   提交方法包含 get    post  
  * action:  提交的服务器地址
  * method:  提交的方法








# 五. 表格元素及相关样式

1、`<table>`标签

> 声明一个表格

2、`<tr>`标签

> 定义表格中的行

3、`<td>`和`<th>`标签

>   定义列以及列中的标题
>
> `td`代表列，`th`表示列中的标题部分(加粗)

它们的常用属性如下：

- colspan 设置单元格水平合并，设置值是数值
- rowspan 设置单元格垂直合并，设置值是数值



表格相关样式属性

- border-collapse 设置表格的边线合并，如：border-collapse:collapse;
- border='1'  可以设置table的边框大小
- text-align  可以设置对齐方式:  left  right  center










**总结:**

* 在网页中, 表格用一般用 table 标签来做
* 表格中分为 行 和 列
* 表格中的行为 tr 标签
* 表格中的列为 td 标签
  * 其中每一列都可以有一个标题, 我们可以使用 th 标签

```
<table>
    <tr>
        <th>标题一</th>
        <th>标题二</th>
        <th>标题三</th>
        <th>标题四</th>
    </tr>
    <tr>
        <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>4</td>
    </tr>
</table>
```

显示效果:

![QQ截图20180507131803](images/QQ截图20180507131803.png)






# 六. CSS属性进阶

## 1.文本常用样式属性进阶：

- text-align 设置文字水平对齐方式，如text-align:center 设置文字水平居中
- text-indent 设置文字首行缩进，如：text-indent:32px; 设置文字首行缩进32px


```
CSS部分: 
<style>
    .box {
        width:80px;
        height:30px;
        background: pink;
        text-align: center;
    }
    .pbox {
    	/* css里面默认的字体大小是16px */
    	font-size: 20px;
   	 	text-indent: 32px;
    }
</style>

HTML部分:
<div class="box">
    <p>
    	你好世界
    </p>
</div>
<p class="pbox">
    大头儿子小头爸爸
    一对好朋友 快乐父子俩
    儿子的头大手儿小
    爸爸的头小手儿很大
    大手牵小手
    走路不怕滑
    走呀走呀走 走 走
    转眼儿子就长大
    转眼儿子就长大
</p>
```



## 2. display属性

>  作用:  第一个决定了当前元素是否应该显示,    第二个决定了当前元素应该以什么类型显示

> display 属性规定元素应该生成的框的类型。
>
> display 的默认属性值是 inline, 此元素会被显示为内联元素

display属性是用来设置元素的类型及隐藏的，常用的属性有：

> * none   元素隐藏且不占位置
> * block  此元素会被显示为块元素
> * inline 此元素会被显示为内联元素
> * inline-block 行内块元素 ( 了解 )

```html
CSS部分: 
<style>
    div {
        display: inline;  
    }
    
    a {
        display: block;
    }
    
    .pbox {
        width: 200px;
        height: 200px;
        background: pink;
        display: none;
    }
</style>

HTML部分:
<div>
    <div>我是要成为海贼王的男人</div>
    <div>海贼王下面的div</div>
    
    <a href="#">这是第一个链接</a>
    <a href="#">这是第二个链接</a>
    
    <p class="pbox" style="display:block">
        葫芦娃 葫芦娃 一根藤上七朵花 小小树藤是我家 啦啦啦啦 叮当当咚咚当当　浇不大 叮当当咚咚当当 是我家 啦啦啦啦
    </p>
</div>
```



补充:   ( 了解 )

font:  

> font: 样式属性是一个集合, 可以吧关于 font 的都放到这个属性里面:

```
使用方法:

<style>
	div {
       font:  bold italic 18px/20px  arial; 
	}
</style>


HTML部分:
<div>这是div里面的文字</div>
```

> 其中:    arial 是一种字体,  和 微软雅黑一样.
>
> ​             font-size 和 font-family 的值是必需的。



> - font-style       定义字体的风格  
>   * normal:   正常
>   * italic:       浏览器会显示一个2斜体的字体样式。
> - font-variant     能把字体变小一号并且全大写显示  small-caps  变小一号并且全大写显示 normal 正常
> - font-weight    是否加粗  bold 是加粗  normal 正常
> - font-size/line-height      字体大小  /   行高大小
> - font-family                字体类型









## 3.  CSS元素溢出 

![42a98226cffc1e17080ccd1a4190f603738de96e](images/42a98226cffc1e17080ccd1a4190f603738de96e.jpg)

当子元素的尺寸超过父元素的尺寸时，需要设置父元素显示溢出的子元素的方式，设置的方法是通过overflow属性来设置。

overflow的设置项：

1、visible 默认值。内容不会被修剪，会呈现在元素框之外。  

2、hidden 内容会被修剪，并且其余内容是不可见的。

3、scroll 内容会被修剪，但是浏览器会显示滚动条以便查看其余的内容。

4、auto 如果内容被修剪，则浏览器会显示滚动条以便查看其余的内容。

```html
CSS部分: 
<style>
    div {
        width:100px;
        height:100px;
        overflow: auto;
    }
</style>

HTML部分:
<div>
	格叽格叽~
    <br><br>
    格叽格叽~~
    <br><br>
    格叽~格叽~~
    <br><br>
</div>
```



# 总结学习目标:

- 能熟练使用相对地址、绝对地址
- 熟悉overflow的设置项
- 理解css盒子模型
- 掌握html<form>标签定义表单区域
- 掌握<form>标签action属性、method属性
- 掌握<label>为表单元素定义文字标注
- 掌握<input>标签定义通用的表单元素:type属性、value属性、name属性
- 掌握<textarea>标签定义多行文本输入框
- 掌握<select>标签定义下拉表单元素
- 掌握<option>标签与<select>标签配合定义下拉表单元素中的选项



# 学习目标:

* 掌握定位元素的偏移
* 握定位元素层级
* 掌握定位元素特性
* 熟悉css权重的等级



# 七. 定位

![timg (2)](images/timg (2).jpg)

> 把某一个标签,  安置到某一个位置去,  这个过程称为定位.

## 1.  文档流概念( 了解 ) 

> 文档流，是指盒子按照 HTML 标签编写的顺序依次从上到下，从左到右排列，块元素占一行，行内元素在一行之内从左到右排列，先写的先排列，后写的排在后面，每个盒子都占据自己的位置。



## 2. 定位分类:  

我们可以使用 CSS 的 position 属性来设置元素的定位类型，position 的设置项如下：

* static  默认值.  没有定位:   元素出现在正常的流中(忽略top, bottom, left, right 或者 z-index 声明)

- relative 生成相对定位元素，一般是将父级设置相对定位，子级设置绝对定位，子级就以父级作为参照来定位，否则子级相对于body来定位。

- absolute:  生成绝对定位元素，元素脱离文档流，不占据文档流的位置，可以理解为漂浮在文档流的上方，相对于上一个设置了定位的父级元素来进行定位，如果找不到，则相对于浏览器窗口进行定位。

- fixed:  生成固定定位的元素，相对于浏览器窗口进行定位。

  元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。



**定位元素的偏移** 

> 定位的元素还需要用left、right、top或者bottom来设置相对于参照元素的偏移值。



### 1. 相对定位: 

> 相对定位是相对于该元素在文档流中的原始位置,即以自己原始位置为参照物. 有趣的是: 即使设置了元素的相对定位以及偏移值, 元素还占有原来的位置, 即占据文档流的空间.**对象遵循正常文档流**, 但依据 top,  left, right,  bottom等属性在正常文档流中偏移位置. 而其层叠通过 z-index 属性定义

> 注意:  position: relative  的主要用法是:  方便绝对定位元素找到参照物.

​	

```html
CSS部分: 
<style>
    .con {
        width:300px;
        height:300px;
        border:1px solid black;
        margin:0px auto;
    }

    .con div {
        width:200px;
        height:70px;
        margin:10px;
    }

    .box01 {
        background:lightgreen;
        /* 设置相对定位 */
        position:relative;
        left:50px;
        top:50px;
    }

    .box02 {
    	background: lightskyblue
    }

    .box03 {
    	background: lightpink;
    }
</style>


HTML部分:
<!-- .con>.box01+.box02+.box03 -->
<div class="con">
    <div class="box01">1</div>
    <div class="box02">2</div>
    <div class="box03">3</div>
</div>
```



### 2.  绝对定位: 

> 定义: 设置为绝对定位的元素框从文档流完全删除, 并相对于最近的已定位祖先元素定位, 如果元素没有已定位的祖先元素,那么他的位置相对于最初的包含块( 即body元素 ).  元素原先在正常文档流中所占的空间会关闭, 就好像该元素原来不存在一样.  元素定位后生成一个块级框, 而不论原来它在正常流中生成何种类型的框.
>
> 重点:  如果父级设置了 position 属性, 例如: position: relative,  那么子元素就会以父级的左上角为原点进行定位. 这样能很好的解决自适应网站的标签偏离问题,  即父级为自适应, 那我子元素就设置position:absolute; 父元素设置position: relative; 然后top, bottom, right, left 用百分比宽度表示.
>
> 总结:  参照物用相对定位, 子元素用绝对定位, 并且保证相对定位参照物不会偏移即可.

```html
<style>
    .con{
        width:300px;
        height:300px;
        border:1px solid black;
        margin:0px auto;
        /* 父级设置为相对定位，不设置偏移，子级就可以以它为参照做绝对定位 */
        position: relative;
        /* 设置父级的溢出隐藏 */
        overflow: hidden;
    }

    .con div{
        width:200px;
        height:70px;
        margin:10px;
    }

    .box01{
        background:lightgreen;
        /* 设置绝对定位 */
        position:absolute;
        left:131px;
        top:50px;
    }

    .box02{
    	background: lightskyblue
    }

    .box03{
    	background: lightpink;
    }
</style>


HTML部分:
<!-- .con>.box01+.box02+.box03 -->
<div class="con">
    <div class="box01">1</div>
    <div class="box02">2</div>
    <div class="box03">3</div>
</div>
```



### 3. 固定定位

> fixed:  对象脱离正常文档流, 使用 top,   right,  bottom,  left等属性以窗口为参照点进行定位, 当出现滚动条时, 对象不会随着滚动. 
>
> 而其层叠通过 z-index 属性定义. 
>
> 注意点: 一个元素若设置了 position: absolute |  fixed;  则该元素就不能设置 float.  这是一个常识性知识点, 因为这是两个不同的流, 一个是浮动流,  另一个是 定位流.  但是 relative 却可以. 因为它原本所占的空间仍然占据文档流.
>
> 理论上, 被设置为 fixed 的元素会被定位于浏览器敞口的一个指定坐标, 不论窗口是否滚动, 他都会固定在这个位置.

```html
<style>
    .con{
        width:300px;
        height:300px;
        border:1px solid black;
        margin:0px auto;
    }

    .con div{
        width:200px;
        height:70px;
        margin:10px;
    }

    .box01{
        background:lightgreen;
        /* 设置固定定位 */
        position:fixed;
        right:131px;
        bottom:50px;
    }

    .box02{
    	background: lightskyblue
    }

    .box03{
    	background: lightpink;
    }
</style>

HTML部分:
<!-- .con>.box01+.box02+.box03 -->
<div class="con">
    <div class="box01">1</div>
    <div class="box02">2</div>
    <div class="box03">3</div>
</div>
```





## 3.  元素层级

> 绝对定位元素是浮动在正常的文档流之上的，可以用 z-index 属性来设置元素的层级

例如:

![timg](images/timg.jpg)

伪代码如下:2

```
.box01{
    ......
    position:absolute;  /* 设置了绝对定位 */
    left:200px;         /* 相对于参照元素左边向右偏移200px */
    top:100px;          /* 相对于参照元素顶部向下偏移100px */
    z-index:10          /* 将元素层级设置为10 */
}
```

```html
CSS部分: 
<style>
    .con{
        width:300px;
        height:300px;
        border:1px solid black;
        margin:0px auto;
        position: relative;
    }

    .con div{
        width:200px;
        height:70px;
        margin:10px;
        position:absolute;
    }

    .box01{
        background:lightgreen;
        left:0px;
        top:0px;

        /* 设置定位元素的层级 */
        z-index:6;
    }

    .box02{
        background: lightskyblue;
        left:30px;
        top:30px;
        z-index:7;
    }
    .box03{
        background: lightpink;
        left:60px;
        top:60px;
        z-index:8;
    }
</style>

HTML部分: 
<!-- .con>.box01+.box02+.box03 -->
<div class="con">
    <!-- 如果不设置z-index属性，定位元素的层级安装代码书写的顺序，先写的排列在下面，后写的排列在上面 -->
    <div class="box01">1</div>
    <div class="box02">2</div>
    <div class="box03">3</div>
</div>
```



## 4 . 练习:  用固定定位创建弹窗

![QQ截图20180514095834](images/QQ截图20180514095834.png)

```html
<style>
    .pop{
        width:500px;
        height:300px;
        border:1px solid black;
        background:white;
        position: fixed;

        /* 弹框水平垂直居中的写法： */
        left:50%;
        top:50%;
        margin-left:-251px;
        margin-top:-151px;
        /* 设置弹框的层级,设置比较大的值，盖住其他所有的元素*/
        z-index:9999;
    }
    .pop h3{
        margin:5px;
        background: lightskyblue;
        line-height:40px;
    }

    .mask{
        position:fixed;
        left:0px;
        top:0px;
        width:100%;
        height:100%;
        background:black;
        z-index:9998;

        /* 设置背景的透明度 */
        opacity:0.3;
        /* 透明度兼容写法，兼容IE */
        filter:alpha(opacity=30);

    }

    /* 设置pop_con的隐藏，可以同时将弹框和背景隐藏起来 */
    .pop_con{
        display:none;
    }  
</style>

HTML部分:
<h1>网页内容</h1>
<div class="pop_con" style="display:block">
    <div class="pop">
        <h3>弹框标题</h3>
        <p>弹框的文字内容</p>
    </div>
    <div class="mask"></div>
</div>
```





# 八. 页面嵌套

![timg (1)](images/timg (1).jpg)

> 在一个页面中可以开一个局部的窗口，嵌入另外一个页面
>
> 制作这样的功能我们一般使用: iframe 标签来实现

```
使用方法: 

<iframe src="" frameborder="">

</iframe>
```

> * src:  设置另一个网页的地址
> * frameborder: 设置这个局部窗口边框的粗细



**提升: **

`iframe` 可以和 `a` 标签搭配使用, 呈现切换/的效果:

>  我们知道 `a` 标签有 target 属性:
>
> target="_blank" :  新开一个浏览器窗口显示链接的页面

如果 target 的值和 iframe 的 name 值保持相同, 则 a 标签切换后的 href 将作用到 iframe 的 src 上:

```
<a href="001.html" target="name">001页面</a>
<a href="002.html" target="name">002页面</a>
<a href="003.html" target="name">003页面</a>

<iframe src="001.html" frameborder="0" name="name"></iframe>
```



# 九.  元素居中显示技巧

## 1. 居中显示:

![QQ截图20180514092511](images/QQ截图20180514092511.png)

想要使某个元素能够居中显示, 需要设置其 margin 属性为:  0px  auto:

```
CSS部分:
<style>
.box{
    width: 300px; 
    height: 300px;
    background: gold;
    margin:0px auto;
}
</style>

HTML部分: 
<div class="box"></div>
```

总结: 

* 如果想要某个元素居中, 则需要设置他的 margin :  0px  auto;  
* 多个元素想要居中, 则每个单独的元素都需要设置该属性.
* margin:  0px auto;      =====>   margin: 0px auto  0px  auto;  (上, 右, 下,  左)





# 十.  CSS权重值计算  

什么是权重值: 

例子:    **根据分数, 决定排名**

> 小明的分数:   总分( 550 )
>
> * 英语:  100
> * 数学:  130
> * 语文:  90
> * 理综:  230
>
> 小红的分数:   总分 ( 530 )
>
> - 英语:  110
> - 数学:  120
> - 语文:  100
> - 理综:  200
>
> 因为 小明的分数  >  小红的分数 ,   所以 小明的排名**高于**小红的排名



> 我们上面说的各个学科, 其实就相当于各个选择器,  各学科有分数, 各选择器也有分数, 分数相加最高的 显示在最上面, 覆盖掉分数低的.  各个选择器的分数就是权重.





## 1.权重了解

* 内联样式的权重值最高:  1000       (内联: 写在标签上的样式)
* 标签选择器的权重值为最低:  1   
* 类选择器的权重值为: 10      ( 了解 )
* 伪类选择器权重值为:  10    ( 了解 )
* id 选择器的权重值为:  100

```html
CSS部分:
<style>
    /* 权重值：1 */
    div{
        color:red;
    }

    /* 权重值：1+10+10+1=22 */
    body .con .box h3{
        color: blue;
    }

    /* 权重值：10+10+1=21 */
    .con .box h3{
        color:red;
    }
</style>

HTML部分:
<!-- style的权重值：1000 -->
<div style="color:blue">这是一个div</div>
<div class="con">
    <div class="box">
        <h3>这是一个h3标签</h3>
    </div>
</div>
```

```

```







# 十一.  Photoshop

## 1. photoshop的使用  

### 1)  什么是 photoshop  ?

> Adobe Photoshop，简称 “PS”，是由 Adobe Systems 开发和发行的**图像处理软件**。
>
> Photoshop 主要处理以像素所构成的**数字图像**。使用其众多的编修与绘图工具，可以有效地进行**图片编辑**工作。PS 有很多功能，在图像、图形、文字、视频、出版等各方面都有涉及。



### 2)  我们这里使用 PS 来辅助测量和取色

图片预览的方法: 

* 图片缩放
* 图片平移



尺寸测量方法:

* 设置单位
* 矩形框测量,   调整矩形框
* 文字大小的测量



取色方法: 

* 取色工具
* 前景色按钮



CSS 颜色表示法:

CSS 颜色值主要有三种表示法: 

* 颜色名表示, 比如 : red 红色,   pink  金色;
* 16 进制数值表示,  比如: #ff0000 表示红色  

