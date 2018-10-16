### 基本操作

##### 1. 自报家门

```git
$ git config --global user.name "Mr Chen "

$ git config --global user.email "chenzonghao1@163.com"
```



##### 2. 添加文件到Git仓库

```git
 git init 							//初始化代码仓库
 
 
 1.使用命令git add <file>，注意，可反复多次使用，添加多个文件；
	
  2.使用命令git commit -m <message>，完成。<提交说明>
    暂缓区(stage):需要提交的文件修改通通放到暂存区add，然后，一次性提交暂存区的所有修改commit。
    
    
git add learngit.txt                               //把所有要提交的文件修改放到暂存区
git commit -m 'add a file'                      //把暂存区的所有内容提交到当前分支
```



##### 3.回归版本

要随时掌握工作区的状态，使用**git status**命令。

如果git status告诉你有文件被修改过，用**git diff**可以查看修改内容。

   HEAD指向的版本就是当前版本，因此，Git允许我们在版本的历史之间穿梭，
   使用命令**git reset --hard commit_id**。  返回到上一个历史版本使用**git reset --hard HRED^**

   穿梭前，用**git log**可以查看提交历史，以便确定要回退到哪个版本。

   要重返未来，用**git reflog**查看命令历史，以便确定要回到未来的哪个版本。

   ```git
   git status                                            //查看工作区状态
   git diff                                                //查看文件修改内容
   git log                                                //查看提交历史
   git log --pretty=oneline                       //单行显示
   git reset --hard HEAD^　　　　　　　　 //回退到上一个版本，其中（HEAD^^(上上版本),HEAD~100(往上100个版本)）
   ```

   

##### 4. Git跟踪修改

理解了Git是如何跟踪修改的，每次修改，如果不用git add到**暂存区**，那就不会加入到**commit**中。
   (第二次修改,显示状态是没有add,但是cat查看内容改变了,)

   

##### 5.放弃修改

场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令**git checkout -- <file>**。

   场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，第一步用命令**git reset HEAD <file>**，就回到了场景1，第二步按场景1操作。
	(如果直接使用命令git checkout -- <file>效果看起来一样,不知道内部情况,有待确定)

场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，参考版本回退一节，不过前提是没有推送到远程库。





##### 6 . 删除文件

​	**rm <file>** 就相当于在文件夹中手动删除.. 先手动删除文件，然后使用**git rm <file>**和**git add<file>**效果	是一样的。
    	命令git rm用于删除一个文件。如果一个文件已经被提交到版本库，
    	那么你永远不用担心误删，但是要小心，你只能恢复文件到最新版本，你会丢失最近一次提交后你修改的内	容。

 	另一种情况是删错了，因为版本库里还有呢，所以可以很轻松地把误删的文件恢复到最新版本：
 **git checkout -- test.txt<file>**



##### 7.基本命令

```git

ssh-keygen -t rsa -C 'your email'                                                    //创建SSH Key
git remote add origin git@github.com:username/repostery.git          //关联本地仓库，远程库的名字为origin
//第一次把当前分支master推送到远程，-u参数不但推送，而且将本地的分支和远程的分支关联起来
git push -u origin master 
git push origin master                                                                  //把当前分支master推送到远程
git clone git@github.com:username/repostery.git                            //从远程库克隆一个到本地库


git checkout -b dev                                   //创建并切换分支
#相当于git branch dev 和git checkout dev 
git branch                                                //查看当前分支，当前分支前有个*号
git branch <name>                                   //创建分支
git checkout <name>                                //切换分支
git merge <name>                                   //合并某个分支到当前分支
git branch -d <name>                               //删除分支
git log --graph                                          //查看分支合并图
git merge --no-ff -m 'message' dev            //禁用Fast forward合并dev分支

git stash                                                 //隐藏当前工作现场，等恢复后继续工作
git stash list                                            //查看stash记录
git stash apply                                         //仅恢复现场，不删除stash内容
git stash drop                                          //删除stash内容
git stash pop                                           //恢复现场的同时删除stash内容
git branch -D <name>                              //强行删除某个未合并的分支

//开发新feature最好新建一个分支
git remote                                               //查看远程仓库
git remote -v                                           //查看远程库详细信息

git pull                                                   //抓取远程提交
git checkout -b branch-name origin/branch-name                  //在本地创建和远程分支对应的分支
git branch --set-upstream branch-name origin/branch-name   //建立本地分支和远程分支的关联


git tag v1.0                                                                      //给当前分支最新的commit打标签
git tag -a v0.1 -m 'version 0.1 released' 3628164                 //-a指定标签名，-m指定说明文字
git tag -s <tagname> -m 'blabla'                                        //可以用PGP签名标签
git tag                                                                             //查看所有标签
git show v1.0                                                                   //查看标签信息
git tag -d v0.1                                                                 //删除标签
git push origin <tagname>                                               //推送某个标签到远程
git push origin --tags                                                       //推送所有尚未推送的本地标签


```





### 问题及解决

##### 1. 问题在git push的时候提示出错

**在对本地库中的文件执行修改后，想git push推送到远程库中，结果在git push的时候提示出错：**

​	! [rejected]        master -> master (non-fast-forward)
	error: 无法推送一些引用到 'git@github.com:GarfieldEr007/XXXX.git'
	提示：更新被拒绝，因为您当前分支的最新提交落后于其对应的远程分支。
	提示：再次推送前，先与远程变更合并（如 'git pull ...'）。详见
	提示：'git push --help' 中的 'Note about fast-forwards' 小节。



**解决方案:**

因为当前分支的最新提交落后于其对应的远程分支，所以我们先从远程库fetch到更新再和本地库合并，之后就可以git push操作了。

```git
$git remote add origin https://github.com/username/test.git  

$git fetch origin

$git merge origin/master

```



##### 2. 问题 443

```
Push failed: Failed with error: unable to access 'https://github.com/weidongcao/bigdata/':  OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to github.com:443
```



```
git config --global --unset http.proxy

---------------------

本文来自 荒野独行 的CSDN 博客 ，全文地址请点击：https://blog.csdn.net/daerzei/article/details/79528153?utm_source=copy 
```

ctrl+K    ctrl+shift+k



##### 3. 修改远程的url

直接使用修改命令

```git
git remote set-url origin [url]
```

先删除再连接

```git
git remote rm origin
git remote add origin [url]
```



