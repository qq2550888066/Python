# 学习目标:

* 了解html的基本结构
* 掌握标题标签:`<h1></h1>`
* 掌握段落标签:`<p></p>`
* 掌握通用块标签:`<div></div>`
* 掌握图片标签:`<img src="”alt=""/>`
* 掌握超链接标签:`<a herf=““></a>`
* 掌握行内容器标签:`<span></span>`
* 掌握换行标签:`<br>`
* 掌握html注释:`<!-- -->`
* 掌握css的定义方法
* 掌握css引入页面的方式:内联式、嵌入式、外链式
* 掌握类选择器通过类名选择元素
* 掌握css常用布局样式属性:width、height、background、border等
* 掌握css常用文本样式属性:color、font-size、font-weight等





# 一. 了解前端

## 1. 什么是前端

前端即网站前台部分，运行在PC端，移动端等浏览器上展现给用户浏览的网页。随着互联网技术的发展，HTML5，CSS3，前端框架的应用，跨平台响应式网页设计能够适应各种屏幕分辨率，完美的动效设计，给用户带来极高的用户体验。 



## 2. 前端开发概述

从软件分类来说:    (根据使用的目的不同)  

- 系统软件
- 应用软件

从软件信息存储位置的不同:

- 单机软件
  - 软件和数据都存储在客户端
- C/S架构软件      Client  /  Server
  - 软件程序和数据一部分存在客户端,一部分存在服务器端
- B/S架构软件      Browser / Server
  - 软件程序和数据全部存在服务器端

前端开发也叫作web前端开发, 是为B/S架构的软件提供界面解决方案的.





## 3  核心技术

> 这三个是前端开发中最基本也是最必须的三个技能。前端的开发中，在页面的布局时， HTML将元素进行定义，CSS对展示的元素进行定位，再通过JavaScript实现相应的效果和交互。虽然表面看起来很简单，但这里面需要掌握的东西绝对不会少。在进行开发前，需要对这些概念弄清楚、弄明白，这样在开发的过程中才会得心应手。



### Html

指的是**超文本标记语言** (Hyper Text Markup Language)，这个也是我们网页最常用普通的语言了，经历了多个版本的发展，已经发展到5.0版了, 即HTML5。



### Css

级联样式表（Cascading Style Sheet）简称“CSS”，通常又称为“风格样式表（Style Sheet）”，它是用来进行网页风格设计的。比如，如果想让链接字未点击时是蓝色的，当鼠标移上去后字变成红色的且有下划线，这就是一种风格。通过设立样式表，可以统一地控制HTML中各标志的显示属性。级联样式表可以使人更能有效地控制网页外观。使用级联样式表，可以扩充精确指定网页元素位置，外观以及创建特殊效果的能力。



### JavaScript

JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言，最早是在HTML（标准通用标记语言下的一个应用）网页上使用，用来给HTML网页增加动态功能。



## 3. 前端开发环境搭建

### 1)  vscode了解 

Visual Studio Code 是微软推出的跨平台编辑器。它采用经典的VS的UI布局，功能强大，扩展性很强。支持多种语言开发,只需要安装对应的插件即可. 我们学习前端过程中主要使用它来敲代码. 我们前端常用的IDE(集成化开发环境)选择很多, 例如: vscode,  hbuilder, webstorm, sublime等.  

vscode官网:   https://code.visualstudio.com

IDE: 集成开发环境



**vscode插件的安装:**

**1.view in browser:**

能够让我们所写的代码运行在浏览器上.

**2.Beautify**:

能够使我们写的代码变得漂亮点 

**3.Auto Close Tag:**

自动添加 HTML 关闭标签

**4.Color Highlight:**

颜色高亮

**5.HTML CSS Support:**

html  css 支持插件

**6.Preview on Web Server:**

使我们写的网页可以通过本地服务器打开

vscode的自动保存设置:   打开左上角的 文件 ----->  选择自动保存, 如果不选择自动保存,则只能够手动保存后程序才能运行.



### 2)  chrome浏览器

前端的开发工作主要是在vscode等编辑器上进行的, 但是代码的调试主要是在浏览器上, 所以我们给大家推荐chrome浏览器,  用于查看和调试前端代码.



##本章总结:

* 前端的三大部分:  HTML   CSS   JS
* 我们使用的编译器是: vscode  其他的还有: webstorm/ hbuilder/ sublime等
* 这一章节纯属了解, 不需要记忆
* 这章就是带你玩的, 是不是很轻松,是不是很愉快, 好好学, 后面的更愉快~~~~



# 二. HTML

## 1. 了解HTML

我们可以通过查看源代码的形式, 看到制作出来的网页

通过仔细观察网页源代码我们可以知道:   制作网页的语言是用 "<"  ">"  括起来的.  有些是成对出现,有些不是 ----->   我们一般称这样用尖括号括起来的语言为 HTML



HTML 是 Hyper Text Markup Language 的首字母简写, 意思是超文本标记语言, 超文本指的是超链接, 标记指的是标签, 是一种用来制作网页的语言, 这种语言由一个个的标签组成, 用这种语言制作的文件保存的是一个文本文件, 文件的扩展名为 .html 或者 .htm





## 2. HTML文档的基本结构

html文件的基本结构为:

```html
<!DOCTYPE html>  <!--html的文档声明,声明当前html文档的版本-->
<html>           <!--根标签: html开始标签 -->
    <head>       <!--html标签中的第一个子标签: head开始标签-->
    	<meta charset="UTF-8">    <!--单个标签meta: 主要用于当前文档设置, 这里设置的是文档的编码格式 utf-8-->
    	<title>Document</title>   <!--title标签: 主要用于设置当前文档标题-->
    </head>      <!--html标签中的第一个子标签: head结束标签-->
    <body>       <!--html标签中的第二个子标签: body开始标签-->
    
    </body>      <!--html标签中的第二个子标签: body结束标签-->
</html>          <!--根标签: html结束标签 -->
```

**注意:**  

>  html语言中注释的写法:  <!-- 注释的内容 -->
>
> 快捷键:  ctrl + /                     取消注释:   ctrl  +  /

**说明:**

* 基本上所有的html文件都是按照这样的格式作为模板进行开发.
* head标签的主要作用:
  * 网页的设置
  * 资源的引用
* head标签中的内容一般不会显示在网页上.
* body中的内容通常用于网页显示





##3. 快速创建HTML文档

我们可以新建一个.html文件, 在文件中快速创建基本标签: 

快速创建的方法是:   在文件中敲一个 " ! " 然后按  tab 键  即可: 

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    浙江温州浙江温州 江南皮革厂倒闭了
    浙江温州最大皮革厂 江南皮革厂倒闭了
    王八蛋王八蛋黄鹤老板 吃喝嫖赌吃喝嫖赌
    欠下了欠下了3.5个亿 带着他的小姨子跑了
    我们没有没有没有办法办法 拿着钱包抵工资工资
    原价都是100多200多300多的钱包 统统20块
    20块20块统统20块 统统统统统统20块
    黄鹤王八蛋王八蛋黄鹤 你不是你不是你不是人
    100多200多300多的钱包 统统20块统统20块
    黄鹤王八蛋王八蛋黄鹤 你不是你不是你不是人
    我们辛辛苦苦干了 辛辛苦苦给你给你干了大半年
    你你你不发不发工资工资 你还我还我血汗钱
    还我血汗钱
</body>
</html>
```

我们可以看到,这样就可以快速的创建一个基本的html文档了, 我们可以在这个文档中快速的编写代码

**说明:**

* lang="en":  声明这个网页的语言是英文, 如果是中文则为: lang="zh-CN",  主要是做统计使用, 国内网页一般不关心这个值.
*   第五行的主要作用是: 让网页在移动端观看时, 网页不缩放.
* 第六行的主要作用是: 如果网页在 IE 浏览器上观看, 让 IE 以最高版本显示网页





## 4. HTML标签

> 学习 HTML 语言就是学习标签的用法, HTML 标签有20多个, 学会这些标签的使用, 就基本上学会了 HTML的使用

###1. 认识标签:

在html语言中,  用尖括号括起来的部分, 我们成为标签.

### 2. 标签的了解:

- 成对的标签
- 单个的标签

>  无论是成对的标签还是单个的标签,都需要用 " < > " 括起来

例如: 

```html
 <!DOCTYPE html>  
<html lang="en">
<head>  
    <meta charset="utf-8">
    <title>我的主页</title>
</head>
<body>
    <ul>
        <li>
            <a href="#">这是个链接</a>
        </li>
    </ul>
    <hr>
    <img src="../day001/image.png" alt="">
</body>
</html>
```

由上图我们可以知道:  

* <html>     <head>     <body>    <title>    <ul>    <li>   <a>  这样的标签是成对的
* <meta>   <hr>   <img>  这样的标签是单个的



同时: 由上面的代码我们也可以获取到:  

标签是可以嵌套的:   例如  上面的代码中 html 标签, 嵌套了 head  标签和 body 标签.

body 标签又嵌套了 ul 标签, ul 标签嵌套了 li ,  li 嵌套了 a标签等等.

类似于这样标签中添加标签的写法,我们称之为标签的嵌套.



### 3. 标签的属性

有些标签内部有这样的设置: 

```html
<img src="../day001/image.png" alt="">  

<div class="box"></div>
```

>  其中 src=" "  和  alt=" " 这部分内容, 我们称之为当前标签的属性.

**说明:**

* 有些标签的属性是相同的, 有些标签的属性是不同的. 
* 通过标签的属性,我们可以给当前的标签设置不同的内容.  




总结: 

* 我们只需要知道标签的尖括号内部添加的设置是属性即可
* html 常用标签的属性我们在学习的过程中慢慢掌握.





### 4.  标签的分类

>  注意: 在前端中, 元素指的就是标签, 所以我们有时候说:  xx元素, 即指的是 xx标签

标签按照显示的不同, 可以分为两类:

* 块元素 (行元素):   ```h1----h6       p         div```
* 内联元素 (行内元素): ``` a       img     span```



**块元素的特点:**

* 单个块元素在浏览器中默认独占一行
* 两个块元素不能够在一行显示, 他们会自动换成两行显示
* 块元素可以设置宽高等属性.  

**内联元素:**

* 多个内联元素可以在一行显示
* 内联元素不能够设置宽高, 设置了也没有用, 不会显示出效果
* 内联元素的宽高由他们本身的内容多少来支撑, 内容多,宽高自动增加.




#### 常用的块元素标签:

**1. 标题标签**

> 表示文档的标题, 除了具有块元素基本特征之外, 还含有默认的外边距和字体大小

```
<h1>一级标题</h1>
<h2>二级标题</h2>
<h3>三级标题</h3>
<h4>四级标题</h4>
<h5>五级标题</h5>
<h6>六级标题</h6>
```



**2.段落标签:** 

> 表示文档中的一个文字段落, 除了具有块元素基本特征, 还含有默认的外边距

```
<p> 
    既然你诚心诚意的问了， 
    我们就大发慈悲的告诉你！ 
    为了防止世界被破坏， 
    为了守护世界的和平； 
    贯彻爱与真实的邪恶， 
    可爱又迷人的反派角色~~ 
    武藏！ 
    小次郎！ 
    我们是穿梭在银河的火箭队！白洞，白色的明天在等着我们！！ 
    就是这样~喵~~~~ 
</p>

段落标签中如果想要强制换行,需要使用<br>标签, 这个标签是个单个标签,所以只有一个.

另外在html中, 如果想要写大于号, 小于号, 或者空格等, 需要使用代码来实现, 这样更加优雅~
代码实现大于号:  &gt;
代码实现小于号:  &lt;
代码实现空格:    &nbsp;
```



**3. 通用块容器标签 div**

> 表示文档中一块内容, 具 有块元素基本特性, 没有其他默认样式

```
<div>这是一个div元素</div>
<div>这是第二个div元素</div>
<div>
    <h3>自我介绍</h3> 
    <p>
        姑娘貌美一枝花，才学素养人品佳。
        活泼开朗不八卦，头脑敏锐有想法。
        踏实奋进不做假，乐于求知肯深挖。
        舞文弄墨擅策划，慧心妙舌喜表达。
        交友广泛爱分享，微博日日落不下。
        四年深造象牙塔，学习实践两手抓。
        只待应届招聘季，我花开后百花杀。
    </p>
</div>
```





#### 常用内联元素标签

**1.超链接标签  a**

> 链接到另外一个网页, 具有内联元素基本特征, 默认文字蓝色, 有下划线 

```
<a href="02.html">第二个网页</a>
<a href="http://www.baidu.com">百度网站</a>
<a href="http://www.baidu.com"><img src="images/logo.png" alt=""></a>
<a href="#">默认链接</a>

<a href="http://www.itcast.cn">原来的窗口打开界面</a>
<a href="www.baidu.com" target="_blank">新窗口打开界面</a>
```

说明: 

* a 标签的 href 属性可以添加 #  号, 这个是缺省链接地址:


  * 不确定地址时, 我们可以临时使用 #  来占位,确定后替换即可
  * 如果想要跳转到当前页面的最上方时, 可以使用 # 
* a 标签有 target 属性
  * 如果不设置该属性, 在当前页面打开新页面
  * 如果设置该属性, 则会在新窗口中打开新页面




**2.通用内联容器标签  span**

> 具有内联元素基本特性, 没有其他默认样式

我们一般在文字段落的中间部分强调某一部分的时候调用span,添加样式,从而改变强调的部分的样式:

例如:   这是一段文字,其中**梅总**需要强调,所以我们可以使用span来完成强调的操作.

```
<p>这是一个段落文字, 段落文字中有<span>特殊标志或者样式</span>的文字</p>
```



**3.  图片标签  img** :   image

> 在网页中插入图片, 具有内联元素基本特性, 但是它支持宽高设置

```
<img src="images/pic.png" alt="图片">
```

说明:

* src属性主要是添加要展示的图片地址
* alt属性的作用: 
  * 图片加载失败时, 显示的提示信息
  * 搜索引擎在收录图片时, 根据这个属性值来收录图片
  * 制作无障碍网页, 方便盲人的读屏软件读取.





#### 特殊的一些标签:

空格:  在html中, 空格一般会用: `&nbsp;`表示

回车:   在html中回车换行一般用`<br>`表示

小于号( < ):  在html中一般用`&lt;`表示

大于号( > ):  在html中一般用`&gt;`表示

删除标签:  del  或者 ( s )

倾斜标签: em  或者  ( i )

下划线标签: ins    或者   ( u )

字体变粗:  strong  或者  b 

# 

**总结:**

* HTML 整体是由标签组成的, 各个标签的功能很多都是重复的
* 同学们学习标签用法的时候多多练习即可
* 标签整体分为:   块级标签  和  行内标签
  * 块级标签可以设置宽高值, 独占一行
  * 行内标签自动设置宽高值, 一行内可以有多个
  * 块级元素可以包含行内元素,行内元素不能包含块级元素.
  * **特殊情况, 需要记住:** p 标签不能嵌套 div  
* a 标签用于跳转(超链接)   [跳转网页, 跳转页面, 跳转文件等]
* 标题标签用于设置标题, 共有6级
  * div就是一个无色透明的容器,看不见,摸不到
* img标签主要用于设置图片
* p 标签就是paragraph(段落)   通常用于包裹段落
* span是一个行内元素通常用于p标签内部,个别文字设置时使用.









## 5. HTML布局

网页布局原理:

> 标签在网页中会显示成一个个的方块,先按照行的方式, 把网页划分为多个行, 再到行里面划分列, 也就是说在表示行的标签中在嵌套标签来表示列, 标签的嵌套产生叠加效果.

![QQ截图20180502143156](images/QQ截图20180502143156.png)

上图实例:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <!-- 外面的容器 -->
    <div>
        <!-- 第一行 -->
        <div>
            <h3>今日头条</h3>
            <a href="#">更多&gt;&gt;</a>
        </div>

        <!-- 第二行 -->
        <img src="images/banner.jpg" alt="banner">

        <!-- 第三行 -->
        <p> 人工智能（Artificial Intelligence），英文缩写为AI。它是研究、开发用于模拟、延伸和扩展人的		   智能的理论、方法、技术及应用系统的一门新的技术科学。人工智能是计算机科学的一个分支，它企图了解	        智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器			  人、语言识别、图像	识别、自然语言处理和专家系统等。
        </p>
    </div>
</body>
</html>
```





### 标签语义化

> 在布局中需要尽量使用带语义的标签, 使用带语义的标签的目的首先是为了让搜索引擎能更好的理解网页的结构,提高网站在搜索中的排名(也叫作SEO), 其次是方便代码的阅读和维护



带语义的标签:

* h1 ---- h6:  表示标题
* p:  表示段落
* img :  表示图片
* a:  表示链接



不带语义 的标签:

* div:  表示一个容器
* span:  表示行内的一块内容



所以我们要根据网页上显示的内容,  使用合适的标签, 可以优化之前的代码.



## 本章总结:

* 本章需要背诵的内容:   块级标签和行内标签的概念, 以及各自的标签

* 块级标签我们学习了三个:   div   h系列  p

* 行内标签我们学习了三个:   span   img   a

* html布局只是一个思想, 理解即可. 特殊标签也是了解即可,不需要记忆

* HTML文档的基本格式需要大家掌握, 创建方式需要背诵:  !  +  tab

* 空格:  `&nbsp;`   换行:   `<br>`   大于号:  `&gt;`  小于号:  `&lt;`需要背诵.否则作业无法完成

* 标签语义化, 标签的定义, 标签中属性的定义, 都是概念需要了解,不需要记忆.

  



# 三.  CSS介绍

> 为了让网页元素的样式更加的丰富, 也为了让网页的内容和样式能拆分开, CSS由此而诞生.  
>
> CSS是 Cascading  Style  Sheets 的首写字母缩写,意思是层叠样式表.  
>
> 有了CSS, html 中大部分表现样式的标签就废弃不用了, html只负责文档的结构和内容, 
>
> 表现形式完全交给CSS, 这样使得html文档变得更加简洁.



## 1. CSS基本语法

```
CSS使用格式:

选择器 {
	属性 : 值;
	属性 : 值;
    ...
}
```

说明:

* 选择器是将样式和页面元素关联起来的名称
* 属性名是希望设置的样式属性, 每个属性有一个或者多个值


* 属性和值之间用冒号隔开
* 一个属性和值与下一个属性和值之间用分号,  最后一个分号可以省略.

例如:

```css
div {
    width: 100px;
    height: 100px;
    background: gold;
}
```





## 2.  CSS引入方法

> CSS样式导入HTML中有三种方式

**1.内联式:**

> 通过标签的 style 属性, 在标签上直接写样式.

```
<div  style="width:100px; height:100px; background:red;">
	这是个div标签
</div>
```



**2. 嵌入式:**

> 通过 style 标签, 在网页上创建嵌入的样式表.

```
<head>
    <style type="text/css">
        div {
            width: 100px;
            height: 100px;
            background: red;
        }
    </style>
</head>
```



**3.外联式:**

```
<link rel="stylesheet" type="text/css" href="css/样式文件名.css">
```





## 3. CSS选择器

>  CSS选择器:  帮助我们找寻标签,  找到之后 添加样式



CSS 的四种基本选择器:

* 通用选择器   ( * )
* 标签选择器   ( 标签名 )
* 类选择器       ( class )
* id 选择器       (  id )



CSS 组合选择器: 

* 多元素选择器
* 后代选择器(层级)
* 子元素选择器
* 兄弟选择器



CSS 属性选择器:

* 属性选择器



### 3.1   基础选择器:

**1. 通用选择器**

> 通用选择器, 匹配任何元素:

```
使用格式:

* {
    属性名:  值;
    属性名:  值;
    ...
}
```

例如: 

```css
* {
    margin: 0px;
    padding: 0px;
}
```

> 有些标签自动会增加一些内边距和外边距等样式, 我们可以使用这个选择器把默认的都给去掉



**2.标签选择器**

> 标签选择器, 此种选择器影响范围大,  一般用来做一些通用设置,  或用在层级选择器中.

```
通用格式:

标签名 {
    属性名: 值;
    ...
}
```

例如:

```html
CSS部分:
<style>
    div {
        color: red;
    }

    p {
        font-size: 18px;
    }
</style>


HTML部分:
<div>这里是html部分</div>
<p>html区域的p标签</p>
```

> 一旦使用标签选择器,则当前页面上的所有该标签全部都有该样式. 这一点需要注意



**3.类选择器**

> 通过类名来选择元素, 一个类可应用于多个元素, 一个元素上也可以使用多个类
>
> 应用灵活, 可复用, 是css中应用最多的一种选择器

```
常见格式:

.类名 {
    属性名: 值;
    ...
}
```

举例:

```html
CSS部分:
<style>
    .blue {
        color: blue;
    }
    .header {
        font-size: 19px;
    }
    .box {
        color:orange;
    }
    /* 这是CSS注释的写法,可以作为单行注释,也可以作为多行注释 */
    /* 针对下面的代码, 如果我们想单独选中div, 则可以这样写: */
    div.blue {
        /*文字变为斜体*/
        font-style: italic;
    }
</style>

HTML部分:
<div>这是div标签</div>
<div class="blue">这个标签的字体颜色会变成蓝色,是因为class选择器</div>
<p class="blue">这是div下面的p标签,也会变成蓝色,因为用的是同样的选择器,名字也一样</p>
<h3 class="blue header box">这个标签有好多个class类名, 则都会加载不同类名下面的样式, 形成重叠效果</h3>
<p class="header">这个标签的类名和上面的有一样的,所以上面的header样式也会加载在这个标签上</p>
```



**4.  id选择器**

> 通过 id 名来选择元素，元素的 id 名称不能重复，所以一个样式设置项只能对应于页面上一个元素，不能复用，id 名一般给程序使用，所以不推荐使用id作为选择器。

```
使用格式:

#ID名 {
    属性名: 值
}
```



举例：

```html
CSS部分: 
<style>
    #box {
        color:red
    } 
    #box1 {
        background:blue;
    }
</style>


HTML部分:
<p id="box">这是第一个段落标签</p>   
<p id="box1">这是第二个段落标签</p> 
<p>这是第三个段落标签</p> 
```





### 3.2   组合选择器

**1. 多元素选择器**

> 同时匹配所有 E元素 和 F元素,   E和F之间用逗号分隔:

```
使用格式: 

E,F {
    属性名: 值;
    属性名: 值;
    ...
}
```

例如: 

```html
CSS部分:
<style>
    .box,p {
        color: red;
    }
</style>



HTML部分:
<div class="box">这是一个美丽的div</div>
<p>美丽div下面的段落标签p</p>
```





**2.后代选择器:**

> 主要应用在标签嵌套的结构中,层级选择器, 是结合上面两种选择器来写的选择器, 它可与标签选择器结合使用,减少命名,同时也可以通过层级, 限制样式的作用范围

```
使用方式:

E  F {
    属性名: 值;
    属性名: 值;
    ...
}
```





例如:

```html
CSS部分:
<style>
    .con {
        width: 100px;
        height: 100px;
    }
    div p {
        color: red;
    }
    .con .pbox {
        color: pink;
    }
</style>


HTML部分:
<div class="con">
	<p>这里是span标签的内容</p>
	<div class="pink">
        这里是div中的div标签
        <p class="pbox">粉红色啊粉红色</p>
    </div>
</div>
```

> 层级选择器: 按照标签的层级来匹配对应的标签





**3.  子代选择器**

> E > F      匹配所有 E元素的 子元素F

```
使用格式: 

E > F {
    属性名: 值;
    属性名: 值;
    ...
}
```

例如: 

```html
CSS部分:
<style>

    div>p {
        color: red;
    }
    
    div>div{
        font-size:30px;
    }
    
    /* 选中了a标签, 但是div内部的内容是没有改变的,说明可以确切的选中某一个 */ 
    .box>a {
        background: pink;
    }

</style>


HTML部分:
<div class="con">
	<p>这是div元素的子集p元素</p>
	<div class="box">
		div标签的内容部分
		<a href="#">第二个div的子集:a元素</a>
	</div>
</div>
```



**4. 毗邻选择器**

> 匹配所有紧随 E元素 之后的同级元素F (向下寻找)

```
使用格式: 

E + F {
 	属性名: 值;
 	属性名: 值;
 	...
}
```

例如:

```html
CSS部分:
<style>
	.box + div {
        color: red;
	}
</style>


HTML部分:
<div>第一个div,啦啦啦~</div>
<div class="box">第二个div,啦啦啦~</div>
<div>第三个div,啦啦啦~</div>
```





### 3. 3   属性选择器

**1. 第一种属性选择器的使用**

```
使用方法: 

[attr] {
    属性名: 值;
    属性名: 值;
    ...
}
[title] {
    
}
```

例如: 

```html
CSS部分:
<style>
    [name] {
        color: red;
    }
</style>

HTML部分: 
<div> hello1 </div>
<div  name="peter"> hello1 </div>
<div title="haha"> hello1 </div>
<div> hello1 </div>
```



**2. 第二种属性选择器的使用**

```
使用方法:

E[attr=val] {
    属性名: 值;
    属性名: 值;
    ...
}
```

例如:

```html
CSS部分:
<style>
    [name="peter"] {
        color: red;
    }
</style>

HTML部分: 
<div> hello1 </div>
<div  name="peter"> hello1 </div>
<div  name="bill"> hello1 </div>
<div> hello1 </div>
```









### 3.4 伪类选择器

**1. 伪类选择器**

> 常用的伪类选择器有hover，表示鼠标悬浮在元素上时的状态。

```html
CSS部分: 
<style>
    .box1 {
        width:100px;
        height:100px;
        background:gold;
    }
    .box1:hover {
        width:300px;
    }
</style>


HTML部分: 
<div class="box1">别看村子不咋大呀， 有山有水有树林， 邻里相亲多和睦， 老少爷们也合群</div>


补充: 
#input:focus {
    outline: none;
    border: 2px solid red;
}
```



**总结:**

* CSS 选择器的主要目的是: 获取 HTML 元素, 获取到后给当前元素添加样式.
* CSS 选择器的种类非常多, 一般我们用不上, 把常用的学会即可. 
* 标签选择器尽量少用, 覆盖面巨大.  不利于我们样式的单独调整.
* class 类选择器是经常使用的选择器. 可以多多练习
* 层级选择器 一般配合类选择器或者其他的选择器一起使用.  常用来获取大容器里面没有明确定义类名的元素
* id 选择器偶尔使用, 使用它往往就是利用他的唯一性.   获取单个某个标签使用.
* 伪类选择器是需要设置特殊阶段的效果时, 添加的选择器, 知道即可

```html
<html>
    <head>
    <style type="text/css">
        a:link {color: red}         /* 未访问时的状态 */
        a:visited {color: orange}   /* 已访问过的状态 */
        a:hover {color: pink}       /* 鼠标移动到链接上时的状态 */
        a:active {color: yellow}    /* 鼠标按下去时的状态 */
    </style>
    </head>
    <body>
        <p>
            <b><a href="/index.html" target="_blank">这是一个链接。</a></b>
        </p>
        <p>
            <b>注释：</b>
            在 CSS 定义中，a:hover 必须位于 a:link 和 a:visited 之后，这样才能生效！
        </p>
        <p>
            <b>注释：</b>
            在 CSS 定义中，a:active 必须位于 a:hover 之后，这样才能生效！
        </p>
    </body>
</html>
```

注意嵌套规则: 

* 块级元素 可以包含内联元素或某些块级元素, 但是内联元素不能包含块级元素,它只能包含其他内联元素
* **有几个特殊的块级元素只能包含内联元素,不能包含块级元素.   如h1, h2, h3, h4, h5, h6, p**
* li 内可以包含 div
* 块级元素与块级元素并列 ,    内联元素与内联元素并列.

补充: (仅需要了解)

**初始化CSS (需要了解)**

为什么要初始化CSS？

​      建站老手都知道，这是为了考虑到浏览器的兼容问题，其实不同浏览器对有些标签的默认值是不同的，如果没对CSS初始化往往会出现浏览器之间的页面差异。当然，初始化样式会对SEO有一定的影响，但鱼和熊掌不可兼得，但力求影响最小的情况下初始化。

​      最简单的初始化方法就是： * {padding: 0; margin: 0;} 。有很多人也是这样写的。这确实很简单，但有人就会感到疑问：*号这样一个通用符在编写代码的时候是快，但如果网站很大，CSS样式表文件很大，这样写的话，他会把所有的标签都初始化一遍，这样就大大的加强了网站运行的负载，会使网站加载的时候需要很长一段时间。

​      写过css的都知道每个网页引进的css首先都需要初始化，而出名的css reset有YUI css reset（QQ、淘宝等都出现他的影子），业内用的最多的还有Erik Meyer’s CSS Reset。

​      CSS初始化是指重设浏览器的样式。不同的浏览器默认的样式可能不尽相同，所以开发时的第一件事可能就是如何把它们统一。如果没对CSS初始化往往会出现浏览器之间的页面差异。每次新开发网站或新网页时候通过初始化CSS样式的属性，为我们将用到的CSS或html标签更加方便准确，使得我们开发网页内容时更加方便简洁，同时减少CSS代码量，节约网页下载时间。

​    雅虎工程师提供的CSS初始化示例代码

​    body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,button,textarea,p,blockquote,th,td { margin:0; padding:0; }







## 4.  CSS进阶 

### 布局常用属性样式:

| 属性            | 作用                                 | 举例                                  |
| --------------- | ------------------------------------ | ------------------------------------- |
| width           | 设置元素(标签)的宽度                 | width: 200px;                         |
| height          | 设置元素(标签)的高度                 | height: 200px;                        |
| background      | 设置元素背景色或者背景图片(详看下面) | background: pink;                     |
| border          | 设置元素四周的边框                   | border: 1px solid pink;               |
| *border-top*    | *设置元素顶部边框*                   | *border-top: 1px solid/ dashed pink;* |
| *border-left*   | *设置元素左边边框*                   | *border-left: 1px solid pink;*        |
| *border-right*  | *设置元素右边边框*                   | *border-right: 1px solid pink;*       |
| *border-bottom* | *设置元素底部边框*                   | *border-bottom: 1px solid pink;*      |





### 文本常用样式属性:

|                 |                  |                                                          |
| --------------- | ---------------- | :------------------------------------------------------: |
| color           | 设置文字的颜色   |                       color:  red;                       |
| font-size       | 设置文字的大小   |                    font-size:  12px;                     |
| font-family     | 设置文字的字体   |       font-family: 'Microsoft  Yahei'; (微软雅黑)        |
| font-weight     | 设置文字是否加粗 |   font-weight: bold;     (bold:加粗     normal:  正常)   |
| line-height     | 设置文字的行高   | line-height: 24px;    (文字高度加上文字上下间距共计24px) |
| text-decoration | 设置文字的下划线 |           text-decoration:none;  (取消下划线)            |

**提示:样式中的注释**

```
/* 设置头部的样式 */
.header{
    width:960px;
    height:80px;
    background:gold;
}
```

![未标题-2](images/未标题-2.png)









### 浮动: (  float  )

> 我们有时候为了让一行能够显示多个元素, 会设置元素的float属性: 



浮动的表现 :

​	定义:  浮动的框可以向左或向右移动, 直到它的外边缘碰到包含框或另一个浮动框的边框为止.  由于浮动框不在文档的普通流中,所以文档的普通流中的浮动框之后的块框表现的就像浮动框不存在一样. (注意 这里是块框而不是内联元素; 浮动框只对它后面的元素造成影响 )

# 注意:  当初float 被设计的时候就是用来完成文本环绕的效果, 所以文本不会被挡住, 这是 float 的特性, 即 float 是一种不彻底的脱离文档流的方式.



```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .div1 {
            width: 100px;
            height: 100px;
            background-color: pink;
        }
        .div2 {
            width: 200px;
            height: 100px;
            background-color: blue;
        }
        .div3 {
            width: 100px;
            height: 200px;
            background-color: green;
        }
        .div4 {
            width: 200px;
            height: 200px;
            background-color: red;
        }
    </style>
</head>
<body>
    <div class="div1"></div>
    <div class="div2"></div>
    <div class="div3"></div>
    <div class="div4"></div>
</body>
</html>
```



**特别注意**

设置某一个元素为float 之后, 当前元素是否往前一个位置飘动,取决于上一个元素是否设置了float,如果设置了则飘动,如果没有设置,则还是在原来的位置, 只是飘起来, 不飘动.

如果一个容器中有两个子元素, 两个子元素都设置浮动浮起来之后,则容器会被压缩为一点.

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .box {
            width: 300px;
            background-color: pink;
        }
        .sub1 {
            width: 100px;
            height: 100px;
            background-color: limegreen;
            float: left;
        }
        .sub2 {
            width: 100px;
            height: 100px;
            background-color: olive;
            float: left;
        }
        .box2 {
            width: 400px;
            height: 30px;
            background-color: orangered;
        }
    </style>
</head>
<body>
    <div class="box">
        <div class="sub1"></div>
        <div class="sub2"></div>
    </div>
    <div class="box2"></div>
</body>
</html>
```



补充:

**浮动的框可以向左或向右移动，直到它的外边缘碰到包含框或另一个浮动框的边框为止。**

**由于浮动框不在文档的普通流中，所以文档的普通流中的块框表现得就像浮动框不存在一样。**

css 浮动: 

请看下图，当把框 1 向右浮动时，它脱离文档流并且向右移动，直到它的右边缘碰到包含框的右边缘：

![ct_css_positioning_floating_right_example](../../python%E5%89%8D%E7%AB%AF%E9%83%A8%E5%88%86/day01/images/ct_css_positioning_floating_right_example.gif)

再请看下图，当框 1 向左浮动时，它脱离文档流并且向左移动，直到它的左边缘碰到包含框的左边缘。因为它不再处于文档流中，所以它不占据空间，实际上覆盖住了框 2，使框 2 从视图中消失。

如果把所有三个框都向左移动，那么框 1 向左浮动直到碰到包含框，另外两个框向左浮动直到碰到前一个浮动框。

![ct_css_positioning_floating_left_example](../../python%E5%89%8D%E7%AB%AF%E9%83%A8%E5%88%86/day01/images/ct_css_positioning_floating_left_example.gif)

如下图所示，如果包含框太窄，无法容纳水平排列的三个浮动元素，那么其它浮动块向下移动，直到有足够的空间。如果浮动元素的高度不同，那么当它们向下移动时可能被其它浮动元素“卡住”：

![ct_css_positioning_floating_left_example_2](../../python%E5%89%8D%E7%AB%AF%E9%83%A8%E5%88%86/day01/images/ct_css_positioning_floating_left_example_2.gif)







# 5. CSS布局演示

通过样式,并且参照下图, 可以把之前写的布局作进一步的调整, 完成最终的布局效果:

![QQ截图20180502173847](images/QQ截图20180502173847.png)

参考文字: 

人工智能（Artificial Intelligence），英文缩写为AI。它是研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .box {
            width:285px;
            height: 310px;
            border-bottom: 1px solid #c8dcf2;
            border-top: 1px solid #c8dcf2;
        }
        .header {
            width:285px;
            height: 40px;
        }
        .header h3 {
            margin:0px;
            font-family: 'Microsoft Yahei';
            font-size: 16px;
            color: #172c45;
            line-height: 40px;
            float: left;
        }
        .header a {
            font-size: 12px;
            font-family: 'Microsoft Yahei';
            color: #172c45;
            text-decoration: none;
            float: right;
            line-height: 40px;
        }
        p {
            font-size: 12px;
            font-family: 'Microsoft Yahei';
            color: #737373;
            line-height: 20px;
            height:190px;
            width: 100%;
        }
        img {
            height:80px;
            width:100%;
        }
    </style>
</head>
<body>
    <div class="box">
        <div class="header">
            <h3>今日头条</h3>
            <a href="#">更多&gt;&gt;</a>
        </div>
        <img src="./images/banner.jpg" alt="banner">
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;人工智能（Artificial Intelligence），英文缩写为AI。它是研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。人工智能是计算机科学的一个分支，它企图了解智能的实质，并生产出一种新的能以人类智能相似的方式做出反应的智能机器，该领域的研究包括机器人、语言识别、图像识别、自然语言处理和专家系统等。
        </p>
    </div>
</body>
</html>
```



## 本章总结: 

* 本章中引入CSS的三种形式,需要背诵.
* 标签选择器的各种用法, 至少掌握基础和组合选择器,用的最多的是组合选择器,因此能背下来就都背下来. 要不然考试有点危险.
* CSS 的样式属性设置, 这个相对简单, 多看两遍就记住了, 这个必须会. 不要告诉我这个搞不定, 不然要什么自行车.
* 这一章的重点就是浮动, 说白了就是飘起来, 连这个都学不会, 那你以后可以考虑成为爬行动物, 没有飞的希望了. 这个是重点. 多看看,不行了问我!



# 总结学习目标:

- 了解html的基本结构
- 掌握标题标签:`<h1></h1>`
- 掌握段落标签:`<p></p>`
- 掌握通用块标签:`<div></div>`
- 掌握图片标签:`<img src="”alt=""/>`
- 掌握超链接标签:`<a herf=““></a>`
- 掌握行内容器标签:`<span></span>`
- 掌握换行标签:`<br>`
- 掌握html注释:`<!-- -->`
- 掌握css的定义方法
- 掌握css引入页面的方式:内联式、嵌入式、外链式
- 掌握类选择器通过类名选择元素
- 掌握css常用布局样式属性:width、height、background、border等
- 掌握css常用文本样式属性:color、font-size、font-weight等



# 四. 课后作业

请完成下面的案例: 

![练习001](images/练习001.jpg)

![练习002](images/练习002.jpg)

![练习003](images/练习003.jpg)

![练习004](images/练习004.jpg)

![练习005](images/练习005.jpg)



特别提示:  我把作业部分关于内边距的移到了第二天,所以这部分可以先当成没有内边距来进行书写.



