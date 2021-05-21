CREATE TABLE MEMBER (
    Id VARCHAR2(20) NOT NULL PRIMARY KEY,
    Pwd VARCHAR2(20),
    Name VARCHAR2(20),
    eMail VARCHAR2(40),
    Age NUMBER(5),
    Gender VARCHAR2(5),
    height NUMBER(30,3),
    weight NUMBER(30,3),
    goalWeight Number(30,3)
);

CREATE TABLE FOOD (
    FCode VARCHAR2(100) NOT NULL Primary key,
    FName VARCHAR2(100) NOT NULL,
    F_category VARCHAR2(50),
    servings Number (10,3),
    Kcal Number(10,3),
    Kcal_per_100 Number(10,3)
);

CREATE TABLE calandar (
    id VARCHAR2(20),
    FCode VARCHAR2(30),
    eDate DATE,
    eAmt Number(10,3),
    eTime VARCHAR2(20),
    CONSTRAINT FK_calander_member FOREIGN KEY (id) REFERENCES member (id),
    CONSTRAINT FK_calander_food FOREIGN KEY (FCode) REFERENCES food (FCode)
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
