--��� ������
CREATE TABLE MEMBER (
    id VARCHAR2(20) NOT NULL PRIMARY KEY,
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
--��� ������ ����
insert into member values ('hkd','1234','ȫ�浿','hkd@naverc.om',27,'��',178.5,70,60,33);
insert into member values ('key','1234','Ű�ٸ�','key@naverc.om',27,'��',190.5,80.5,50,25);
insert into member values ('sch','1234','������','sch@naverc.om',27,'��',160.5,60.5,70,40);
insert into member values ('kjh','1234','������','kjh@naverc.om',27,'��',160.5,58.5,50,30);

-- ���ں� ��Է� �����ͺ��̽�
CREATE TABLE DayExercise (
    dayNo NUMBER(10) NOT NULL PRIMARY KEY,
    id VARCHAR2(20) NOT NULL,
    year NUMBER(5),
    month NUMBER(5),
    exdate NUMBER(5),
    exName VARCHAR2(10),
    exWeight NUMBER(10),
    exMeter NUMBER(10), -- �Ÿ� �ð� �Ӽ� �߰�
    exTime NUMBER(10),
    exCount NUMBER(10),
    CONSTRAINT FK_DayExercise_member FOREIGN KEY (id) REFERENCES member (id)
);

-- ���ں� � ��ȣ�ο� ������ ���̽�
CREATE SEQUENCE SEQ_DayExercise_dayNo
START WITH 4
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

--���ں� � ��ȣ ����
insert into DayExercise values (1,'hkd',2021,6,5,'����Ʈ',100,0,0,2);
insert into DayExercise values (2,'key',2021,4,5,'�޸���',0,2,30,0);
insert into DayExercise values (3,'key',2021,3,5,'����Ʈ',120,0,0,2);


create table food(
    fCode VARCHAR2(100) NOT NULL Primary key,
    fName VARCHAR2(100) NOT NULL,
    f_category VARCHAR2(100),
    servings Number (10,3),
    kcal Number(10,3),
    kcal_per_100 Number(10,3)
);

/* food data ?��?�� */
/* food data ?��?�� */
/* food data ?��?�� */
/* food data ?��?�� */
/* food data ?��?�� */
/* food data ?��?�� */



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


INSERT INTO calendar (id, FCode, eYear, eMonth, eDate, eAmt, eTime) 
                     VALUES ('rang', 'D000124', '2021', '6', '1', 300, '?���?');
INSERT INTO calendar VALUES ('rang', 'D000125', '2021', '6', '1', 450, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000126', '2021', '6', '1', 500, '???��');
INSERT INTO calendar VALUES ('rang', 'D000129', '2021', '6', '2', 650, '???��');
INSERT INTO calendar VALUES ('show', 'D000131', '2021', '6', '2', 120, '?���?');
INSERT INTO calendar VALUES ('show', 'D000136', '2021', '6', '3', 650, '간식');
INSERT INTO calendar VALUES ('rang', 'D000137', '2021', '6', '1', 450, '???��');
INSERT INTO calendar VALUES ('rang', 'D000138', '2021', '6', '1', 140, '?���?');
INSERT INTO calendar VALUES ('rang', 'D000139', '2021', '6', '1', 450, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000140', '2021', '6', '1', 650, '간식');
INSERT INTO calendar VALUES ('rang', 'D000141', '2021', '6', '1', 450, '???��');
INSERT INTO calendar VALUES ('rang', 'D000142', '2021', '6', '2', 650, '간식');
INSERT INTO calendar VALUES ('rang', 'D000143', '2021', '6', '9', 300, '???��');
INSERT INTO calendar VALUES ('rang', 'D000152', '2021', '6', '5', 375, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000153', '2021', '6', '29', 1000, '???��');
INSERT INTO calendar VALUES ('rang', 'D000154', '2021', '6', '12', 800, '간식');
INSERT INTO calendar VALUES ('rang', 'D000156', '2021', '6', '11', 650, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000157', '2021', '6', '4', 375, '?���?');
INSERT INTO calendar VALUES ('rang', 'D000158', '2021', '6', '18', 385, '간식');
INSERT INTO calendar VALUES ('rang', 'D000159', '2021', '6', '11', 800, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000161', '2021', '6', '10', 300, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000162', '2021', '6', '7', 650, '?���?');
INSERT INTO calendar VALUES ('rang', 'D000163', '2021', '6', '5', 300, '???��'); 
INSERT INTO calendar VALUES ('rang', 'D000164', '2021', '6', '21', 450, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000167', '2021', '6', '22', 300, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000052', '2021', '6', '21', 385, '???��');
INSERT INTO calendar VALUES ('rang', 'D000054', '2021', '6', '5', 525, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000062', '2021', '6', '2', 300, '?���?');
INSERT INTO calendar VALUES ('rang', 'D000063', '2021', '6', '10', 450, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000064', '2021', '6', '5', 300, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000066', '2021', '6', '24', 375, '?���?');
INSERT INTO calendar VALUES ('rang', 'D000067', '2021', '6', '21', 525, '???��');
INSERT INTO calendar VALUES ('rang', 'D000068', '2021', '6', '11', 300, '?��?��');
INSERT INTO calendar VALUES ('rang', 'D000070', '2021', '6', '10', 1000, '간식');

commit; 
