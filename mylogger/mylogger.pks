create or replace package mylogger as
   
   procedure trace   (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2);
   procedure debug   (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2);
   procedure info    (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2);
   procedure warning (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2);
   procedure error   (pi_log_message in varchar2, pi_log_user in varchar2, pi_log_source in varchar2);
   
end;