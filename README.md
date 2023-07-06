# AptioVBuildEnv
#### AMI AptioV BIOS Build Environment Integration Package.

>这是精简工具包，不含Windows Driver Kit，完整版请[查看GitLab仓库](https://jihulab.com/xinyu/AptioVBuildEnv)

<br />1.**确认已安装好JRE、Python**<br />
<br />2.**克隆 AptioVBuildEnv** 到本地硬盘，例如 *D:\VisualeBios* 目录下<br />
<br />3.**新建系统变量 APTIOV_BUILD_ENV**，变量值为路径例如 *D:\VisualeBios\AptioVBuildEnv*<br />
<br />4.**新增环境变量 \%APTIOV_BUILD_ENV\%\Program** 到Path<br />
<br />5.**重命名AMI BuildTools文件夹为其版本号**，并逐一拷贝到例如 *D:\VisualeBios\AptioVBuildEnv\BuildTools*目录下<br />
<br />在Project文件夹地址栏直接输入指令，或通过任意命令行到达Project，<br />
输入以下三种指令：  
**amib** 代表 F9 Rebuild All  
**amim** 代表 F7 Build  
**amic** 代表 Clean  
然后输入ReleaseNotes.chm (xxxCrb.chm)中说明的Tool版本  
或者在指令后(空一格)加上Tool版本参数，例如输入**amib 40**,直接进入BuildTools_40环境下编译  

***更多内容请<a href="https://blog.bmeclat.cn/120.html" target="_blank">点击查看此文</a>***