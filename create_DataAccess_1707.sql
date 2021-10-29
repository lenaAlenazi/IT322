alter session set "_oracle_script"= true; 

create roles BookRole identified by user;

grant connect to BookRole;
grant SELECT ON vBookStatus to BookRole;
