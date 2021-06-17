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

insert into member values ('hkd','1234','홍길동','hkd@naverc.om',27,'남',178.5,70,60,33);
insert into member values ('key','1234','키다리','key@naverc.om',27,'남',190.5,80.5,50,25);
insert into member values ('sch','1234','성춘향','sch@naverc.om',27,'여',160.5,60.5,70,40);
insert into member values ('kjh','1234','김지혜','kjh@naverc.om',27,'여',160.5,58.5,50,30);

CREATE TABLE DayExercise (
    dayNo NUMBER(10) NOT NULL PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    year NUMBER(5),
    month NUMBER(5),
    exdate NUMBER(5),
    exName VARCHAR2(50),
    exWeight NUMBER(10),
    exMeter NUMBER(10),
    exTime NUMBER(10),
    exCount NUMBER(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id)
);

CREATE SEQUENCE SEQ_DayExercise_dayNo
START WITH 4
INCREMENT BY 1
NOMAXVALUE
NOCACHE;


CREATE TABLE board(
    idx int(100) NOT NULL Primary key,
    title VARCHAR(100) NOT NULL,
    writer VARCHAR(20) NOT NULL,
    regdate varchar(20) NOT NULL,
    count float(30),
    content varchar(300) NOT NULL
);
ALTER TABLE board MODIFY idx int(100) AUTO_INCREMENT Not NUll ;


CREATE TABLE food(
    fCode VARCHAR2(100) NOT NULL Primary key,
    fName VARCHAR2(100) NOT NULL,
    f_category VARCHAR2(100),
    servings Number (10,3),
    kcal Number(10,3),
    kcal_per_100 Number(10,3)
);



/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */
/* food data 삽입 */


CREATE TABLE calendar(
    calCode VARCHAR2(40) NOT NULL PRIMARY KEY,
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

INSERT INTO member VALUES ('rang', '1234', 'rang', 'rang@show.com', 12, '남', 123, 45, 35, 25);
INSERT INTO member VALUES ('show', '1234', 'show', 'show@rang.com', 34, '여', 123, 45, 32, 40);

INSERT INTO calendar (calCode, id, FCode, eYear, eMonth, eDate, eAmt, eTime) 
                     VALUES ('0231157709', 'rang', 'D000124', '2021', '6', '1', 300, '아침');
INSERT INTO calendar VALUES ('8645905112', 'rang', 'D000125', '2021', '6', '1', 450, '점심');
INSERT INTO calendar VALUES ('7802481754', 'rang', 'D000126', '2021', '6', '1', 500, '저녁');
INSERT INTO calendar VALUES ('8833286311', 'rang', 'D000129', '2021', '6', '2', 650, '저녁');
INSERT INTO calendar VALUES ('2649496380', 'show', 'D000131', '2021', '6', '2', 120, '아침');
INSERT INTO calendar VALUES ('8081130394', 'show', 'D000136', '2021', '6', '1', 650, '간식');
INSERT INTO calendar VALUES ('5665094369', 'rang', 'D000137', '2021', '6', '1', 450, '저녁');
INSERT INTO calendar VALUES ('6152404406', 'rang', 'D000138', '2021', '6', '1', 140, '아침');
INSERT INTO calendar VALUES ('9715852661', 'rang', 'D000139', '2021', '6', '1', 450, '야식');
INSERT INTO calendar VALUES ('7027251054', 'rang', 'D000140', '2021', '6', '1', 650, '간식');
INSERT INTO calendar VALUES ('4488468527', 'rang', 'D000141', '2021', '6', '1', 450, '저녁');
INSERT INTO calendar VALUES ('2777866709', 'rang', 'D000142', '2021', '6', '2', 650, '간식');
INSERT INTO calendar VALUES ('5930826326', 'rang', 'D000143', '2021', '6', '9', 300, '저녁');
INSERT INTO calendar VALUES ('3058735783', 'rang', 'D000152', '2021', '6', '5', 375, '점심');
INSERT INTO calendar VALUES ('5208598796', 'rang', 'D000153', '2021', '6', '29', 1000, '저녁');
INSERT INTO calendar VALUES ('6482773750', 'rang', 'D000154', '2021', '6', '12', 800, '간식');
INSERT INTO calendar VALUES ('9557164948', 'rang', 'D000156', '2021', '6', '11', 650, '점심');
INSERT INTO calendar VALUES ('3220729644', 'rang', 'D000157', '2021', '6', '4', 375, '아침');
INSERT INTO calendar VALUES ('4347232965', 'rang', 'D000158', '2021', '6', '18', 385, '간식');
INSERT INTO calendar VALUES ('6034989431', 'rang', 'D000159', '2021', '6', '11', 800, '점심');
INSERT INTO calendar VALUES ('3526284527', 'rang', 'D000161', '2021', '6', '10', 300, '점심');
INSERT INTO calendar VALUES ('1037352386', 'rang', 'D000162', '2021', '6', '7', 650, '아침');
INSERT INTO calendar VALUES ('6476364407', 'rang', 'D000163', '2021', '6', '5', 300, '저녁'); 
INSERT INTO calendar VALUES ('2158226467', 'rang', 'D000164', '2021', '6', '21', 450, '점심');
INSERT INTO calendar VALUES ('7350160802', 'rang', 'D000167', '2021', '6', '22', 300, '점심');
INSERT INTO calendar VALUES ('0142188351', 'rang', 'D000052', '2021', '6', '1', 385, '저녁');
INSERT INTO calendar VALUES ('0368437138', 'rang', 'D000054', '2021', '6', '5', 525, '점심');
INSERT INTO calendar VALUES ('4051184687', 'rang', 'D000062', '2021', '6', '2', 300, '아침');
INSERT INTO calendar VALUES ('2524937981', 'rang', 'D000063', '2021', '6', '10', 450, '점심');
INSERT INTO calendar VALUES ('1665752657', 'rang', 'D000064', '2021', '6', '5', 300, '점심');
INSERT INTO calendar VALUES ('7039633093', 'rang', 'D000066', '2021', '6', '24', 375, '아침');
INSERT INTO calendar VALUES ('9696140950', 'rang', 'D000067', '2021', '6', '21', 525, '저녁');
INSERT INTO calendar VALUES ('5778666160', 'rang', 'D000068', '2021', '6', '11', 300, '점심');
INSERT INTO calendar VALUES ('9339586057', 'rang', 'D000070', '2021', '6', '10', 1000, '간식');

commit; 
