-- (1) get the number of words or numbers out of a string (count everything except spaces) --------
select regexp_count(<input-string>, '[^ ]+');
-- eg. input-string:'test   string 123' = 3

    /*DIGRESSION: HOW TO USE THIS STATEMENT IN PL/SQL TO ACCESS ALL WORDS/NUMBERS FROM A TEXT*/
    for idx1 in 1..regexp_count(<input-string>, '[^ ]+') 
    loop
      l_word := regexp_substr(<input-string>, '[^ ]+', 1, idx1);
      ...
    end loop;

-- (2) checking an input string -------------------------------------------------------------------
select regexp_like(<input-string>, '^[a-z0-9 ]+$');
-- eg. input-string:'test   string 123' = true
-- eg. input-string:'TEST   string 123' = false

  /*DIGRESSION: HOW TO USE THIS STATEMENT IN PL/SQL TO ACCESS ALL WORDS/NUMBERS FROM A TEXT*/
  if regexp_like(<input-string>, '^[a-z0-9 ]+$') then
    ...
  else
    raise;
  end if;