---
title: tiptop gp 常用的函数和编程方式
subTitle: ""
date: 2023-11-16T10:34:02.280675018+08:00
author: darcy
authorLink: darcyjoven.com
resources: []
tags:
- bdl
- tiptop gp
categories:
- 编程问题
toc:
  enable: true
  auto: true
linkToMarkdown: true
code:
  copy: true

---
## excel汇入

```4gl
DEFINE xlapp INTEGER
DEFINE xlwb INTEGER
MAIN
  DEFINE result INTEGER
  DEFINE str STRING
--initialization of global variables
  LET xlapp = -1
  LET xlwb = -1
--first, we must create an Instance of an Excel Application
  CALL ui.Interface.frontCall("WinCOM", "CreateInstance",
   ["Excel.Application"], [xlapp])
  CALL CheckError(xlapp, __LINE__)
--then adding a Workbook to the current document
  CALL ui.interface.frontCall("WinCOM", "CallMethod",
   [xlapp, "WorkBooks.Add"], [xlwb])
  CALL CheckError(xlwb, __LINE__)
--then, setting it to be visible
  CALL ui.interface.frontCall("WinCOM", "SetProperty",
   [xlapp, "Visible", true], [result])
  CALL CheckError(result, __LINE__)
--then CALL SetProperty to set the value of the cell
  CALL ui.Interface.frontCall("WinCOM", "SetProperty", 
   [xlwb, 'activesheet.Range("A1").Value', "foo"],[result])
  CALL CheckError(result, __LINE__)
--then CALL GetProperty to check the value again
  CALL ui.Interface.frontCall("WinCOM", "GetProperty",
   [xlwb, 'activesheet.Range("A1").Value'], [str])
  CALL CheckError(str, __LINE__)
  DISPLAY "content of the cell is: " || str

  --then Free the memory on the client side
  CALL freeMemory()
END MAIN

FUNCTION freeMemory()
 DEFINE res INTEGER
  IF xlwb != -1 THEN
    CALL ui.Interface.frontCall("WinCOM","ReleaseInstance", [xlwb], [res] )
  END IF
  IF xlapp != -1 THEN
    CALL ui.Interface.frontCall("WinCOM","ReleaseInstance", [xlapp], [res] )
  END IF
END FUNCTION
FUNCTION checkError(res, lin)
  DEFINE res INTEGER
  DEFINE lin INTEGER
  DEFINE mess STRING
  IF res = -1 THEN
    DISPLAY "COM Error for call at line:", lin
    CALL ui.Interface.frontCall("WinCOM","GetError",[],[mess])
    DISPLAY mess
--let's release the memory on the GDC side
    CALL freeMemory()
    DISPLAY "Exit with COM Error."
    EXIT PROGRAM (-1)
  END IF
END FUNCTION
```

## 列表报错

```4gl
CALL s_showmsg_init()  
    LOOP
        CALL s_errmsg(field,date,msg,'mfg0301',1)
    END 
CALL s_showmsg()
```

## 动态设置下拉框

```4gl
DECLARE t310_curoqaud03 CURSOR FOR

        SELECT UNIQUE azi01 FROM azi_file

    LET g_oqaud03_cmbo = ""

    FOREACH t310_curoqaud03 INTO g_azi01

    IF cl_null(g_oqaud03_cmbo) THEN

             LET g_oqaud03_cmbo=g_azi01

    ELSE

             LET g_oqaud03_cmbo=g_oqaud03_cmbo CLIPPED,",",g_azi01 CLIPPED

    END IF

    END FOREACH

    CALL cl_set_combo_items("oqaud03",g_oqaud03_cmbo,g_oqaud03_cmbo)
```

## 字段显示颜色

### 表单

```4gl
cl_chg_comp_att(ps_fields,ps_atts,ps_values)
CALL cl_chg_comp_att("tc_ioa01,tc_ioa02","color","cyan")
```

- 不支持的属性修改

```4gl
LET lwin_curr = ui.Window.getCurrent()
   LET lfrm_curr = lwin_curr.getForm() 

   LET lnode_item = lfrm_curr.findNode("FormField","formonly.tc_ioa01") 

   LET lnode_child = lnode_item.getFirstChild() 
   CALL lnode_child.setAttribute("underline",true)
```

表格

利用`DIALOG.setCellAttributes()`函数

-  新增一个和单身数组字段一致的数组

```4gl
DEFINE g_oeb_color     DYNAMIC ARRAY OF RECORD  
	        c01   STRING,c02   STRING,  
	        c03   STRING,c04   STRING,  
	        c05   STRING,c06   STRING,  
	        c07   STRING,c08   STRING,  
	        c09   STRING,c10   STRING,  
	        c11   STRING,c12   STRING  
	     END RECORD
```

- 每笔单独设置颜色

```4gl
LET g_oeb_color[2].c10 ="red"
```

- 在DISPLAY中设置显示模式

```4gl
BEFORE DISPLAY   ##显示之前设置属性
    CALL DIALOG.setCellAttributes(g_oeb_color)
```



