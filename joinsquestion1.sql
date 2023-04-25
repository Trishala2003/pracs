/*Create tables and perform the following
1. How the resulting salaries if every employee working on the 'Research' Departments is
given a 10 percent raise.
2. Find the sum of the salaries of all employees of the 'Accounts' department, as wellas the
maximum salary, the minimum salary, and the average salary in this department
3. Retrieve the name of each employee Controlled by department number 5 (useEXISTS
operator).
4. Retrieve the name of each dept and number of employees working in each department
which has at least 2 employees
5. Retrieve the name of employees who born in the year 1990s
6. Retrieve the name of employees and their dept name (using JOIN)*/

SQL> CREATE TABLE DEPARTMENT(
DNO VARCHAR2 (20) PRIMARY KEY,
DNAME VARCHAR2 (20),
MGRSTARTDATE DATE);

SQL> CREATE TABLE EMPLOYEE(
SSN VARCHAR2 (20) PRIMARY KEY,
FNAME VARCHAR2 (20),
LNAME VARCHAR2 (20),
ADDRESS VARCHAR2 (20),
SEX CHAR (1),
SALARY INTEGER,
SUPERSSN REFERENCES EMPLOYEE (SSN),
DNO REFERENCES DEPARTMENT (DNO));

SQL> ALTER TABLE DEPARTMENT
2 ADD MGRSSN REFERENCES EMPLOYEE (SSN); 

INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSECE01‘,‘JOHN‘,‘SCOTT‘,‘BANGALORE‘,‘M‘, 450000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSCSE01‘,‘JAMES‘,‘SMITH‘,‘BANGALORE‘,‘M‘, 500000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSCSE02‘,‘HEARN‘,‘BAKER‘,‘BANGALORE‘,‘M‘, 700000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSCSE03‘,‘EDWARD‘,‘SCOTT‘,‘MYSORE‘,‘M‘, 500000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSCSE04‘,‘PAVAN‘,‘HEGDE‘,‘MANGALORE‘,‘M‘, 650000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSCSE05‘,‘GIRISH‘,‘MALYA‘,‘MYSORE‘,‘M‘, 450000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSCSE06‘,‘NEHA‘,‘SN‘,‘BANGALORE‘,‘F‘, 800000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX, SALARY)
VALUES (‘RNSACC01‘,‘AHANA‘,‘K‘,‘MANGALORE‘,‘F‘, 350000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSACC02‘,‘SANTHOSH‘,‘KUMAR‘,‘MANGALORE‘,‘M‘, 300000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSISE01‘,‘VEENA‘,‘M‘,‘MYSORE‘,‘M‘, 600000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSIT01‘,‘NAGESH‘,‘HR‘,‘BANGALORE‘,‘M‘, 500000);

INSERT INTO DEPARTMENT VALUES (1,‘ACCOUNTS‘,‘01-JAN01‘,‘RNSACC02‘);
INSERT INTO DEPARTMENT VALUES (2,‘IT‘,‘01-AUG-16‘,‘RNSIT01‘);
INSERT INTO DEPARTMENT VALUES (3,‘ECE‘,‘01-JUN-08‘,‘RNSECE01‘);
INSERT INTO DEPARTMENT VALUES (4,‘ISE‘,‘01-AUG-15‘,‘RNSISE01‘);
INSERT INTO DEPARTMENT VALUES (5,‘CSE‘,‘01-JUN-02‘,‘RNSCSE05‘);

/*Note: update entries of employee table to fill missing fields SUPERSSN and DNO*/

UPDATE EMPLOYEE SET SUPERSSN=NULL, DNO=‘3‘ WHERE
SSN=‘RNSECE01‘;
UPDATE EMPLOYEE SET SUPERSSN=‘RNSCSE02‘, DNO=‘5‘WHERE
SSN=‘RNSCSE01‘;
UPDATE EMPLOYEE SET SUPERSSN=‘RNSCSE03‘, DNO=‘5‘WHERE
SSN=‘RNSCSE02‘;
UPDATE EMPLOYEE SET SUPERSSN=‘RNSCSE04‘, DNO=‘5‘WHERE
SSN=‘RNSCSE03‘;
Page 20
UPDATE EMPLOYEE SET DNO=‘5‘, SUPERSSN=‘RNSCSE05‘ WHERE
SSN=‘RNSCSE04‘; UPDATE EMPLOYEE SET DNO=‘5‘, SUPERSSN=‘RNSCSE06‘
WHERE SSN=‘RNSCSE05‘;
UPDATE EMPLOYEE SET DNO=‘5‘, SUPERSSN=NULL WHERE
SSN=‘RNSCSE06‘;
UPDATE EMPLOYEE SET DNO=‘1‘, SUPERSSN=‘RNSACC02‘WHERE
SSN=‘RNSACC01‘;
UPDATE EMPLOYEE SET DNO=‘1‘, SUPERSSN=NULLWHERE
SSN=‘RNSACC02‘;
UPDATE EMPLOYEE SET DNO=‘4‘, SUPERSSN=NULL WHERE
SSN=‘RNSISE01‘;
UPDATE EMPLOYEE SET DNO=‘2‘, SUPERSSN=NULL WHERE
SSN=‘RNSIT01‘;

/*1. How the resulting salaries if every employee working on the ‘Research’
Departments is given a 10 percent raise.*/
SQL> SELECT E.FNAME,E.LNAME, 1.1*E.SALARY AS INCR_SAL
2 FROM EMPLOYEE1 E,DEPARTMENT D,EMPLOYEE1 W
3 WHERE E.SSN=W.SSN
4 AND E.DNO=D.DNUMBER
5 AND D.DNAME='research';

/*2. Find the sum of the salaries of all employees of the ‘Accounts’ department, aswell
as the maximum salary, the minimum salary, and the average salary in this
department*/
SQL> SELECT SUM(E.SALARY),MAX(E.SALARY),MIN(E.SALARY),
AVG(E.SALARY)FROM EMPLOYEE1 E,DEPARTMENT D WHERE
E.DNO=D.DNUMBER AND D.DNAME='RESEARCH';

/*3. Retrieve the name of each employee Controlled by department number 5 (use
EXISTS operator).*/
SQL> SELECT
E.FNAME,E.LNAME 2
FROM EMPLOYEE1 E
3 WHERE EXISTS(SELECT DNO FROM EMPLOYEE1 WHERE E.DNO=5);

/*4. Retrieve the name of each dept and number of employees working in each
department which has at least 2 employees*/
SELECT DNAME, COUNT(*)
FROM EMPLOYEE E, DEPARTMENT D
WHERE D.DNO=E.DNO
AND D.DNO IN (SELECT E1.DNO
FROM EMPLOYEE E1
GROUP BY E1.DNO
having count(*)>2 )
ORDER BY DNO;

/*5. Retrieve the name of employees who born in the year 1990’s*/
SELECT E.FNAME,E.LNAME,E.BDATE FROM EMPLOYEE1 E WHERE BDATE LIKE '196%';

/*6. Retrieve the name of employees and their dept name (using JOIN)*/
SELECT E.FNAME, E.LNAME, DNAME
FROM EMPLOYEE E NATURAL JOIN DEPARTMENT D ON E,DNO=D.DNO;