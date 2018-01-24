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
>1.类可以继承,结构体不能
>2.类存储在堆中通过指针传递(引用类型),结构体存储在栈中通过拷贝值传递(值类型)
>3.struct (结构体) 内方法或属性,当你在某个方法内部,需要修改他的值,必须加上关键字mutating,告诉这个方法可以修改结构体的值

private (私有变量)
机构体会自动提供一个构造器通过这个构造器来初始化所有未初始化的属性

mutating (变异)


Optional (可选项)
defaulting
1.作为泛型枚举定义
enum Optional<T> {  // 相当于关联值的占位符
    case none
    case some(T)
}

Tuples(元组)
Range T必须是Comparable,可以比较的 ..< ...
struct Range<T> {
    var startIndex: T
    var endIndex: T
}
CoutableRang
ClosedCountableRang
stride(from: 0.2, to: 3.4, by: 0.2)
for in

classes(类)
class ViewController : .. {

}
structures(结构体)
struct CalculatorBrain {

}
enums(枚举)
enum Op {

}
protocol(协议)
>不同:1.类可以指明它的父类(类可以继承)
>        2.枚举不能储存属性(枚举把它的数据保存在关联值中,所以不能有任何储存属性,但是他可以有计算属性并且它们有函数),枚举(一般不用初始化).
 >       3.结构体和枚举是值类型,类是引用类型.
值类型:通过拷贝来传递使用,并且存储在栈中
用一个指针指向他,当你把它传送到函数中或将他分配给另外一个变量之类的东西时你只是在传递指向它的指针.
<!--当你把它作为参数传送它时它被复制了,甚至如果你仅仅是把它,分配给其他变量或者是函数都会拷贝-->

引用类型:
相同:1.类与结构体需要初始化
functional programming


override : 重写父类方法使用
final : 标记父类 子类不允许重写
static:Swift中标识“类型范围作用域”,用于修饰存储属性,static修饰的存储属性称为静态变量(常量)，不可被重写
lazy:
Array:
Dictionary:
String:
Unicode
String.index
startIndex
NSObject
NSNumber: 固定数字类型,并且做转换.通过这些类型的构造器来做类型转换
Date:结构体
Data:二进制数据,结构体.
Initialization(构造器):
properties(属性):

属性观察器:
var someStoredProperty: Int = 42 {
willSet { newValue is the new value }
didSet { oldValue is the old value }
}

override var inheritedProperty: String {
willSet { newValue is the new value }
didSet { oldValue is the old value }
}
闭包



UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择支付方式" message:nil preferredStyle:UIAlertControllerStyleActionSheet];

UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
[alertController addAction:cancelAction];
[self.viewController presentViewController:self.viewController animated:YES completion:nil];
