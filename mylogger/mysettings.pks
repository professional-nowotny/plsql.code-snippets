create or replace package mysettings AS

  g_c_log_level_id  constant number(1) := 0;    -- 0=TRACE / 1=DEBUG / 2=INFO / 3=WARNING / 9=ERROR

end;