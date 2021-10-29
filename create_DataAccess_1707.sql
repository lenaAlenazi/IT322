alter session set "_oracle_script"= true; 

create user userit identified by user;

grant connect to userit;
grant SELECT ON vBookStatus to userit;