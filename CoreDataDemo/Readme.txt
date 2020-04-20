步骤：1
创建工程是要选择use coredata选项

步骤：2
选中文件xcdatamodeld，添加entity 并设置属性

步骤：3
工程中选中 xcdatamodeld文件 -> 选中Entity <--> 菜单栏选 Editor -> Create NSManagedObject subclass...
创建Entity的访问对象

步骤：4
创建上下文，创建/连接db

步骤：5
使用上下文对db进行操作



6 理解：
通过名字的后缀xcdatamodeld可以体察，这仅仅是一个数据模型，而不是存储的数据
真正的数据还是存储在DB中，而不是什么xcdatamodeld

coredata相当于提供了一种机制或者是通道，在不用加载外部library的时候，直接访问db
而entity中可设计DB的属性值以及一些关联关系

资料介绍说，底层就是SQlite，及所存储的DB为SQLite，所以coredata相当于一个SQLite访问库
只不过是一个具有苹果特色的数据库访问接口

好有一比：
xcdatamodeld：相当于建立了一个库
Entity：相当于建立了一个表，
Entity：中的Attributes相当于设置数据表的字段值
DB数据的存储需要有一个具体的路径
DB的访问需要有个接口 / 方式


创建上下文 == 创建具体的DB文件，并建立连接接口
此后对此数据表的的操作，都要用这个上下文统一接口来操作

