### 前言
本次项目使用adb指令和monkey指令  
来实现对指定app-链家app执行1000次的压力测试
  
##### 环境搭建  
1. JDK的环境搭建  
+ 本人的操作系统是Win10，所以从网上寻找的教程是win10下的安装教程
+ 这边推荐一个链接-步骤很详细，条理很清晰 https://www.runoob.com/w3cnote/windows10-java-setup.html 

2. Android SDK的环境搭建  
+ 我没有从网上看到纯SDK的安装资料，我是直接安装的Android Studio(包含Android SDK)
+ 安装很简单，但是要注意的是Android Studio有一些扩展功能可以无需勾选安装，如果你是测试人员

3. adb环境变量设置  
+ 这一步很重要，因为没有这一步，后续的cmd操作都得从sdk的安装路径下启动，很不方便
+ 网上有很多教程，归根结底是把adb可执行文件所在的路径添加到系统变量的path中

##### 步骤实现  
1. 打开雷电模拟器  
+ 安装测试对象- 链家app，如果已经安装，可以掠过这一步
+ 注意：运行脚本或adb指令前一定要先连接真机或者是模拟器，不然运行的时间为浪费

2. 进入adb运行环境  
+ 查看是否连接模拟器：adb devices   
+ 查看monkey指令帮助：adb shell monkey help   
+ 获取测试对象的包名：adb shell pm list packages / adb logcat | findstr START
+ 对测试对象预先执行100次monkey操作：adb shell monkey -p 包名 100  
 
3. 编写bat脚本，仅供参考，详见如下  
+ @echo  
+ adb  
+ adb kill-server
+ adb start-server
+ adb devices
+ adb shell monkey -p com.homelink.android --pct-touch 30 --pct-motion 30 --pct-anyevent 40 --throttle 2000 --ignore-crashes 1000
+ exit
