# RMStarScore 

实现评分等级及平均分（用星星标示）

# 使用方法

导入"RMStarScore"文件夹到项目工程
引入头文件： #import "RMStarScore.h" 

RMStarScore *star = [[RMStarScore alloc] initWithFrame:self.view.bounds data:@[@332,@93,@129,@63,@0]];
[self.view addSubview:star];

传入每组星星数量，默认5组

#说明
本项目中包含了多个未使用的文件，原因是因为大部分都是一些属性或者类的扩展方法，比较常用，本人进行了整理一同发布，也算是个备份吧。Categories目录中均是一些扩展的内容。

RMDefines.h 大部分宏定义包含了设备型号、屏幕宽度、颜色等

RMSingleton.h 单例文件的定义 只需要简简单单一行代码就可以搞定单例模式

NSString+Size.h 对字符串的宽度和高度进行获取，传入一个字符串和字体大小，就可以获取对应的宽度和高度，比较方便

UIView+CustomFrame.h 对控件的Frame等操作，设置x,y,width,height,centerX,centerY等，很方便
