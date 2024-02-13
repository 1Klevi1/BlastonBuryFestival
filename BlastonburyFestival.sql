CREATE TABLE Agent (
    agent_ID NUMBER(6,0)  PRIMARY KEY,  
    name varchar2(50) NOT NULL,
    surname varchar2(50) NOT NULL,
    email varchar2(50) NOT NULL,
    phone varchar2(50) NOT NULL
   
);

CREATE TABLE Band (
    band_Name varchar2(50)  PRIMARY KEY,  
    description varchar2(500) NOT NULL,
    agent_ID NUMBER(6,0)NOT NULL,
    foundation  DATE NOT NULL,
    FOREIGN KEY (agent_ID)  REFERENCES Agent(agent_ID)
   

);

CREATE TABLE Member (
    member_id NUMBER(6,0)   PRIMARY KEY,  
    band_Name varchar2(50) NOT NULL,
    name varchar2(50) NOT NULL,
    jobType  varchar2 (50 )NOT NULL,
    securityPass  NUMBER(1,0)NOT NULL,
    address varchar2(50) NOT NULL,
    FOREIGN KEY (band_Name)  REFERENCES Band(band_Name)
    

);

CREATE TABLE Stage(
    stage_number NUMBER(2,0) PRIMARY KEY,
    capacity NUMBER(5,0)NOT NULL,
    name varchar2(50) NOT NULL
);

CREATE TABLE Performance(
    performance_id NUMBER(6,0)  PRIMARY KEY,
    band_Name varchar2(50) NOT NULL,
    stage_number NUMBER(5,0)NOT NULL,
    startTime timestamp NOT NULL,
    FOREIGN KEY (band_Name)  REFERENCES Band(band_Name),
    FOREIGN KEY (stage_number)  REFERENCES Stage(stage_number)
    );


   
INSERT INTO Agent VALUES ( '000001','James','Timmons', 'JamesATimmons@teleworm.us','070 7358 1822');
INSERT INTO Agent VALUES ( '000002','Gideon ','Oosterlee', 'GideonOosterlee@armyspy.com','077 5734 3238');




INSERT INTO Band VALUES('Tiny Super','Tiny Super Band: Stories of B-sides 
and Rarities is an update of the "30 Trips Around the Sun" and "Hypeium Spazzinate" vinyl LP re-releases from our band ',
'000001',to_date('2008-06-17', 'yyyy-mm-dd'));

INSERT INTO Band VALUES('Hot Wild','Hot Wild Band will never stop playing together,
What: Nashville band Hot Wild Band has a new album of acoustic tracks, which includes a couple with Waylon Jennings and Eddy Arnold. ',
'000001',to_date('2017-11-23', 'yyyy-mm-dd'));

INSERT INTO Band VALUES('Crazy Mild','
“Watch Out:” will be their first ever mini-album, and was released in','000001',to_date('2018-08-13', 'yyyy-mm-dd'));

INSERT INTO Band VALUES('Greasy sharp','Greasy sharp music band will shoot the opening visuals of the film soon. 
It will also release the official look of the characters and their backstory to the audience.','000002',to_date('2021-03-26', 'yyyy-mm-dd'));

INSERT INTO Band VALUES('Radioactive','
Rolling Stone named "Radioactive", which held the record for most weeks charted on the Billboard Hot 100, the "biggest rock band of the year"','000002',to_date('2007-08-13', 'yyyy-mm-dd'));



    
--Tiny Super
INSERT INTO MEMBER VALUES('1','Tiny Super','Dylan','Vocalist','1','37 Glandovey Terrace');
INSERT INTO MEMBER VALUES('2','Tiny Super','Leon','Second singer','3','22 Bishopthorpe Road');
INSERT INTO MEMBER VALUES('3','Tiny Super','Mohammed','Rhythm Guitarist','2','9 Crown Street');
INSERT INTO MEMBER VALUES('4','Tiny Super','Lucas','Bassist','1','72 Church Way');
--Hot Wild
INSERT INTO MEMBER VALUES('5','Hot Wild','Morgan','Drummer','2','84 Bootham Terrace');
INSERT INTO MEMBER VALUES('6','Hot Wild','Harley','Pianist','3','52 Osborne Road');
INSERT INTO MEMBER VALUES('7','Hot Wild','Max','Songwriter','3','35 Bishopthorpe Road');
INSERT INTO MEMBER VALUES('8','Hot Wild','Kayleigh','Vocalist','1','41 Scotswood Road');
--Crazy Mild
INSERT INTO MEMBER VALUES('9','Crazy Mild','Keira','Drummer','2','72 Boar Lane');
INSERT INTO MEMBER VALUES('10','Crazy Mild','Charles','Pianist','3','20 Brackley Road');
INSERT INTO MEMBER VALUES('11','Crazy Mild','Corey','Songwriter','3','11 Consett Rd');
INSERT INTO MEMBER VALUES('12','Crazy Mild','Toby','Vocalist','1','1 Simone Weil Avenue');
--Greasy sharp
INSERT INTO MEMBER VALUES('13','Greasy sharp','Libby','Vocalist','1','58 Tadcaster Rd');
INSERT INTO MEMBER VALUES('14','Greasy sharp','Paige','Second singer','3','68 Bishopgate Street');
INSERT INTO MEMBER VALUES('15','Greasy sharp','Nathan','Rhythm Guitarist','2','8 Station Rd');
INSERT INTO MEMBER VALUES('16','Greasy sharp','Oliver','Bassist','1','53 Bootham Crescent');
--Radioactive
INSERT INTO MEMBER VALUES('17','Radioactive','Ankie','Drummer','2','86 Boar Lane');
INSERT INTO MEMBER VALUES('18','Radioactive','Francisco','Pianist','3','50 Fordham Rd');
INSERT INTO MEMBER VALUES('19','Radioactive','Catherine','Songwriter','3','36 York Road');
INSERT INTO MEMBER VALUES('20','Radioactive','Byron','Vocalist','1','22 Monks Way');



CREATE VIEW  AgentJobs
AS
SELECT  A.agent_ID  AS "AGENT", count(DISTINCT M.jobtype)AS "JOBTYPE"
FROM  Agent A JOIN Band B 
    ON (A.agent_ID=B.agent_ID) JOIN MEMBER M ON (B.band_Name=M.band_Name)
GROUP BY  A.agent_ID
WITH READ ONLY;

SELECT
    * FROM AgentJobs  ;
    GRANT SELECT ON AgentJobs TO dp15aad;
    
----------------------------------
--trigger
drop table tblCountDelete;
Select * from Agent;


CREATE TABLE tblCountDelete
        (countDelete number);
insert into tblCountDelete values('0');

CREATE OR REPLACE TRIGGER countDelete  
BEFORE 
DELETE 
ON Agent 
FOR EACH ROW 
begin
    UPDATE tblCountDelete SET countDelete = countDelete + 1;
    
END; 
Select * from tblCountDelete;

--Lets delete the 1st data 
    INSERT INTO Agent VALUES ( '000003','dummy ','data', 'lol@dummy.com','077 5734 3238');
    DELETE  from Agent WHERE agent_ID='000003' ;  
    

--Lets delete the 2nd data 
INSERT INTO Agent VALUES ( '000004','dummy ','data', 'lol@dummy.com','077 5734 3238');
DELETE  from Agent WHERE agent_ID='000004' ;


--Lets delete the 3d data 
INSERT INTO Agent VALUES ( '000005','dummy ','data', 'lol@dummy.com','077 5734 3238');
DELETE  from Agent WHERE agent_ID='000005' ;  
    

-----------------------------------------
    set serveroutput on
DECLARE 
countDelete NUMBER;
begin
--    INSERT INTO delete_user VALUES (:OLD.Agent_ID,:OLD.name,:OLD.surname,:OLD.email,:OLD.phone);
    
    SELECT COUNT(*) INTO countDelete FROM delete_user;
        
    dbms_output.put_line('countDelete: ' || countDelete); 

END;
    
    
    
    
    
    
--DROP TABLE Agent CASCADE CONSTRAINTS;
--DROP TABLE Band CASCADE CONSTRAINTS;
--DROP TABLE Performance CASCADE CONSTRAINTS;
--DROP TABLE Stage CASCADE CONSTRAINTS;
--DROP TABLE Member CASCADE CONSTRAINTS;









