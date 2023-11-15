# golang的文件写入

```go
// 一次性写入
if err := os.WriteFile("file.txt", []byte("Hello GOSAMPLES!"), 0666); err != nil {
    log.Fatal(err)
}
```

```go
// 逐行写入
package main

import (
    "log"
    "os"
)

var lines = []string{
    "Go",
    "is",
    "the",
    "best",
    "programming",
    "language",
    "in",
    "the",
    "world",
}

func main() {
    // create file
    f, err := os.Create("file.txt")
    if err != nil {
        log.Fatal(err)
    }
    // remember to close the file
    defer f.Close()

    for _, line := range lines {
        _, err := f.WriteString(line + "\n")
        if err != nil {
            log.Fatal(err)
        }
    }
}
```





```go
// 写入byte
package main

import (
    "log"
    "os"
)

var bytes = []byte{
    0x47, // G
    0x4f, // O
    0x20, // <space>
    0x20, // <space>
    0x20, // <space>
    0x50, // P
    0x4c, // L
    0x45, // E
    0x53, // S
}

var additionalBytes = []byte{
    0x53, // S
    0x41, // A
    0x4d, // M
}

func main() {
    // create file
    f, err := os.Create("file.txt")
    if err != nil {
        log.Fatal(err)
    }
    // remember to close the file
    defer f.Close()

    // write bytes to the file
    _, err = f.Write(bytes)
    if err != nil {
        log.Fatal(err)
    }

    // write additional bytes to the file, start at index 2
    _, err = f.WriteAt(additionalBytes, 2)
    if err != nil {
        log.Fatal(err)
    }
}
```



```go
// 缓冲方式写入
package main

import (
    "bufio"
    "log"
    "os"
)

var lines = []string{
    "Go",
    "is",
    "the",
    "best",
    "programming",
    "language",
    "in",
    "the",
    "world",
}

func main() {
    // create file
    f, err := os.Create("file.txt")
    if err != nil {
        log.Fatal(err)
    }
    // remember to close the file
    defer f.Close()

    // create new buffer
    buffer := bufio.NewWriter(f)

    for _, line := range lines {
        _, err := buffer.WriteString(line + "\n")
        if err != nil {
            log.Fatal(err)
        }
    }

    // flush buffered data to the file
    if err := buffer.Flush(); err != nil {
        log.Fatal(err)
    }
}
```


