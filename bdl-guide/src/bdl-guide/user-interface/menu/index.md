

# Windows

```4gl
open window czz_w with form "czz/42f/czzi001"
call cl_ui_init()  -- 这lib函数为初始化画面，如果不调用会出现一个空窗口。
...
close czz_w 
```



~~Form~~

```sql
open form czz_w from "czz/42f/czzi001"
display form czz_w
...
close form czz_w
```

# MENU

开启窗口(window)后，我们必须对画面进行一些操作，否则，开启后就关闭，画面并不会显示什么。

这里就是第一个语法MENU。

```sql
database ds
main
    open window act_w with form "czz/42f/czzi001"

    menu ""
        command "a.add" #menu 功能名称"a.新增"，a 为快速键
            message "a.add"

        command "u.modi"
            message "u.modi"
            
        command "q.qry"
            message "q.qry"

        command key (control-a) # control-a 为快速键且
            message "control-a" #此功能不show menu 上

        command "exit"
            close window act_w
            exit program
            
        on action click_me
            message "click_me"
    end menu
end main
```

### ~~command ‘click’~~

右侧生成一个按钮，如果是”a.click”的形式，a是这个按钮的快捷键。

在command ‘click’ 下方

### ~~command key(control-a)~~

仅快捷键，不会产生按钮

### on action click

产生按钮，但名称不能重复

## MESSAGE

![UntitledYCyywCIIg.png](./image/UntitledYCyywCIIg.png)





