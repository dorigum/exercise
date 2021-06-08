drop table food;

create table food(
    fCode VARCHAR2(100) NOT NULL Primary key,
    fName VARCHAR2(100) NOT NULL,
    f_category VARCHAR2(100),
    servings Number (10,3),
    kcal Number(10,3),
    kcal_per_100 Number(10,3)
);


select *
from food;

select count(*)
from food;

create table Calendar(
    id VARCHAR2(20),
    FCode VARCHAR2(30),
    eDate DATE,
    eAmt Number(10,3),
    eTime VARCHAR2(20),
    CONSTRAINT FK_calander_member FOREIGN KEY (id) REFERENCES member (id),
    CONSTRAINT FK_calander_food FOREIGN KEY (FCode) REFERENCES food (FCode)
);


CREATE TABLE MEMBER (
    Id VARCHAR2(20) NOT NULL PRIMARY KEY,
    Pwd VARCHAR2(20),
    Name NUMBER(20),
    eMail VARCHAR2(40),
    Age NUMBER(5),
    Gender VARCHAR2(5),
    height NUMBER(30,3),
    weight NUMBER(30,3),
    goalWeight Number(30,3)
);


CREATE TABLE exercise (
    exName VARCHAR2(30) NOT NULL PRIMARY KEY
);

CREATE TABLE DayExercise (
    dayNo VARCHAR2(30)  NOT NULL PRIMARY KEY,
    day DATE,
    id VARCHAR(30),
    exName VARCHAR(30),
    weight NUMBER(10),
    count NUMBER(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id),
    CONSTRAINT FK_DayExercise_exercise FOREIGN KEY (exName) REFERENCES exercise (exName)
);

commit;
