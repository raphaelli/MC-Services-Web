# MC-Services-Web

>专升本后刚好有一门Oracle的课，课程设计是需要做一个完整的数据库系统，最好能实现其功能。刚好暑假期间MC服务器周目变更，想写个系统出来做白名单管理和通过webApi在网站对服务器进行管理的实现，于是这次正好把这个系统实现出来，分两篇文章记录，本篇记录整个系统的开发流程和相关Readme内容，另一篇[Oracle数据库项目——MC服务器管理系统](https://ns96.com/2017/12/10/oracle-mc-server/)，用于提交课程设计报告。

# TimeLine
- 2017/11/23 确认项目内容，使用原github仓库-[Github-McSW](https://github.com/raphaelli/MCServicesWeb)
- 2017/11/26 系统功能模块设计
- 2017/11/29 确认系统功能，学习数据库表单的设计原则
- 2017/11/30 确认技术栈 ASP dotNet core MVC + EF + Oracle （EF Core暂不支持Oracle）
- 2017/12/3  手稿-数据库表结构设计
- 2017/12/5  变更技术栈为 ASP dotNet MVC + Dapper +Oracle （Dapper可选/dpo.NET）
- 2017/12/12 静态内容迁移，完成home/Index，完成_LayOut迁移
- 2017/12/13 前台页面页面迁移,配置BandleConfig
- 2017/12/14 完成页面基础布局和设计，配置登陆及权限 笔记[ASP.NET MVC项目笔记](https://ns96.com/2017/12/13/aspdotnet-note/)
- 2017/12/16 SQL部分 [E-R图笔记](https://ns96.com/2017/12/17/sql-er/)
