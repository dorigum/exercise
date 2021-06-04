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

insert into member values ('hkd','1234','홍길동','hkd@naverc.om',27,'남',178.5,70,60);
insert into member values ('key','1234','키다리','key@naverc.om',27,'남',190.5,80.5,50);
insert into member values ('sch','1234','성춘향','sch@naverc.om',27,'여',160.5,60.5,70);
insert into member values ('kjh','1234','김지혜','kjh@naverc.om',27,'여',160.5,58.5,50);


CREATE TABLE DayExercise (
    id VARCHAR2(20) NOT NULL,
    dayNo VARCHAR2(30)  NOT NULL PRIMARY KEY,
    year VARCHAR2(10),
    month VARCHAR2(10),
    exdate VARCHAR2(10),
    exNo VARCHAR2(10),
    exWeight NUMBER(10),
    exMeter NUMBER(10), -- 거리 시간 속성 추가
    exTime NUMBER(10),
    count NUMBER(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id),
    CONSTRAINT FK_DayExercise_exercise FOREIGN KEY (exNo) REFERENCES exercise (exNo)
);






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
