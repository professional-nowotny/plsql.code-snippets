create or replace package myutplsql-template is

  --%suite(heading 2)
  --%suitepath(heading 1)
  --%rollback(manual)
   
  --%context(name of a test collection to a function or procedure)
   
    --%test
    procedure ut_...;
   
    --%test
    procedure ut_...;

    --%test
    --%disabled(to be developed)
    procedure ut_...;

  --%endcontext
  
  --%context(name of a test collection to a function or procedure)
   
    --%test
    procedure ut_...;
   
	...

  --%endcontext
  
	...
	
end;