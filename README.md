# ENGLISH 中文在下面
***
# FiveM WUHU framework
a framework for fivem RP servers
***
# Feature

1.Easy to use all of framework function .You just need to add a simple line in to your resource.lua or fxmanifest.lua

2.Better performance then ESX framework 50%.And use less memory on server.

3.Easy way to use FiveM natives.

What is that mean? e.g. notify in FiveM you need to write code like this:
```lua
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(true, true)
```
    
but using wuhu framework you just need one function:

```lua
notify(text)
```

very simple
***
# Requies

[mysql-async](https://github.com/brouznouf/fivem-mysql-async)

[pmc-callback](https://github.com/pitermcflebor/pmc-callbacks)
***
# Installation
1.download the file

2.unzip and put in to your ``resource`` folder

3.Import the database(``1.sql``)

4.add ``start wh_main`` line into ``server.cfg`` 

# DONT RENAME ANY FILES!!!!!!!
***

# Docs

https://github.com/jkh675/FiveM-WUHU-framework/wiki
***

# 中文 ENGLISH IS ON THE TOP
***
# FiveM 芜湖架构

专门为RP，赛车服务器而生的架构
***
# 特性

1.简单调用的功能，您只需要在 resource.lua 或 fxmanifest.lua 加上一行字，即可调用所有功能

2.更好的性能，比ESX架构快50%，以及消耗更少的内存

3.更简单的调用FiveM的功能

什么意思？例如：在原版的FiveM您如果要弹出一个提示，您需要写这些代码：
```lua
SetNotificationTextEntry("STRING")
AddTextComponentString(text)
DrawNotification(true, true)
```
但是，如果您使用芜湖架构，您只需要写这一行代码
```lua
notify(text)
```
非常简单
***
# 依赖插件

[mysql-async](https://github.com/brouznouf/fivem-mysql-async)

[pmc-callback](https://github.com/pitermcflebor/pmc-callbacks)
***
# 安装

1.下载文件

2.把wh_main放到您的resource文件夹里

3.导入 1.sql 这个数据库

4.添加 ``start wh_main`` 到 ``server.cfg`` 里面

# 请勿更改任何文件的名称！！！
***
