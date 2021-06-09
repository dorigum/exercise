CREATE TABLE member (
    Id VARCHAR2(20) NOT NULL PRIMARY KEY,
    Pwd VARCHAR2(20),
    Name VARCHAR2(20),
    eMail VARCHAR2(40),
    Age NUMBER(5),
    Gender VARCHAR2(5),
    height NUMBER(30,3),
    weight NUMBER(30,3),
    goalWeight Number(30,3),
    activityIndex Number(4)
);

CREATE TABLE DayExercise (
    dayNo NUMBER(10) NOT NULL PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    year NUMBER(5),
    month NUMBER(5),
    exdate NUMBER(5),
    exName VARCHAR2(10),
    exWeight NUMBER(10),
    exMeter NUMBER(10), -- îòí÷ êÛð¶ ×§? ?øÎ
    exTime NUMBER(10),
    exCount NUMBER(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id)
);

CREATE SEQUENCE SEQ_DayExercise_dayNo
START WITH 4
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

create table food(
    fCode VARCHAR2(100) NOT NULL Primary key,
    fName VARCHAR2(100) NOT NULL,
    f_category VARCHAR2(100),
    servings Number (10,3),
    kcal Number(10,3),
    kcal_per_100 Number(10,3)
);



/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */
/* food data »ðÀÔ */


create table calendar(
    id VARCHAR2(20),
    fCode VARCHAR2(30),
    eYear VARCHAR2(10),
    eMonth VARCHAR2(5),
    eDate VARCHAR2(5),
    eAmt NUMBER(10,3),
    eTime VARCHAR2(20),
    CONSTRAINT FK_calander_member FOREIGN KEY (id) REFERENCES member (id),
    CONSTRAINT FK_calander_food FOREIGN KEY (fCode) REFERENCES food (fCode)
);

INSERT INTO member VALUES ('rang', '1234', 'rang', 'rang@show.com', 12, '³²', 123, 45, 35, 25);
INSERT INTO member VALUES ('show', '1234', 'show', 'show@rang.com', 34, '¿©', 123, 45, 32, 40);

INSERT INTO calendar (id, FCode, eYear, eMonth, eDate, eAmt, eTime) 
                     VALUES ('rang', 'D000124', '2021', '6', '1', 300, '¾ÆÄ§');
INSERT INTO calendar VALUES ('rang', 'D000125', '2021', '6', '1', 450, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000126', '2021', '6', '1', 500, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000129', '2021', '6', '2', 650, 'Àú³á');
INSERT INTO calendar VALUES ('show', 'D000131', '2021', '6', '2', 120, '¾ÆÄ§');
INSERT INTO calendar VALUES ('show', 'D000136', '2021', '6', '3', 650, '°£½Ä');
INSERT INTO calendar VALUES ('rang', 'D000137', '2021', '6', '1', 450, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000138', '2021', '6', '1', 140, '¾ÆÄ§');
INSERT INTO calendar VALUES ('rang', 'D000139', '2021', '6', '1', 450, '¾ß½Ä');
INSERT INTO calendar VALUES ('rang', 'D000140', '2021', '6', '1', 650, '°£½Ä');
INSERT INTO calendar VALUES ('rang', 'D000141', '2021', '6', '1', 450, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000142', '2021', '6', '2', 650, '°£½Ä');
INSERT INTO calendar VALUES ('rang', 'D000143', '2021', '6', '9', 300, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000152', '2021', '6', '5', 375, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000153', '2021', '6', '29', 1000, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000154', '2021', '6', '12', 800, '°£½Ä');
INSERT INTO calendar VALUES ('rang', 'D000156', '2021', '6', '11', 650, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000157', '2021', '6', '4', 375, '¾ÆÄ§');
INSERT INTO calendar VALUES ('rang', 'D000158', '2021', '6', '18', 385, '°£½Ä');
INSERT INTO calendar VALUES ('rang', 'D000159', '2021', '6', '11', 800, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000161', '2021', '6', '10', 300, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000162', '2021', '6', '7', 650, '¾ÆÄ§');
INSERT INTO calendar VALUES ('rang', 'D000163', '2021', '6', '5', 300, 'Àú³á'); 
INSERT INTO calendar VALUES ('rang', 'D000164', '2021', '6', '21', 450, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000167', '2021', '6', '22', 300, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000052', '2021', '6', '21', 385, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000054', '2021', '6', '5', 525, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000062', '2021', '6', '2', 300, '¾ÆÄ§');
INSERT INTO calendar VALUES ('rang', 'D000063', '2021', '6', '10', 450, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000064', '2021', '6', '5', 300, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000066', '2021', '6', '24', 375, '¾ÆÄ§');
INSERT INTO calendar VALUES ('rang', 'D000067', '2021', '6', '21', 525, 'Àú³á');
INSERT INTO calendar VALUES ('rang', 'D000068', '2021', '6', '11', 300, 'Á¡½É');
INSERT INTO calendar VALUES ('rang', 'D000070', '2021', '6', '10', 1000, '°£½Ä');

commit; 