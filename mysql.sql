#멤버 테이블 생성
  CREATE TABLE member (
    Id VARCHAR(20) NOT NULL PRIMARY KEY,
    Pwd VARCHAR(20),
    Name VARCHAR(20),
    eMail VARCHAR(40),
    Age INT(5),
    Gender VARCHAR(5),
    height float(30,3),
    weight float(30,3),
    goalWeight float(30,3),
    activityIndex INT(4)
);

# 멤버 예제 4개
insert into member values ('hkd','1234','홍길동','hkd@naverc.om',27,'남',178.5,70,60,33);
insert into member values ('key','1234','키다리','key@naverc.om',27,'남',190.5,80.5,50,25);
insert into member values ('sch','1234','성춘향','sch@naverc.om',27,'여',160.5,60.5,70,40);
insert into member values ('kjh','1234','김지혜','kjh@naverc.om',27,'여',160.5,58.5,50,30);

#운동당 테이블(예제는 홈페이지에서 만들것)
CREATE TABLE DayExercise (
    dayNo INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id VARCHAR(20) NOT NULL,
    year INT(5),
    month INT(5),
    exdate INT(5),
    exName VARCHAR(50),
    exWeight INT(10),
    exMeter INT(10),
    exTime INT(10),
    exCount INT(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id)
);

#운동당 테이블(예제는 홈페이지에서 만들것)

CREATE TABLE food(
    fCode VARCHAR(100) NOT NULL Primary key,
    fName VARCHAR(100) NOT NULL,
    f_category VARCHAR(100),
    servings float (10,3),
    kcal float(10,3),
    kcal_per_100 float(10,3)
);



CREATE TABLE calendar(
    calCode VARCHAR(40) NOT NULL PRIMARY KEY,
    id VARCHAR(20),
    fCode VARCHAR(30),
    eYear VARCHAR(10),
    eMonth VARCHAR(5),
    eDate VARCHAR(5),
    eAmt float(10,3),
    eTime VARCHAR(20),
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


SHOW TABLES;
SELECT * FROM springdb.member;
SELECT * FROM springdb.DayExercise;
SELECT * FROM springdb.food;

SELECT * FROM springdb.calendar;