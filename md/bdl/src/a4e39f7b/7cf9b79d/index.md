

## 布局

![e71c4af7-8285-4331-bddc-72a09de6e8b6-Untitled.png](image/e71c4af7-8285-4331-bddc-72a09de6e8b6-Untitled.png)

布局有两种方式，垂直和水平，多个容器要放在一个布局中



  

    ![f0dd70a3-3817-48ff-905f-1a7d96834c20-Untitled.png](image/f0dd70a3-3817-48ff-905f-1a7d96834c20-Untitled.png)

  

    ![60f24ffa-8760-46e0-8b01-e75b2c59a758-Untitled.png](image/60f24ffa-8760-46e0-8b01-e75b2c59a758-Untitled.png)

## 容器

![607cbc0f-4dd4-4c8d-bd72-0082583e0bdb-Untitled.png](image/607cbc0f-4dd4-4c8d-bd72-0082583e0bdb-Untitled.png)

|名称|功能说明|
|:-|:-|
|Folder|以切页方式的空白画布|
|Grid|简易空白画布|
|ScrollGrid|有卷轴的空白画布|
|Table|以表格方式显示阵列资料|
|Tree|以层次结构展示的阵列资料|



  

  

  

  

  

  

- Folder

当摆放元件空间不足时（或是需要滚动画面，操作上较麻烦时），即可使用切页的功能，以资料夹的形式将资料性质相近的栏位，切分在同样的 page 当中。

制作时可在页签位置以鼠标右键新增、删除页面。

编译时若该页签内没有任何元件，则编译会失败，且系统会显示有空白页签存在。 页签上显示字符串仍需在属性视窗指定。



  

    Genero Studio 

    ![0c843996-27cc-4387-9b0b-a7f346e9623a-Untitled.png](image/0c843996-27cc-4387-9b0b-a7f346e9623a-Untitled.png)

  

    画面预览

    ![c95b0e1c-21d6-4265-a7ce-0aca7f4334f2-Untitled.png](image/c95b0e1c-21d6-4265-a7ce-0aca7f4334f2-Untitled.png)

- Grid

可将此容器视为一块空白的画布，布置在上方的元件都可以显示在画面相对位置上。

Grid 只能处理`非阵列资料`。Grid 不可以被安排在其他 Grid 容器之内。



  

    Genero Studio 

    ![f5310bd0-ffab-4bea-a714-5d7969b921cf-Untitled.png](image/f5310bd0-ffab-4bea-a714-5d7969b921cf-Untitled.png)

  

    画面预览

    ![92428006-a102-4f7e-b053-89ae2ee55fba-Untitled.png](image/92428006-a102-4f7e-b053-89ae2ee55fba-Untitled.png)

- ScrollGrid

在 Genero Studio 中，此容器与 Grid 相同，均作为处理`非阵列资料`用。与 Grid 容器的差异仅在可使用滚动轴，可以滚动画面。不能用于显示阵列资料。



  

    Genero Studio 

    ![2da1ec19-2acc-4367-bbaf-f4d18e4cab22-Untitled.png](image/2da1ec19-2acc-4367-bbaf-f4d18e4cab22-Untitled.png)

  

    画面预览

    ![23470bc7-4f99-46e6-a694-21442e74a9ae-Untitled.png](image/23470bc7-4f99-46e6-a694-21442e74a9ae-Untitled.png)

- Table

使用 TABLE 即是以表格方式显示阵列资料，此方式有许多的优点，这些优点都是系统提供的，不需要额外再撰写程序码即可使用；

包含：动态排序、栏位隐藏、显示或移动等。 在设计时期改变 Table 高度时，会自动增减资料的行数。 在 Table 物件上按鼠标右键，在弹出式选单可以新增或移除栏位。

另外可以直接以鼠标拖曳改变栏位的顺序。

编写时须注意：

  - 使用 TABLE 物件时，资料（Record）一定是横列，没有直垂直排列。

  - 编写时须到各栏位的属性中进行形态、对应数据库等资料的设定或变更。



  

    Genero Studio 

    ![c73b573b-5471-474c-b5ab-a1e21743d48d-Untitled.png](image/c73b573b-5471-474c-b5ab-a1e21743d48d-Untitled.png)

    

  

    画面预览

    ![d188a914-fb01-4616-bda5-4e7913f07fc9-Untitled.png](image/d188a914-fb01-4616-bda5-4e7913f07fc9-Untitled.png)

    

- ~~Tree~~

Tree 树状图预览时和 Table 是一样的，当有资料的资料，树状图是有层级结构的。

当节点展开时，可以展开上下级结构。



  

    Genero Studio 

    ![c2f21f39-5983-4d39-b13c-67fbc74ca43a-Untitled.png](image/c2f21f39-5983-4d39-b13c-67fbc74ca43a-Untitled.png)

  

    画面预览

    ![8869601f-6452-48fa-8afa-6cddfed0976e-Untitled.png](image/8869601f-6452-48fa-8afa-6cddfed0976e-Untitled.png)

## 控件

- Label

定义显示值用的栏位，可区分为下列三类。

  - StaticLabel

    静态文字标签，可设定宽度、 前景色等。

  

    

      ![cf7b372a-b6e0-45ef-9a10-0c4021f668a5-Untitled.png](image/cf7b372a-b6e0-45ef-9a10-0c4021f668a5-Untitled.png)

    

      ![7a35e226-a728-45a5-8de3-df7fcf21c092-Untitled.png](image/7a35e226-a728-45a5-8de3-df7fcf21c092-Untitled.png)

  - Text

    StaticLabel 可以和 Text 相互转换。Text 字符数自动决定大小的基本静态文字标签。无法自行设定宽度。

    ![a90d95dd-4ea8-4ceb-939f-d1f09087cd73-Untitled.png](image/a90d95dd-4ea8-4ceb-939f-d1f09087cd73-Untitled.png)

  - FormFieldLabel

    动态标签，代码可以控制值的显示

  

    

      ![acd78964-0e5d-408f-9cac-3893e36eead3-Untitled.png](image/acd78964-0e5d-408f-9cac-3893e36eead3-Untitled.png)

    

      ![7731963b-8569-4761-85bd-f87889b893cb-Untitled.png](image/7731963b-8569-4761-85bd-f87889b893cb-Untitled.png)

- Edit

  定义一个编辑栏位。属于 FormField 物件，可设定与资料栏位的关联。

  

    

      ![e674dd69-f127-4601-bc53-a031172b64c6-Untitled.png](image/e674dd69-f127-4601-bc53-a031172b64c6-Untitled.png)

    

      ![88a046b4-c2c0-4691-805e-548ed75e426c-Untitled.png](image/88a046b4-c2c0-4691-805e-548ed75e426c-Untitled.png)

- ButtonEdit

  定义一个编辑栏位的元件，可透过右侧按钮以触发某一事件。通常用在串连与此栏位输入时有关的动作，例如查询合法可用资料等。

  

    

      ![267dbf66-a593-472e-850b-80cbca5616f6-Untitled.png](image/267dbf66-a593-472e-850b-80cbca5616f6-Untitled.png)

      

    

      ![4b8c52db-5d78-496f-bd6e-857ca1a44122-Untitled.png](image/4b8c52db-5d78-496f-bd6e-857ca1a44122-Untitled.png)

- ComboBox

  定义一个可利用下拉功能选值的编辑栏位，若输入资料只有几种值可供选择时，建议采用 RadioGroup 方式来限缩使用者可输入的内容（参阅 RadioGroup）。属于 FormField 物件，可设定与资料栏位的关联。

  

    

      ![12060c6d-1e78-4368-9e74-9d46c9b5a108-Untitled.png](image/12060c6d-1e78-4368-9e74-9d46c9b5a108-Untitled.png)

    

      ![db2981e1-938f-4b17-90cf-f1f81fb6279d-Untitled.png](image/db2981e1-938f-4b17-90cf-f1f81fb6279d-Untitled.png)

  选项对话视窗:

  可管理 ComboBox 的选项，也可以按字母顺序排列选项的 Text。

  ![89d529a3-e37d-4ec9-8e09-6bed742155d1-Untitled.png](image/89d529a3-e37d-4ec9-8e09-6bed742155d1-Untitled.png)

- DateEdit

  定义一个日期编辑，按右侧钮可带出 Client 端万年历选择视窗。日期显示格式由主机端 DBDATE 环境变量控制。

  

    

      ![697de885-74bd-4785-84a3-2198a9831375-Untitled.png](image/697de885-74bd-4785-84a3-2198a9831375-Untitled.png)

    

      ![9f0031f1-9a1a-4d68-8ffd-02c01342094b-Untitled.png](image/9f0031f1-9a1a-4d68-8ffd-02c01342094b-Untitled.png)

- CheckBox

  当栏位选项只有两种选择时（如：是或否，0 或 1，100 或 200 等），就可以采用此种输入型态执行输入。

  

    

      ![7666af02-6fad-4454-91fc-3dc1d784e894-Untitled.png](image/7666af02-6fad-4454-91fc-3dc1d784e894-Untitled.png)

    

      ![3bba0d60-ea50-4f29-9531-a0aa8be35be3-Untitled.png](image/3bba0d60-ea50-4f29-9531-a0aa8be35be3-Untitled.png)

- HLine

  水平分隔线

  

    

      ![6c4f3155-c9db-4946-8924-cc563add8106-Untitled.png](image/6c4f3155-c9db-4946-8924-cc563add8106-Untitled.png)

    

      ![0ca20be1-813f-40ed-b881-afcd500879ef-Untitled.png](image/0ca20be1-813f-40ed-b881-afcd500879ef-Untitled.png)

- TextEdit

  定义可编辑多行的栏位，输入长度当超过画面预留长度时，会自动出现卷轴。

  

    

      ![f78fe55f-9ace-48a3-9180-fe18ce9e6c07-Untitled.png](image/f78fe55f-9ace-48a3-9180-fe18ce9e6c07-Untitled.png)

    

      ![b870670a-23d7-4a4f-bb20-9053f830a70a-Untitled.png](image/b870670a-23d7-4a4f-bb20-9053f830a70a-Untitled.png)

- ~~Button~~

  定义一个按钮以触发某一 4GL 中已写定的 ON ACTION 段。

  建议除了特别的 ACTION 有需要在 Layout 内布置按键外，一般作业可不必布置.

  

    

      ![22e9ab7c-5200-4870-8de1-8e82155c229b-Untitled.png](image/22e9ab7c-5200-4870-8de1-8e82155c229b-Untitled.png)

    

      ![a5b6cd7f-c87e-4176-b3fa-7360f892550a-Untitled.png](image/a5b6cd7f-c87e-4176-b3fa-7360f892550a-Untitled.png)

- ~~RadioGroup~~

  定义一个可用选择方式输入资料的输入栏位，此种选择方式会将选项清单展示在画面上（ComboBox 不会展开显示，可参照 ComboBox 说明），故若需要采用此输入形态，要注意画面空间是否足够。

  

    

      ![45f9b3ad-f1ea-4ee5-9628-5f0e2a2327a2-Untitled.png](image/45f9b3ad-f1ea-4ee5-9628-5f0e2a2327a2-Untitled.png)

      ![d9334cec-8726-4757-90e3-eca1439e2f92-Untitled.png](image/d9334cec-8726-4757-90e3-eca1439e2f92-Untitled.png)

    

      ![1a11fd7d-f9ad-4952-badf-04e436cfea47-Untitled.png](image/1a11fd7d-f9ad-4952-badf-04e436cfea47-Untitled.png)

- ~~Canvas~~

  

    

      ![2cfbb3a9-ac54-4534-a90e-b8540090edb4-Untitled.png](image/2cfbb3a9-ac54-4534-a90e-b8540090edb4-Untitled.png)

    

      ![07c57d38-8a63-4356-9107-479c2b6843e3-Untitled.png](image/07c57d38-8a63-4356-9107-479c2b6843e3-Untitled.png)

- ~~ProgressBar~~

  

    

      ![4c5aa7e1-229f-4cf4-8349-d95cad54e068-Untitled.png](image/4c5aa7e1-229f-4cf4-8349-d95cad54e068-Untitled.png)

    

      ![b25ad8f1-0a36-4e80-9db5-74870f64053d-Untitled.png](image/b25ad8f1-0a36-4e80-9db5-74870f64053d-Untitled.png)

- ~~TimeEdit~~

  

    

      ![47c03e56-6d6b-43e8-981e-62cd81cceab2-Untitled.png](image/47c03e56-6d6b-43e8-981e-62cd81cceab2-Untitled.png)

    

      ![745a9702-5ce6-4432-8dc3-121489cbbcf5-Untitled.png](image/745a9702-5ce6-4432-8dc3-121489cbbcf5-Untitled.png)

- ~~Image~~

- ~~Slider~~

  

    

      ![dbfdebd2-da65-42e4-b43e-1ae1d370ad8d-Untitled.png](image/dbfdebd2-da65-42e4-b43e-1ae1d370ad8d-Untitled.png)

    

      ![1548104d-5fa4-4274-8be2-9d6a4b3f2a10-Untitled.png](image/1548104d-5fa4-4274-8be2-9d6a4b3f2a10-Untitled.png)

- ~~SpinEdit~~

  

    

      ![3f93bb5b-9b3c-4e7b-a670-43dbb0d473b2-Untitled.png](image/3f93bb5b-9b3c-4e7b-a670-43dbb0d473b2-Untitled.png)

    

      ![e6f7ce2e-f4be-40ad-b128-90337116e55f-Untitled.png](image/e6f7ce2e-f4be-40ad-b128-90337116e55f-Untitled.png)

- ~~WebComponent~~









