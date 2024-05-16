# 效能常规处理流程



# 效能常规处理方法

## 大量作业都卡顿

当客户反馈所有作业都卡顿时，应当先检查服务器得基本状态，并保留截图，以便后面反馈给SE。

可检查得项目如下：

1. 表空间状况和磁盘使用情况

    - 已使用百分比，若将近100%，请截图提交SE处理。

    -  的控件使用情况，如超过90%可以尝试增加后再查看系统卡顿情况。

    - 表空间使用情况，使用超过90%和可用连续空间不足10M，都会导致作业使用卡顿，增加表空间后再查看卡顿情况。

1. 检查系统负载情况

    运行命令`top`后按`c`

    - 命令关闭）后再查看效能。

    - 数量如果超过5，表示系统负载很大。遇到这周情况请直接截图提交SE。

1. 检查CPU，内存登占用情况

    - cpu（s）：cpu 总使用率（不大于40%为负载正常）

    - 使用不多，代表内存空间足够

    > 不建议测试IO性能，测试过程中可能导致正常运行进程闪退，如果怀疑可以交由SE处理

1. 检查数据库响应时间

    ```sql
CREATE TABLE test_t (test001 VARCHAR(20));
DROP TABLE test_t;
```

    - 处理。

    - 检查AP和DB的网络连接速度

- <code>ps -ef|grep ora_smon</code>

    运行命令 `ping $FGLSERVER` 检测网络延迟，若`time` 时间超过0.3ms，需要注意网络延迟，如果数值特别高超过300ms，请直接联系客户，请客户先解决网络问题。
需注意

## 个别作业效能分析步骤

可按照下面步骤排查：

1. 判断是否需要清除ORACLE缓存

    直接执行作业，如果执行速度和客户反馈的不一样，例如：客户反馈审核要2分钟，还原后重新审核只要几秒钟。

    这个时候需要执行一下清除ORACLE缓存的语句，清除复杂SQL的缓存，之后再继续测试效能。

```sql
ALTER SYSTEM FLUSH SHARED_POOL;
ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH GLOBAL CONTEXT;
```

1. 使用效能工具分析作业情况

    - 工具运行作业分析即可

    - <code>FGLSQLDEBUG</code>

    运行下面两个命令，开启日志开启后，运行命令会将每个连接数据库语句执行状况在后台显示出来。

    `FGLSQLDEBUG=9`

    `export FGLSQLDEBUG`

    指定日志目录运行作业

    `exe2 aapt110 >> aapt110.lixwz.log 2>&1`

    作业运行后关掉，运行一下命令开始分析日志

    `$FGLRUN $DS4GL/bin/fgldebug.42r aapt110.lixwz.log`

    <aside>
💡 目录下若没有 fgldebug相关文件，需要先将效能工具相关文件上传到此目录，并运行chmod 777 fgldebug* 给与运行权限。
</aside>

1. 分析效能工具执行结果

RUN_TIME 为总运行时间，AVG_TIME为平均一次运行时间，主要关注这两列。
- 在进行sql分析之前，先对比标准主机，是否有追单。也关注下相关表索引是否和标准主机一致。
- 平均运行时间长，可根据`PROG_NAME`和`RUN_LINE` 抓取到运行的sql，进行`SQL TRACE`分析优化
- 平均运行时间正常，总运行时间长，即单个sql运行次数比较多。程序逻辑需要调整，例如：将`FOREACH` 操作改成临时表操作，借助数据库完成资料处理。

## SQL TRACE 分析

使用`plsql`按`F5`进入`SQL TRACE`

- 索引查询

- 修改一下，可能就不走索引查询，查询时间也增加了很多。

### 导致索引失败

1. 索引字段使用函数，如：`substr(ima01,1,2)='10'`

1. 新建表索引信息还未建立完成，`analyze table ima_file compute statistics;` 运行分析一下

1. 使用`<>`、`not in` 、`not exist`

1. 表的资料比较少

1. 单独的>、<

1. `like "%_"` 百分号在前

1. 单独引用复合索引里非第一位置的索引列，例如：索引为`(ima01,ima02,ima03)`条件为ima01 = 'MISC' ima02 ='MISC' ima03 = 'MISC' `ima02 = 'MISC'`

1. 字符型字段为数字时在where条件里不添加引号,(自动走转换函数)

1. 当变量采用的是times变量，而表的字段采用的是date变量时.或相反情况

1. 索引失效，可以考虑重建索引，`rebuild online`

1. 索引列空值

1. 查询资料已超过总资料一定比例，默认是30%

### 改写部分sql

1. `not in` 、`in` 、`not exist` 、`exist`
可以用`left join` 或者 `inner join` 相互替代，那种效率高用哪种。

1. 增加条件

条件前置，避免查出资料太多

1. `UPDATE` 优化
复杂条件的`UPDATE`语句，可以优化为`MERGE`方式。

```sql
--优化前
UPDATE q802_cfc_tmp o
    SET o.sum_qc= (
       SELECT NVL(SUM(cfc15*cfc18),0) FROM cfc_file c1
        WHERE(c1.cfc05<2021 OR (c1.cfc05=2021 AND c1.cfc06<9))
          AND c1.cfc21=0 AND c1.cfc22 =0 AND c1.cfc01=1
          AND c1.cfc07 = o.cfc07 AND c1.cfc11 = o.cfc11 AND c1.cfc17 = o.cfc17 )


```

```sql
--优化后
MERGE INTO q802_cfc_tmp c1 USING (
       SELECT cfc07,cfc11,cfc17,NVL(SUM(cfc15 * cfc18), 0) sum_qc
        FROM cfc_file
        WHERE( cfc05 < 2021
                OR (
                    cfc05 = 2021
                    AND cfc06 < 9
                )
            )
            AND cfc21 = 0
            AND cfc22 = 0
            AND cfc01 = 1
        GROUP BY cfc07,cfc11,cfc17
    ) o
    ON (  c1.cfc07 = o.cfc07 AND c1.cfc11 = o.cfc11 AND c1.cfc17 = o.cfc17 )
    WHEN MATCHED  THEN UPDATE SET c1.sum_qc = o.sum_qc


```

1. 临时表增加索引，执行中分析表

临时表处理的资料比较多时，可以适当增加索引

`CREATE INDEX xcck_tmp_i02 ON xcck_tmp (xcckld,xcck003,xcck004,xcck005,xcck047)`

如果是`INSERT`，`UPDATE`，`DELETE`语句比较卡顿还可以在执行前分析一下表，看效能是否改善

- T100 直接运行函数

    `cl_db_generate_analyze("xcck_tmp")`

- TOPGP 可以使用下列命令

    `EXECUTE IMMEDIATE "analyze table xccd_t estimate statistics"`

## 案例分享

### 执行次数过多

平均执行时间0.06左右，不算高，但执行次数多达5W多次。
拉取其中sql分析

```sql
SELECT MAX(sfe04),MIN(sfe04)
  INTO g_tc_xea[g_cnt].hp_fddrq,g_tc_xea[g_cnt].hp_scfddrq
  FROM sfe_file,sfb_file
 WHERE sfbud02 = g_tc_xea[g_cnt].tc_xea01
   AND (sfb01 LIKE '538%' OR sfb01 LIKE '540%')
   AND sfb01 = sfe01


```

- 没有索引，将sfbud02增加索引，效果并不好（增加索引后效果不好记得删除）

- ，但无法进行下一步优化

-  是直接通过临时表取值，可以考虑直接将需要的字段再中间中处理

所以将所有`SELECT`语句改为更新临时表字段形式，然后`FOREACH`直接取值即可（临时表可能需要增加字段）

- 执行前先更新中间表

- 优化后，总执行时间已经减少了很多。

- 只需要执行一次，时间在0.1秒。

### 流程调整优化

用户反馈，此作业批量抛转时，速度很慢。

1. 查询需要1分多钟

1. 查询出结果后，勾选收款单号，每次都需要转圈很长时间才可以继续勾选

-  形式，速度有所改善，保留。

- 发现每次勾选收款单号之后，都会重新运行一遍单身显示得函数，所以导致批量抛转操作很慢。注释掉勾选后重新查询得逻辑，速度明显快很多，勾选不再需要等待。

<aside>
💡 客制作业经常出现此类问题，测试时资料比较少，被忽略掉，这类问题优化时有限考虑mark掉不必要得流程。
</aside>


