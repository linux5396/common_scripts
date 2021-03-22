# common_scripts
unix/linux系统下的公共脚本库，包含python、shell、go等语言，用于简化server操作，优化性能，提升效率等

## 项目包说明

```bash
├── dev #测试脚本包，非发布版本
├── disk #关于磁盘空间、文件清理之类相关包
│   ├── disk_clear_linux.sh #清理指定目录下满足文件过滤表达式和指定时间区间的文件
│   └── file_truncate20_linux.sh #截断文件，用于处理某些进程不重启的打开文件的大小
├── proc #关于进程相关包
│   ├── __init__.py
│   ├── ck_proc_fd_linux.sh #检查进程打开的句柄数
│   ├── ck_proc_name_linux.sh #检查进程名是否存在，不存在则可以指定命令启动进程
│   └── ck_tcp_linux.py #通过tcp检查进程ip:port是否存在；可以在脚本中引入这个py脚本
├── tools #工具包
│   ├── backup_crontab_files.sh #备份crontab任务文件
│   └── get_ip_from.sh #从文件中提交有效的ip地址，去重

```