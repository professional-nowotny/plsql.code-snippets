drop table if exists log_table;
create table log_table (
  id                  number(10)
 ,log_level           varchar2(20 char)
 ,log_source          varchar2(256 byte)
 ,log_message         varchar2(2000 char)
 ,log_error_stack     varchar2(2000 byte)
 ,log_error_backtrace varchar2(32767 byte)
 ,created_by          varchar2(50 char)
 ,created_on          timestamp(6)
);