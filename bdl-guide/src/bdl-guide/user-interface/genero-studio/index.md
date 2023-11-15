

# Structure 结构

## Screen Record 画面字段结构

![d44570ab-fbb7-4c6b-b600-f763493533b6-Untitled.png](image/d44570ab-fbb7-4c6b-b600-f763493533b6-Untitled.png)

每一个添加到画面文件中的字段，都会自动添加到record记录上，每个表格会变为一组，不在表格中的字段顺序不需要关注。

![f64a5bb8-6e04-48d8-837a-883061329f10-Untitled.png](image/f64a5bb8-6e04-48d8-837a-883061329f10-Untitled.png)

表格record 的名称和字段的顺序，是你在4gl代码中使用时要注意的，所以这里顺序需要注意。

# Properties 属性

### name 字段名

![6a08925b-4119-482e-a41b-29a56fdf3831-Untitled.png](image/6a08925b-4119-482e-a41b-29a56fdf3831-Untitled.png)

字段的名称一般设置为表字段即可，`apa01`、`apa_file.apa01` 都是一样的，`apa_file`是表名，一般不需要，我们自己建立的时候，不需要加表名。

如果字段重复，也可以取其它名称，如果`apa01_1`、或者其它符合标识符规则的命名，如果在程序中要使用这个字段，请使用一个方便使用的字段名。

### posX,poxY 字段位置

### gridWidth，gridHeight 字段大小

![36c91395-4c11-487b-8663-c388c9d944f5-Untitled.png](image/36c91395-4c11-487b-8663-c388c9d944f5-Untitled.png)

字段的大小和位置，一般是我们用鼠标拖动的，但是也可以在这里做微调。

### noEntry 不需录入

### notNull 不为空

### required 必须录入

### case 大小写

![7b8ffa21-2363-4850-b441-85d542d7aeb2-Untitled.png](image/7b8ffa21-2363-4850-b441-85d542d7aeb2-Untitled.png)

设置字段录入时候的属性，设置为大写，录入字母时自动转化为大写

### hidden 隐藏

![a0282cbe-a442-4083-8f4b-834534731419-Untitled.png](image/a0282cbe-a442-4083-8f4b-834534731419-Untitled.png)

设置后字段依然存在，但是用户无法看到此字段

### image 图片（buttonEdit使用zoom）

### action （buttonEdit 使用controlp）

![25ea3ac6-491d-4d82-8bb5-d51175cc3195-Untitled.png](image/25ea3ac6-491d-4d82-8bb5-d51175cc3195-Untitled.png)

![53f0472b-027a-4c45-b12b-11a2e1a84835-Untitled.png](image/53f0472b-027a-4c45-b12b-11a2e1a84835-Untitled.png)

只有ButtonEdit控件需要设置这两个数量，image设置开窗按钮的图片，action 是控制什么时候出发开窗这个动作

### items （下拉框等空间使用）

![eaaef2e4-cb24-46c5-80f8-34ebb6fa8b8a-Untitled.png](image/eaaef2e4-cb24-46c5-80f8-34ebb6fa8b8a-Untitled.png)

下拉框空间中，可以通过items选项设置下拉框可以使用的元素

### valueCheded、valueUncheked （单选框控件使用）

![e74c33bd-d483-462a-b76b-86fe906142eb-Untitled.png](image/e74c33bd-d483-462a-b76b-86fe906142eb-Untitled.png)

单选框，选中和未选中可以设置一个值，当选择时为Y，未选中为N。默认为1和0。

### text （单选框等控件使用） 字段名称

![99590474-2e68-4ac9-a5de-fd9b380bfc95-Untitled.png](image/99590474-2e68-4ac9-a5de-fd9b380bfc95-Untitled.png)

单选框还可以设置text，会显示到单选框后

# Tab Order 默认顺序

![d67dda5a-7ad5-4fa7-ad3e-10e5b83e2526-Untitled.png](image/d67dda5a-7ad5-4fa7-ad3e-10e5b83e2526-Untitled.png)

Tab Order控制在输入时，字段的顺序。当没有4gl代码强制控制字段顺序时，按**entry**或者**tab**键，会按照此序号顺序依次录入。

# 布局

![568773e3-d7cb-4ce4-b022-f9b827b76e9a-Untitled.png](image/568773e3-d7cb-4ce4-b022-f9b827b76e9a-Untitled.png)

多个容器在同一个层级的时候，需要将他们设置一个布局，垂直或者水平显示。

![9d23cd65-14cf-4308-9a08-7f75ed3615a7-Untitled.png](image/9d23cd65-14cf-4308-9a08-7f75ed3615a7-Untitled.png)

如果不小心设置错，可以点击布局 **Break Layout**后重新设置

