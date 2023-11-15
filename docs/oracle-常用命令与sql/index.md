# oracle 常用命令与SQL



## 清楚查询缓存

```sql
ALTER SYSTEM FLUSH SHARED_POOL;
ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM FLUSH GLOBAL CONTEXT;
```

## 分析表结构

```sql
--① 分析表的所有字段，所有索引，所有索引字段。其中：① = ②
analyze table student compute statistics;  
--② 分析表的所有字段，所有索引，所有索引字段。其中：① = ②
analyze table student compute statistics for table for all indexes for all columns;   
--③ 只分析所有有索引的字段
analyze table student compute statistics for table for all indexes for all indexed columns;  

--④ 抽样估算法
analyze table student estimate statistics sample 20 percent;

--⑤ 删除分析数据
analyze table student delete statistics;
analyze table student delete statistics for table for all indexes for all indexed columns; 

--查看表的统计信息
select table_name,num_rows,blocks,empty_blocks from user_tables where table_name='student';

analyze table glaq_t compute statistics;
```

## 优化器

- 优先查询前25笔

```sql
SELECT /*+ FIRST_ROWS(25) */ employee_id, department_id
FROM   hr.employees
WHERE  department_id > 50;
```

- 强制走索引

```sql
SELECT /*+index(a)*/ * FROM sfb_file 
LEFT JOIN sfa_file ON sfa01= sfb01 
LEFT JOIN ima_file a ON a.ima01 = sfb05
LEFT JOIN ima_file b ON b.ima01 = sfa03
LEFT JOIN ima_file c ON c.ima01 = sfa27
```

## 查询被删除的表

```sql
select object_name,original_name,partition_name,type,ts_name,createtime,droptime
from recyclebin;
```

- 恢复删除的表

```sql
flashback table test_drop to before drop;或
flashback table "BIN$hgcd$0" to before drop;
```

## 清理临时表空间

```sql
set linesize 132;
set pagesize 0;
set timing off;
spool drop_tables.sql;
SELECT 'drop table '||OWNER||'.'||TABLE_name||' purge;' FROM dba_tables WHERE tablespace_name='TEMPTABS';
spool off;
@drop_tables.sql;
```

## 查询某个时间之前的表状态（闪回）

```sql
select * from sfb_file
as of timestamp to_timestamp('2021-09-22 15:30:00','yyyy-mm-dd hh24:mi:ss')
```

## 查询单个table占用磁盘空间

```sql
select * from (
  select t.tablespace_name,t.owner, t.segment_name, t.segment_type, sum(t.bytes / 1024 / 1024) mb
  from dba_segments t
  where t.segment_type='TABLE'
	AND tablespace_name ='TEMPTABS'
  group by t.tablespace_name,t.OWNER, t.segment_name, t.segment_type
) t
order by t.mb desc;
```



## 在备份中仅恢复部分表

- 准备号dmp备份文件

- 建立临时测试库

```shell
sqlplus system/manager@topprod
   create user test1 identified by test1 default tablespace dbs1;
   grant connect,resource to test1;
   commit;
```

- 恢复表

```shell
imp system/manager@topprod file=/u3/backup/Wed/exp_KT_20210203.dmp 
 fromuser=kt touser=test1 tables=gen_file,eci_file
```

## 增加表空间

- 命令查询表空间是否足够

- 查询表空间文件位置

- 增加合适大小表空间文件

```shell
alter tablespace xx add datafile 'xxx.dbf' size 4G;
```


