# tiptop 效能排查

## 环境变量`FGLSQLDEBUG`

此环境变量，控制运行程序时，后台显示日期的等级。

最高等级为9，取消设置命令为`unset FGLSQLDEBUG`

将环境变量设置为9  后，运行我们想要分析效能的程序，并将日志记录到文件中。

```shell
export FGLSQLDEBUG=9
exe2 p_zz >> p_zz.log 2>&1
```

## 分析日志

日志除了人工分析，系统也有作业可以分析。

- <code>$FGLRUN $DS4GL/bin/fgldebug.42r</code>

- <code>$FGLRUN $UTL/fbin/42m/T100SQLDebug.42r p_zz.log</code>

即可打开效能分析工具



<aside>
💡 r.r2d+和r.h分别时tiptop gp和T100的效能功能。如果环境没问题，直接运行 r.r2d+/r.h p_zz 也可以直接分析效能
</aside>




