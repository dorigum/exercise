CREATE TABLE MEMBER (
    id VARCHAR2(20) NOT NULL PRIMARY KEY,
    Pwd VARCHAR2(20),
    Name VARCHAR2(20),
    eMail VARCHAR2(40),
    Age NUMBER(5),
    Gender VARCHAR2(5),
    height NUMBER(30,3),
    weight NUMBER(30,3),
    goalWeight Number(30,3)
);

insert into member values ('hkd','1234','È«±æµ¿','hkd@naverc.om',27,'³²',178.5,70,60);
insert into member values ('key','1234','Å°´Ù¸®','key@naverc.om',27,'³²',190.5,80.5,50);
insert into member values ('sch','1234','¼ºÃáÇâ','sch@naverc.om',27,'¿©',160.5,60.5,70);
insert into member values ('kjh','1234','±èÁöÇý','kjh@naverc.om',27,'¿©',160.5,58.5,50);



CREATE TABLE DayExercise (
    dayNo NUMBER(10) NOT NULL PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    year VARCHAR2(10),
    month VARCHAR2(10),
    exdate VARCHAR2(10),
    exName VARCHAR2(10),
    exWeight NUMBER(10),
    exMeter NUMBER(10), -- °Å¸® ½Ã°£ ¼Ó¼º Ãß°¡
    exTime NUMBER(10),
    exCount NUMBER(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id)
);

CREATE SEQUENCE SEQ_DayExercise_dayNo
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

SELECT * FROM DayExercise WHERE id='hkd' ORDER BY year, month, exdate desc


insert into member values ('kjh','1234','±èÁöÇý','kjh@naverc.om',27,'¿©',160.5,58.5,50);




CREATE TABLE food (
    FCode VARCHAR2(100) NOT NULL Primary key,
    FName VARCHAR2(100) NOT NULL,
    F_category VARCHAR2(50),
    servings Number (10,3),
    Kcal Number(10,3),
    Kcal_per_100 Number(10,3)
);

create table calendar(
    id VARCHAR2(20),
    FCode VARCHAR2(30),
    eYear VARCHAR2(10),
    eMonth VARCHAR2(5),
    eDate VARCHAR2(5),
    eAmt NUMBER(10,3),
    eTime VARCHAR2(20),
    CONSTRAINT FK_calander_member FOREIGN KEY (id) REFERENCES member (id),
    CONSTRAINT FK_calander_food FOREIGN KEY (FCode) REFERENCES food (FCode)
);


commit;
