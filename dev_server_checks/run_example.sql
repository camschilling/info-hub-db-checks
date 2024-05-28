/*
From within Azure Data Studio, `enable SQLCMD`, hit run.
Add or remove scripts that should be run following the approach below:
*/

:r dev_server_checks\existence_checks_views.sql
:r dev_server_checks\existence_checks_tables.sql
:r dev_server_checks\count_checks.sql
:r dev_server_checks\shape_checks.sql