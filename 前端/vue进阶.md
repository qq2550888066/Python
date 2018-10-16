## 一.  ES6语法

> ES6 是 JavaScript 语言的新版本，它也可以叫做 ES2015，之前学习的 JavaScript 属于 ES5，ES6 在它的基础上增加了一些语法，ES6 是未来 JavaScript 的趋势，而且 vue 组件开发中会使用很多的ES6 的语法，所以掌握这些常用的 ES6 语法是必须的。

#### 声明 let 和 const

> let 和 const 是新增的声明变量的开头的关键字，在这之前，变量声明是用 var 关键字，这两个关键字和 var 的区别是，它们声明的变量没有预解析，let 和 const 的区别是，let 声明的是一般变量，const 申明的常量，不可修改。

##### let

```
使用格式:

let age = 20
```

>  age的值可以改变, 但是使用 let 定义的变量没有预解析功能



##### const

```
使用格式:

const age = 23
```

>  age的值不能够改变, 否则报错



案例:

```javascript
alert(iNum01) 			// 弹出undefined
// alert(iNum02); 		报错，let 关键字定义变量没有变量预解析
// alert(iNum03); 		报错，const 关键字定义变量没有变量预解析

var iNum01 = 6;
// 使用let关键字定义变量
let iNum02 = 12;
// 使用const关键字定义变量
const iNum03 = 24;

alert(iNum01); // 弹出6
alert(iNum02); // 弹出12
alert(iNum03); // 弹出24

iNum01 = 7;
iNum02 = 13;
//iNum03 = 25; 			// 报错,const 定义的变量不可修改,const 定义的变量是常量

alert(iNum01)
alert(iNum02); 
alert(iNum03);
```



#### 箭头函数

> 可以把箭头函数理解成匿名函数的第二种写法

```javascript
// 定义函数的一般方式
function fnRs(a,b){
    var rs = a + b;
    alert(rs);
}
fnRs(1,2);        


// 通过匿名函数赋值来定义函数
var fnRs = function(a,b){
    var rs = a + b;
    alert(rs);
}
fnRs(1,2);


// 通过箭头函数的写法定义
var fnRs = (a,b)=>{
    var rs = a + b;
    alert(rs);
}        
fnRs(1,2)

// 一个参数可以省略小括号
var fnRs2 = a =>{
    alert(a);
}
fnRs2('haha!');


// 箭头函数的作用，可以绑定对象中的this
var person = {
    name:'tom',
    age:18,
    showName:function(){
        setTimeout(()=>{
            alert(this.name);
        },1000)            
    }
}
person.showName();
```

案例:

```html
<head>
    <script src="./vue.js"></script>
</head>
<body>
    <div id="app">
        {{name}}
        <div @click="func">按钮</div>
        <div @click="fun1(10,11)">annana</div>
    </div>
    <script>
        var vm = new Vue({
            el:'#app',
            data:{
                name:'hello'
            },
            methods:{
                func:function(){
                    setTimeout(() => {
                        this.name = 'hello world' 
                    }, 3000);
                },
                fun1:(a,b)=>{
                    alert(a+b)
                }
            }
        })
    </script>
</body>
```



#### 模块导入 import 和导出 export

> javascript 之前是没有模块的功能的，之前做 js 模块化开发，是用的一些 js 库来模拟实现的，在 ES6中加入了模块的功能，和 python 语言一样，python 中一个文件就是一个模块，ES6 中，一个 js 文件就是一个模块，不同的是，js 文件中需要先导出( export )后，才能被其他 js 文件导入( import )

```
// model.js文件中导出
var person = {name:'tom',age:18}
export default {person}

// index.js文件夹中导入
import person from 'js/model.js'

// index.js中使用模块
person.name
person.age

/*
上面导出时使用了default关键字，如果不使用这个关键字，导入时需要加大括号：
import {person} from 'js/model.js'
*/
```

目前 ES6 的模块功能需要在服务器环境下才可以运行。



#### 对象的简写

javascript 对象在 ES6 中可以做一些简写形式，了解这些简写形式，才能方便我们读懂一些在javascript 代码中简写的对象。

```
let name = '李思';
let age = 18;

/*
var person = {
    name:name,
    age:age,
    showname:function(){
        alert(this.name);
    },
    showage:function(){
        alert(this.age);
    }
}
*/

// 简写成下面的形式
var person = {
    name,
    age,
    showname(){
      alert(this.name);
    },
    showage(){
      alert(this.age);
    }
}

person.showname();
person.showage();
```

####总结:

* import 和 export 我们在后面学习 vue 组件的时候会学习到
* 对象的简写大家知道就可以,一般不会这样使用
* 箭头函数偶尔会使用, 大家要学会使用 
* let  和  const 不是必须掌握的内容, 能掌握更好, 不能的话就全部写成 var 也是没有问题的.



## 二.  vue组件

> 组件(Component)是Vue.js最强大的功能之一。组件可以扩展 HTML 元素，封装可重用的代码。所有的 Vue 组件同时也都是 Vue 的实例，所以可接受相同的选项对象 (除了一些根级特有的选项) 并提供相同的生命周期钩子。

```
使用方法: 

Vue.component(组件名称, 组件的内容)

例如:
Vue.component('component',{
    template:'<div>这是div标签</div>'
})
```

#### 注册及使用组件

```html
<div id="example">
  <!--使用组件-->
  <my-component></my-component>
</div>


<script>
    // 注册一个组件：
    Vue.component('my-component', {
      template: '<div>A custom component!</div>'
    })
    new Vue({
      el: '#example'
    })
</script>
```



#### data 必须是函数

> 组件中的 data 是一个函数, vue 对象中的data是一个对象

> 组件就是 vue 的实例，所有 vue 实例中属性和方法，组件中也可以用，但是 data 属性必须是一个函数，因为组件会重复使用在多个地方，为了使用在多个地方的组件数据相对独立，data属性需要用一个函数来返回值。

```html
<div id="example-2">
  <!--使用组件-->
  <simple-counter></simple-counter>
  <simple-counter></simple-counter>
  <simple-counter></simple-counter>
</div>


<script>
    // 定义组件
    Vue.component('simpleCounter', {
      template: '<button v-on:click="counter += 1">{{ counter }}</button>',
      data: function () {
            return {
            counter: 0
          }
      }
    })
    new Vue({
      el: '#example-2'
    })
</script>
```



#### props传递数据

> 这个属性一般用来给组件传递值使用的

> 如果想给组件中传递参数，组件要显式地用 props 选项声明它预期的数据：

```html
<div id="app">
    <my-component name="zhangsan"></my-component>
</div>
<script>
    Vue.component('myComponent',{
        template:'<div>哈哈哈{{name}}</div>',
        props:['name']
    })
    var vm = new Vue({
        el:'#app'
    })
</script>
```

结果:

```
哈哈哈zhangsan
```







## 三. 单文件组件

> 将一个组件相关的 html 结构，css 样式，以及交互的 JavaScript 代码从 html 文件中剥离出来，合成一个文件，这种文件就是单文件组件，相当于一个组件具有了结构、表现和行为的完整功能，方便组件之间随意组合以及组件的重用，这种文件的扩展名为“.vue”，比如："menu.vue"。

#### 单文件组件代码结构

```vue
<template>
<!--使用template标签来定义html部分-->
    <div class="breadcrumb" @click="fnLight">
      当前位置：<span :class="{hot:isHot}">{{pos}}</span>
    </div>
</template>


<script>
// javascript要写成模块导出的形式：
export default {
  props:['pos'],
  name:'breadcrumb',
  data:function(){
      return {
          isHot:false
      }
  },
  methods:{
      fnLight:function(){
          this.isHot = !this.isHot;
      }
  }
}
</script>


<style scoped>
/* 样式中如果有scope关键字，表示这些样式是组件局部的，不会影响其他元素 */
.breadcrumb{
    width:90%;
    line-height:50px;
    border-bottom:1px solid #ddd;
    margin:0px auto;
}
.breadcrumb .hot{
    font-weight:bold;
    color:red;
    letter-spacing:2px;
}
</style>
```







## Vue组件开发自动化工具

#### windows终端操作

1、打开终端
在window开始的搜索框，输入cmd，回车；或者在开始上点右键，选择运行，输入cmd回车；或者在window窗口的地址栏上输入cmd，回车。

2、常用终端命令

```
// 查看文件夹内容
dir +回车

// 进入某个文件夹
cd 文件夹名 +回车

// 进入上一级文件夹
cd .. +回车 

// 切换到e盘
e: +回车

// 清除屏幕
cls +回车
```

#### Node.js

Node.js是一个新的后端(后台)语言，它的语法和JavaScript类似，所以可以说它是属于前端的后端语言，后端语言和前端语言的区别：

- 运行环境：后端语言一般运行在服务器端，前端语言运行在客户端的浏览器上
- 功能：后端语言可以操作文件，可以读写数据库，前端语言不能操作文件，不能读写数据库。

Node.js如果安装成功，可以查看Node.js的版本,在终端输入如下命令：

```
node -v
```

#### npm

npm是node.js的包管理器，安装了node.js同时会自动安装这个包管理器，可以npm命令来安装node.js的包。这个工具相当于python的pip管理器。

#### 安装vue的自动化工具

vue开发生态区提供了用node.js开发的自动化开发工具包，这个工具包可以帮我们编译单文件组件。

```
// 全局安装 vue-cli
npm install --global vue-cli
```



## 生成Vue单页面应用项目目录

#### 单页应用(SPA)

单页Web应用（single page web application，SPA），就是将系统所有的操作交互限定在一个web页面中。单页应用程序 (SPA) 是加载单个HTML页面，系统的不同功能通过加载不同功能组件的形式来切换，不同功能组件全部封装到了js文件中，这些文件在应用开始访问时就一起加载完，所以整个系统在切换不同功能时，页面的地址是不变的，系统切换可以做到局部刷新，也可以叫做无刷新，这么做的目的是为了给用户提供更加流畅的用户体验。

# 生成项目目录

使用vue自动化工具可以快速搭建单页应用项目目录。该工具为现代化的前端开发工作流提供了开箱即用的构建配置。只需几分钟即可创建并启动一个带热重载、保存时静态检查以及可用于生产环境的构建配置的项目：

```
// 生成一个基于 webpack 模板的新项目  my-project:项目名称
vue init webpack my-project

// 启动开发服务器 ctrl+c 停止服务
cd my-project
npm install
npm run dev
```

#### 项目目录结构说明

![project](images/project.jpg)
需要关注的是上面标注的三个目录：

- 文件夹1(src)，主开发目录，要开发的单文件组件全部在这个目录下
- 文件夹2(static)，静态资源目录，所有的css，js文件放在这个文件夹
- 文件夹3(dist)，项目打包发布文件夹，最后要上线单文件项目文件都在这个文件夹中

还有node_modules目录是node的包目录，config是配置目录，build是项目打包时依赖的目录。

#### 页面结构说明

![page_structrue](images/page_structrue.png)
整个项目是一个主文件index.html,index.html中会引入src文件夹中的main.js,main.js中会导入顶级单文件组件App.vue,App.vue中会通过组件嵌套或者路由来引用components文件夹中的其他单文件组件。





## 组件嵌套

将单文件组件组合在一起有两种方式，一种是嵌套方式，一种用路由的方式。嵌套的方式代码如下：

下图示中，假设组件A中要嵌入组件B

```
<template>

    // 在A组件中使用B组件
    <B_zujian></B_zujian>
</template>


<script>
// 先导入B组件，其中'@'表示src目录，组件后的vue扩展名可以省略
import B_zujian from '@/components/B_zjian'

export default{
    name:'A_zujian',
    data:function(){
        return {
            iNum:0
        }
    },
    // 接着在components属性选项中注册
    components:{
        B_zujian
    }
}


</script>
```



## 路由

可以通过路由的方式在一个组件中加载其他组件，要使用路由功能，需要在main.js中先导入路由的包,然后在组件对象中还需要包含它。

```
import router from './router'

new Vue({
    .....
    router
})
```

组件中通过路由标签来加载其他的路由

```
<!-- 路由标签 -->
<router-view></router-view>

<!-- 简写成下面一个标签的形式： -->
<router-view/>
```

路由标签里面加载哪个组件呢？在router文件中的index.js文件中设置

```
import Vue from 'vue'
import Router from 'vue-router'

// 导入对应组件 '@' 表示src文件夹
import MainList from '@/components/MainList'
import UserList from '@/components/UserList'
import UpDate from '@/components/UpDate'

// 使用路由模块的固定写法
Vue.use(Router)

// path为'/'表示路由默认加载的组件
// 这些路由默认设置的是App.vue中的路由标签加载的组件
export default new Router({
  routes: [
    {
      path: '/',
      name: 'MainList',
      component: MainList
    },
    {
      path: '/user',
      name: 'UserList',
      component: UserList
    },
    {
      path: '/update',
      name: 'UpDate',
      component: UpDate
    }
  ]
})
```

通过链接可以切换路由标签里面对应的组件，链接的地址是上面index.js文件中定义的path值，不过链接标签是"router-link",链接地址用'to'来定义：

```
<router-link to="/">股票信息</router-link>
<router-link to="/user">个人中心</router-link>
```

链接地址中可以传递参数，格式如下：

```
// name对应的是路由中定义的一个path对应的name属性
<router-link :to='{name:"UpDate",params:{code:item.code}}'>
```

有时候需要在组件的js中跳转页面，也就是改变路由，改变路由有下面这些方式：

```
// 当前页面重新加载
// -1指的是浏览器记录的上一步
this.$router.go('-1');

// 跳转到另外一个路由
this.$router.push({path:'/user'});

// 获取当前的路由地址
var sPath = this.$route.path;
```





## 数据请求及跨域

#### 数据请求

数据请求使用的是ajax，在vue中使用的axios.js，这个文件可以在index.html文件中引入，也可以作为模块导入，在main.js中导入这个模块，然后将它绑定在Vue类的原型上。

```
import axios from 'axios'
Vue.prototype.axios = axios
```

在组件的js代码中使用axios：

```
this.axios({......})
```

#### 跨域请求

vue的自动化工具提供了开发的服务器，我们在这个服务器环境下开发，改动代码可以马上更新显示，错误了还有代码提示，非常方便，但是，如果我们组件中需要数据，而且数据在另一个服务器环境下运行，我们就需要跨域请求数据，vue工具中可以使用代理来跨域请求，设置的方法是：在项目的config文件夹中，打开index.js,在proxyTable一项中设置：

```
// 'http://localhost:7890' 表示的是要跨域请求的地址
// 如果请求的地址是：'http://localhost:7890/index_data'
// 在请求时就可以写成: '/apis/index_data'

'/apis': {
    target: 'http://localhost:7890', 
    changeOrigin: true,
    pathRewrite: {
        '^/apis': ''
    }              
}
```



## 打包上线

项目开发完成后，需要把请求数据的代理地址改成和提供数据的服务器在同一个域的地址，因为最终会把前端代码放在和数据在同一个域的服务器下面运行。

```
// 将下面的请求地址
'/apis/index_data'

// 改成
'/index_data'
```

改完请求地址后，就可以将代码打包，生成最终可以上线的单文件结构：

```
// 打开终端，ctrl+c停掉开发服务器，执行下面的命令

npm run build
```

自动化程序会将打包的文件自动生成到项目的dist文件夹中。

将这些文件拷贝到提供数据服务的服务器的静态目录文件夹中，完成最终的上线！