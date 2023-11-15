# go 类型转换与断言



- 断言—接口断言为确定类型

```go
var greeting interface{} = "hello world"
greetingStr := greeting.(string)
```

- 类型转换—底层结构一致的类型相互转换

```go
greeting := []byte("hello world")
greetingStr := string(greeting)
```




