create or replace package body mytimer as

  gc_timer_name          varchar2(10) := 'default';
  gc_timer_lap_extension varchar2(20) := '$$lap';

  type timer_type is table of timestamp(6) index by varchar2(200);
  g_timer timer_type;

  procedure set_timer (pi_timer_name in varchar2) 
  as
  begin
    if pi_timer_name is not NULL
    then
      g_timer(pi_timer_name) := localtimestamp;
    end if;
  end;
  
  procedure set_timer
  as
  begin
    set_timer(gc_timer_name);
  end;

  function get_timer_lap (pi_timer_name in varchar2) return varchar2
  as
    l_return_lap varchar2(200);
    l_timer_lap  varchar2(20) := pi_timer_name || gc_timer_lap_extension;
  begin
    if g_timer.exists(pi_timer_name)
    then
      if g_timer.exists(l_timer_lap)
      then
        --recurring lap
        l_return_lap := localtimestamp - g_timer(l_timer_lap);
        g_timer(l_timer_lap) := localtimestamp;
      else
        --first lap
        l_return_lap := localtimestamp - g_timer(pi_timer_name);
        g_timer(l_timer_lap) := localtimestamp;
      end if;
    else
      return 'unknown timer [' || pi_timer_name || ']';
    end if;

    return l_return_lap;
  end;

  function get_timer_lap return varchar2
  as
  begin
    return get_timer_lap (gc_timer_name);
  end;

  function stop_timer (pi_timer_name in varchar2) return varchar2
  as
  begin
    if g_timer.exists(pi_timer_name)
    then
      return localtimestamp - g_timer (pi_timer_name);
    else
      return 'unknown timer [' || pi_timer_name || ']';
    end if;
  end;

  function stop_timer return varchar2
  as
  begin
    return stop_timer (gc_timer_name);
  end;

end mytimer;
/