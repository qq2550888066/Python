# RESTful设计方法

## 1. 域名

应该尽量将API部署在专用域名之下。

```
https://api.example.com
```

如果确定API很简单，不会有进一步扩展，可以考虑放在主域名下。

```
https://example.org/api/
```

## 2. 版本（Versioning）

应该将API的版本号放入URL。

```
http://www.example.com/app/1.0/foo

http://www.example.com/app/1.1/foo

http://www.example.com/app/2.0/foo
```

另一种做法是，将版本号放在HTTP头信息中，但不如放入URL方便和直观。[Github](https://developer.github.com/v3/media/#request-specific-version)采用这种做法。

因为不同的版本，可以理解成同一种资源的不同表现形式，所以应该采用同一个URL。版本号可以在HTTP请求头信息的Accept字段中进行区分（参见[Versioning REST Services](http://www.informit.com/articles/article.aspx?p=1566460)）：

```
Accept: vnd.example-com.foo+json; version=1.0

Accept: vnd.example-com.foo+json; version=1.1

Accept: vnd.example-com.foo+json; version=2.0
```

## 3. 路径（Endpoint）

路径又称"终点"（endpoint），表示API的具体网址，每个网址代表一种资源（resource）

**(1) 资源作为网址，只能有名词，不能有动词，而且所用的名词往往与数据库的表名对应。**

举例来说，以下是不好的例子:

```
/getProducts
/listOrders
/retreiveClientByOrder?orderId=1
```

对于一个简洁结构，你应该始终用名词。 此外，利用的HTTP方法可以分离网址中的资源名称的操作。

```
GET /products ：将返回所有产品清单
POST /products ：将产品新建到集合
GET /products/4 ：将获取产品 4
PATCH（或）PUT /products/4 ：将更新产品 4
```

**(2) API中的名词应该使用复数。无论子资源或者所有资源。**

举例来说，获取产品的API可以这样定义

```
获取单个产品：http://127.0.0.1:8080/AppName/rest/products/1
获取所有产品: http://127.0.0.1:8080/AppName/rest/products
```

## 3. HTTP动词

对于资源的具体操作类型，由HTTP动词表示。

常用的HTTP动词有下面四个（括号里是对应的SQL命令）。

- GET（SELECT）：从服务器取出资源（一项或多项）。
- POST（CREATE）：在服务器新建一个资源。
- PUT（UPDATE）：在服务器更新资源（客户端提供改变后的完整资源）。
- DELETE（DELETE）：从服务器删除资源。

还有三个不常用的HTTP动词。

- PATCH（UPDATE）：在服务器更新(更新)资源（客户端提供改变的属性）。
- HEAD：获取资源的元数据。
- OPTIONS：获取信息，关于资源的哪些属性是客户端可以改变的。

下面是一些例子。

```
GET /zoos：列出所有动物园
POST /zoos：新建一个动物园（上传文件）
GET /zoos/ID：获取某个指定动物园的信息
PUT /zoos/ID：更新某个指定动物园的信息（提供该动物园的全部信息）
PATCH /zoos/ID：更新某个指定动物园的信息（提供该动物园的部分信息）
DELETE /zoos/ID：删除某个动物园
GET /zoos/ID/animals：列出某个指定动物园的所有动物
DELETE /zoos/ID/animals/ID：删除某个指定动物园的指定动物
```

## 4. 过滤信息（Filtering）

如果记录数量很多，服务器不可能都将它们返回给用户。API应该提供参数，过滤返回结果。

下面是一些常见的参数。

```
?limit=10：指定返回记录的数量
?offset=10：指定返回记录的开始位置。
?page=2&per_page=100：指定第几页，以及每页的记录数。
?sortby=name&order=asc：指定返回结果按照哪个属性排序，以及排序顺序。
?animal_type_id=1：指定筛选条件
```

参数的设计允许存在冗余，即允许API路径和URL参数偶尔有重复。比如，GET /zoos/ID/animals 与 GET /animals?zoo_id=ID 的含义是相同的。

## 6. 状态码（Status Codes）

服务器向用户返回的状态码和提示信息，常见的有以下一些（方括号中是该状态码对应的HTTP动词）。

- `2XX`：请求正常处理并返回
- `3XX`：重定向，请求的资源位置发生变化
- `4XX`：客户端发送的请求有错误
- `5XX`：服务器端错误

> | 状态码 | LABEL                  | 解释                                                         |
> | ------ | ---------------------- | ------------------------------------------------------------ |
> | 200    | OK                     | 请求成功接收并处理，一般响应中都会有 body                    |
> | 201    | Created                | 请求已完成，并导致了一个或者多个资源被创建，最常用在 POST 创建资源的时候 |
> | 202    | Accepted               | 请求已经接收并开始处理，但是处理还没有完成。一般用在异步处理的情况，响应 body 中应该告诉客户端去哪里查看任务的状态 |
> | 204    | No Content             | 请求已经处理完成，但是没有信息要返回，经常用在 PUT 更新资源的时候（客户端提供资源的所有属性，因此不需要服务端返回）。如果有重要的 metadata，可以放到头部返回 |
> | 301    | Moved Permanently      | 请求的资源已经永久性地移动到另外一个地方，后续所有的请求都应该直接访问新地址。服务端会把新地址写在 `Location` 头部字段，方便客户端使用。允许客户端把 POST 请求修改为 GET。 |
> | 304    | Not Modified           | 请求的资源和之前的版本一样，没有发生改变。用来缓存资源，和条件性请求（conditional request）一起出现 |
> | 307    | Temporary Redirect     | 目标资源暂时性地移动到新的地址，客户端需要去新地址进行操作，但是**不能**修改请求的方法。 |
> | 308    | Permanent Redirect     | 和 301 类似，除了客户端**不能**修改原请求的方法              |
> | 400    | Bad Request            | 客户端发送的请求有错误（请求语法错误，body 数据格式有误，body 缺少必须的字段等），导致服务端无法处理 |
> | 401    | Unauthorized           | 请求的资源需要认证，客户端没有提供认证信息或者认证信息不正确 |
> | 403    | Forbidden              | 服务器端接收到并理解客户端的请求，但是客户端的权限不足。比如，普通用户想操作只有管理员才有权限的资源。 |
> | 404    | Not Found              | 客户端要访问的资源不存在，链接失效或者客户端伪造 URL 的时候回遇到这个情况 |
> | 405    | Method Not Allowed     | 服务端接收到了请求，而且要访问的资源也存在，但是不支持对应的方法。服务端**必须**返回 `Allow` 头部，告诉客户端哪些方法是允许的 |
> | 415    | Unsupported Media Type | 服务端不支持客户端请求的资源格式，一般是因为客户端在 `Content-Type` 或者 `Content-Encoding` 中申明了希望的返回格式，但是服务端没有实现。比如，客户端希望收到 `xml`返回，但是服务端支持 `Json` |

状态码的完全列表参见[这里](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html)或[这里](https://zh.wikipedia.org/wiki/HTTP%E7%8A%B6%E6%80%81%E7%A0%81)。

## 7. 错误处理（Error handling）

如果状态码是4xx，服务器就应该向用户返回出错信息。一般来说，返回的信息中将error作为键名，出错信息作为键值即可。

```
{
    error: "Invalid API key"
}
```

## 8. 返回结果

针对不同操作，服务器向用户返回的结果应该符合以下规范。

- GET /collection：返回资源对象的列表（数组）
- GET /collection/resource：返回单个资源对象
- POST /collection：返回新生成的资源对象
- PUT /collection/resource：返回完整的资源对象
- PATCH /collection/resource：返回完整的资源对象
- DELETE /collection/resource：返回一个空文档

## 9. 超媒体（Hypermedia API）

RESTful API最好做到Hypermedia（即返回结果中提供链接，连向其他API方法），使得用户不查文档，也知道下一步应该做什么。

比如，Github的API就是这种设计，访问[api.github.com](https://api.github.com/)会得到一个所有可用API的网址列表。

```
{
"current_user_url": "https://api.github.com/user",
"authorizations_url": "https://api.github.com/authorizations",
// ...
}
```

从上面可以看到，如果想获取当前用户的信息，应该去访问[api.github.com/user](https://api.github.com/user)，然后就得到了下面结果。

```
{
  "message": "Requires authentication",
  "documentation_url": "https://developer.github.com/v3"
}
```

上面代码表示，服务器给出了提示信息，以及文档的网址。

## 10. 其他

服务器返回的数据格式，应该尽量使用JSON，避免使用XML。



`Github API` 总结了一些非常好的设计原则 , 可以参考