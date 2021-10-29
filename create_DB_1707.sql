--Loan--
create table LOAN(
L_call_number number(10),
L_expiry_resrvation date,
L_member_request varchar(20),
L_time_resrvation number(10),
CONSTRAINT L_call_number_pk PRIMARY KEY(L_call_number));

--loan status--
create table LOAN_STATUS (
LS_call_number number(10),
LS_expiry_resrvation date,
LS_status varchar2(10),
CONSTRAINT LS_expiry_resrvation PRIMARY KEY(LS_expiry_resrvation),
CONSTRAINT LS_call_numberFK FOREIGN KEY(LS_call_number) REFERENCES LOAN (L_call_number));


--branch--
Create table Branch( 
B_ID number(10),
B_name varchar(10),
B_phone number(10),
BLoan_CallNumber number(10), 
CONSTRAINT B_ID_pk PRIMARY KEY(B_ID), 
CONSTRAINT BLoan_CallNumber_fk FOREIGN KEY(BLoan_CallNumber) REFERENCES LOAN(L_call_number));

--branch_loc--
Create table Branch_LOC( 
BL_ID number(10),
BL_Location varchar(10),
CONSTRAINT B_ID_pk PRIMARY KEY(B_ID));


--JOURNAL--
Create table JOURNAL( 
J_CallNumber number(10),
J_Title varchar2(10),
J_Availability varchar2(15),
CONSTRAINT J_CallNumber_pk PRIMARY KEY(J_CallNumber)); 

--JOURNAL_BRUNCH--
Create table JOURNAL_BRUNCH( 
JB_CallNumber number(10),
JB_ID number(10),
CONSTRAINT  JB_CallNumber_fk FOREIGN KEY(JB_CallNumber) REFERENCES JOURNAL(J_CallNumber),
CONSTRAINT  JB_ID_fk FOREIGN KEY(JB_ID) REFERENCES Branch(B_ID));


-- ·≈hesis --
Create table Thesis(
T_number number(3),
T_Author varchar2(20),
T_location varchar2(20),
T_Description varchar2(20),
CONSTRAINT T_number_pk PRIMARY KEY(T_number));

--thesis_branch--
Create table thesis_branch (
TB_ID  number(10),
TB_Number number(3),
Constraint TB_ID_FK Foreign key (TB_ID) References Branch (B_ID),
Constraint TB_Number Foreign key (TB_Number) References thesis (T_number));


--Room--
Create table Room(
R_room_No number(4),
R_duration_time  varchar2(20),
R_location varchar2(20),
R_type varchar2(20),
CONSTRAINT R_room_No_pk PRIMARY KEY(R_room_No));

--Room_branch--
create table Room_Branch(
RB_RoomNo number(4),
RM_ID number(10),
CONSTRAINT   RB_RoomNo FOREIGN KEY(RB_RoomNo) REFERENCES Room (R_room_No),
CONSTRAINT  RM_ID FOREIGN KEY(RM_ID) REFERENCES Branch(B_ID));

--Room status--
create table ROOM_STATUS (
R_RNO NUMBER(10),
R_DURATIONTIME varchar2(20),
R_status varchar2(10),
CONSTRAINT R_DURATIONTIMEPK PRIMARY KEY(R_DURATIONTIME),
CONSTRAINT  R_RNOFK FOREIGN KEY(R_RNO) REFERENCES ROOM(R_room_No));


--Record--
Create table RECORD( 
R_ID number(10),
R_Location varchar(10),
R_Publisher varchar(15),
R_Description varchar(20),
CONSTRAINT R_ID_pk PRIMARY KEY(R_ID));

--REC_BRANCH--
Create table REC_BRANCH( 
RB_ID NUMBER(10),
BRA_ID number(10),
CONSTRAINT  RB_IDFK FOREIGN KEY(RB_ID) REFERENCES RECORD(R_ID),
CONSTRAINT  BRA_IDFK FOREIGN KEY(BRA_ID) REFERENCES Branch(B_ID)) ;


--Book--
Create table Book(
Book_ID  number(10),
B_Publisher varchar2(20),
B_Author varchar2(20),
B_status varchar2(20),
B_name varchar2(20),
CONSTRAINT Book_ID_pk PRIMARY KEY(Book_ID));

--BOOK_BRUNCH--
Create table BOOK_BRUNCH( 
Bk_ID number(10),
BB_ID number(10),
CONSTRAINT  BB_ID_fk FOREIGN KEY(Bk_ID) REFERENCES Book(Book_ID),
CONSTRAINT  BB_ID_fk FOREIGN KEY(BB_ID) REFERENCES Branch(B_ID));

--Laon_book--
Create table Laon_book( 
B_ID number(10),
L_CALLNUMBER number(10),
CONSTRAINT  B_IDFG FOREIGN KEY(B_ID) REFERENCES Book(Book_ID),
CONSTRAINT  L_CALLNUMBERFG FOREIGN KEY(L_CALLNUMBER) REFERENCES LOAN(L_CALL_NUMBER));


--collection--
Create table COLLECTION ( 
C_Name varchar2(20),
C_Type varchar2(10),
C_Serial_no  number(4),
Constraint pk_C_Name Primary key (C_Name ));

--COLLECT_BRANCH--
Create table COLLECT_BRANCH( 
CB_name varchar2(15),
CB_ID number(10),
CONSTRAINT  CB_name_fk FOREIGN KEY(CB_name) REFERENCES COLLECTION(C_name),
CONSTRAINT  CB_ID_fk FOREIGN KEY(CB_ID) REFERENCES Branch(B_ID)) ;


--member--
Create table member(
M_ID number(10),
M_Fname varchar2(20),
M_Lname varchar2(20),
M_Birth date,
M_ContactNo number(10),
M_Expiry date,
M_DateJoin date,
M_type varchar2(20),
Constraint M_ID_pk Primary key(M_ID));

--MEMBER_STATUS--
create table MEMBER_STATUS (
MS_ID NUMBER(10),
M_EXPIRY DATE,
M_STATUS varchar2(10) ,
CONSTRAINT M_EXPIRYPK PRIMARY KEY(M_EXPIRY),
CONSTRAINT MS_IDFK FOREIGN KEY(MS_ID) REFERENCES member(M_ID));

--mem_Address--
Create table MEM_ADDRESS (
M_ADDRESS  number(10),
M_ID number(10),
CONSTRAINT   M_ADDRESS_pk primary KEY(M_ADDRESS),
CONSTRAINT  M_ID_fk FOREIGN KEY(M_ID) REFERENCES member(M_ID));

--Member_Branch--
Create table Member_Branch( 
MB_ID number(10),
NB_ID number(10),
CONSTRAINT MB_IDFK  FOREIGN KEY(MB_ID) REFERENCES member(M_ID),
CONSTRAINT NB_IDFK FOREIGN KEY(NB_ID) REFERENCES Branch(B_ID)) ;


--Fine--
Create table Fine( 
Fine_CallNumber number(10),
F_Amount number(10),
F_Discriotion varchar2(20),
F_member varchar2(20),
F_status varchar2(20),
CONSTRAINT Fine_CallNumber_Fk FOREIGN KEY(Fine_CallNumber) REFERENCES LOAN(L_call_number));


---PREVILAGE--
Create table PREVILAGE ( 
P_Previlage_No number(10),
P_Name varchar2(20),
P_LoanPeriod DATE, 
MaxNoOfItem number(10),
MaxNoOfRenewal number(10),
Prev_CallNumber number(10),
Constraint P_Previlage_No_pk Primary key ( P_Previlage_No ),
Constraint Prev_CallNumber_fk foreign key(Prev_CallNumber) references LOAN(L_call_number));

--inser--
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


--select command--
select * 
from vBookStatus ;


--user add--
alter session set "_oracle_script"= true; 
create user userit identified by user;
grant connect to userit;
grant SELECT ON vBookStatus to userit;
select * from SYS.vbookstatus;
