

# 显示到其它类型字段

```sql
display "123" to field1
```

```sql
define l_name record
	filed1   varchar(20), 
  field2   varchar(40),
	field3   decimal(10,2)
end record
display by name l_name.*
-- 等同以下写法
display l_name.field1,l_name.field2,l_name.field3 to field1,field2,field3
-- 如果结构体成员名称和要显示到的字段名称不相同，则必须指定栏位名称，不能用.*方式
display l_name.field1,l_name.field2,l_name.field3 to fieldok,filedno,field3
```

# 显示到Table

使用table，需要一个和table的字段类型一致的结构体数组，即4fd文件中的table**字段名称**和**类型**与4gl中结构体数组的**成员名称**和**类型**要保持一直

```sql
define l_list dynamic array of record
	field1 varchar(20),
	field2 decimal(20,6),
	field3 varchar(30),
	field4 integer
end record

-- l_list 是4gl中的结构体数组名称
-- s_list 是4fd画面中表格的name名称
display array l_list to s_list.*
end display
```



