#  晶石


## MVC  model view controller

1.model 负责逻辑计算
2.view 显示UI
3.controller 交互 处理 model 与view

1.controller 可以和 model \ view交互
2.model和view 两者 不通
3.view通过匿名通讯(target-action 目标对象-操作模式)与controller通讯
4.view通过代理(delegate)方法可以将更多信息告知controller

will (将要) should (能否) did (已经)

protocol (协议)
view通过创建协议(protocol)方法,
controller如果想要监听这些事件,可以把自己设为视图的delegate
dataSource(数据存储) 数据个数
controller如果想要拿到数据,可以通过dataSource,拿到
controller负责把model里的数据转化为视图能接受的类型,因为视图是通用的,他们并不知道如何处理任何特定的模型

model 通过notification & KVO 让controller 知道
MVC只是被另外一个MVC当做视图
两个MVC可以共享model

class (类)
struct (结构体)
String Double Dictionary Array 都是结构体
class 与 struct 区别:
1.类可以继承,结构体不能
2.类存储在堆中通过指针传递(引用类型),结构体存储在栈中通过拷贝值传递(值类型)
3.struct (结构体) 内方法或属性,当你在某个方法内部,需要修改他的值,必须加上关键字mutating,告诉这个方法可以修改结构体的值

private (私有变量)
机构体会自动提供一个构造器通过这个构造器来初始化所有未初始化的属性

mutating (变异)

