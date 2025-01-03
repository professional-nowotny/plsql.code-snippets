## MyLogger
> MyLogger is a lightweight PL/SQL logger

### Structure
This tool includes four files:
1. package specification of the logger
2. package body of the logger
3. ddl statement to create the corresponding log-table
4. package specification for general settings (is used for the logger to set the logging level)

### Features
* supported log level: 
  * trace
  * debug
  * info
  * warning
  * error
* make use of: 
  * dbms_utility.format_error_stack
  * dbms_utility.format_error_backtrace
  <br>[For more information about these functions refer to the [Oracle Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/19/lnpls/plsql-error-handling.html#GUID-7E0CDD98-D31C-4745-B819-B5C5E1DF90A8)]