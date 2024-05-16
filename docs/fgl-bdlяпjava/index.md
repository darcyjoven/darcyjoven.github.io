# fgl bdl语言集成java包



# fgl bdl语言集成java包

___

## 确保java包版本和服务器jre版本一致

`java -version`

## 用静态类的方法返回值

> bdl不支持面向对象编程（新版本支持单功能单一），所以用java静态类返回对象或者值来代替new Person()这种构建函数。

## jar 包配置

任意位置都可以，推荐位置`$TOP/ds4gl2/bin/javaad/jar`

## CLASSPATH 设置

在文件`$TOP/bin/tiptop_env`中设置

设置好CLASSPATH后重新登陆tiptop查看jar包是否在CLASSPATH中

## BDL调用JAVA代码

1. 代码最顶部导入要使用的类

```4gl
IMPORT JAVA com.alibaba.fastjson.JSON
IMPORT JAVA com.alibaba.fastjson.JSONArray
IMPORT JAVA com.alibaba.fastjson.JSONObject

```

1. 实际调用

```4gl
// 定义java类型
DEFINE json_str RECORD
    cust_num   INTEGER,
    cust_name  VARCHAR(30),
    order_ids  JSONArray,
    arr_list   JSONArray
    END RECORD
DEFINE json_obj    JSONObject


LET js = '{"cust_num":123,"cust_name":"caozq","order_ids":[234,567,789],"arr_list":[{"aa":"aa","bb":"cc"},{"aa":"aa1","bb":"bb1"}]}'
// 访问静态函数
LET json_obj = com.alibaba.fastjson.JSON.parseObject(js)
// 访问对象属性
LET json_str.cust_num = json_obj.getIntValue("cust_num")
LET json_str.cust_name = json_obj.getString("cust_name")


```


