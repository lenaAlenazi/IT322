
insert into Book 
values(001001,'Cornerstone Digital','Harper Lee','available','Kill a Mockingbird');

insert into Book 
values(001011,'bentley magazine','Charles Dickens','available','Oliver Twist');

insert into Book 
values(001111,'Roberts Brothers','Louisa May Alcott','not available','little women');

--view--
create view vBookStatus 
as select B_NAME, B_AUTHOR, B_STATUS
from BOOK where B_STATUS ='available';
--select--
select * 
from vBookStatus 