create or replace package body mylogger as

  g_log_level_id number(1);
  g_log_user     varchar2(50 char);
  g_log_message  varchar2(2000 char);
  g_log_source   varchar2(256 byte);
   
  procedure log_writer 
  as
    l_log_level       varchar2(20 char);
    l_error_stack     varchar2(2000 byte);
    l_error_backtrace varchar2(32767 byte);
    pragma autonomous_transaction;
  begin

    if g_log_level_id >= mysettings.g_c_log_level_id THEN

      l_error_stack     := null;
      l_error_backtrace := null;

      CASE g_log_level_id
        when 0 then l_log_level       := 'TRACE';
        when 1 then l_log_level       := 'DEBUG';
        when 2 then l_log_level       := 'INFO';
        when 3 then l_log_level       := 'WARNING';
        when 9 then l_log_level       := 'ERROR';
                    l_error_stack     := dbms_utility.format_error_stack();
                    l_error_backtrace := dbms_utility.format_error_backtrace();              
      end case;

      insert into log_table (
        id
       ,log_level
       ,log_source
       ,log_message
       ,log_error_stack
       ,log_error_backtrace
       ,created_by 
       ,created_on)
      values (
        seq_log_table.nextval
       ,l_log_level
       ,g_log_source
       ,g_log_message
       ,l_error_stack
       ,l_error_backtrace
       ,g_log_user
       ,systimestamp(6));
      commit;
      
    end if;
  end log_writer;

  procedure trace (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2)
  as
  begin
    g_log_level_id := 0;
    g_log_user     := pi_log_user;
    g_log_message  := pi_log_message;
    g_log_source   := pi_log_source;
    log_writer();
  end trace;

  procedure debug (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2)
  as
  begin
    g_log_level_id := 1;
    g_log_user     := pi_log_user;
    g_log_message  := pi_log_message;
    g_log_source   := pi_log_source;
    log_writer();
  end debug;
  
  procedure info (pi_log_message in varchar2, pi_log_user in varchar2,  pi_log_source in varchar2)   
  as
  begin
    g_log_level_id := 2;
    g_log_user     := pi_log_user;
    g_log_message  := pi_log_message;
    g_log_source   := pi_log_source;
    log_writer();
  end info;

  procedure warning (pi_log_message in varchar2, pi_log_user in varchar2,  pi_log_source in varchar2)
  as
  begin
    g_log_level_id := 3;
    g_log_user     := pi_log_user;
    g_log_message  := pi_log_message;
    g_log_source   := pi_log_source;
    log_writer();
  end warning;
  
  procedure error (pi_log_message in varchar2, pi_log_user in varchar2,  pi_log_source in varchar2)
  as
  begin
    g_log_level_id := 9;
    g_log_user     := pi_log_user;
    g_log_message  := pi_log_message;
    g_log_source   := pi_log_source;
    log_writer();
  end error;
  
end;