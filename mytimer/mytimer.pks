create or replace package mytimer as

  procedure set_timer (pi_timer_name in varchar2);
  procedure set_timer;

  function get_timer_lap (pi_timer_name in varchar2) return varchar2;
  function get_timer_lap return varchar2;

  function stop_timer (pi_timer_name in varchar2) return varchar2;
  function stop_timer return varchar2;

end mytimer;
/