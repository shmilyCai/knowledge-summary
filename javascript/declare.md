#### js的函数声明和变量声明


var 定义的变量会被提升到函数范围的最顶部，但是它的赋值不会。const 和 let 声明的变量受到一个称之为 Temporal Dead Zones (TDZ) 的新概念保护。 知道为什么 typeof 不在安全 是很重要的