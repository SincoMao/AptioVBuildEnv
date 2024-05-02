# AptioVBuildEnv
AMI AptioV BIOS Build Environment Integration Package.

## 背景简介
编译AMI的Codebase，要根据ReleaseNotes中说明的"AMI Build Tools Label"，下载对应版本的VisualeBios (VEB)，并完成一系列环境设定……

如果开发多个Codebase，通常要准备多个版本的VEB供切换，每个Project在打开前都要先确认下该用哪一版VEB……

此集成包探索一种更高效的Coding方案，开发者不用考虑VEB版本，并且可选用任意IDE工具……

## 系统要求
确保已安装以下软件：
- Java Runtime Environment (JRE)
- Python

## 配置步骤
1. **克隆 AptioVBuildEnv**：例如克隆到 `D:\VisualeBios` 目录下。

2. **设置环境变量**：
- 创建新的系统环境变量 `APTIOV_BUILD_ENV`，并将其值设置为AptioVBuildEnv所在路径，例如： `D:\VisualeBios\AptioVBuildEnv` 。
- 在系统环境变量 `Path` 中添加 `%APTIOV_BUILD_ENV%\Program` 。

3. **拷贝 Aptio_5.x_TOOLS**：
- 重命名Aptio_5.x_TOOLS_xx中的BuildTools文件夹以反映其版本号。
- 移动到AptioVBuildEnv\BuildTools目录下。

  例如：Aptio_5.x_TOOLS_JRE_37_1.zip解压后，仅需将其中的BuildTools文件夹重命名为37.1，然后移动文件夹37.1到 `D:\VisualeBios\AptioVBuildEnv\BuildTools` 目录下。

## 使用说明
任意命令行工具导航到Project文件夹，使用以下命令并指定Tool版本：
- `amib`: 代表 F9 Rebuild All。
- `amim`: 代表 F7 Build。
- `amic`: 代表 Clean。

  例如基于Project在资源管理器地址栏中输入 `amib 40` ，直接进入Aptio_5.x_TOOLS_40环境下编译。