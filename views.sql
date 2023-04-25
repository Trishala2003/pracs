/*Perform the Following
1. Creating Views (With and Without Check Option),
2. Selecting from a View,
3. Dropping Views*/

/*SOLUTION:*/
SQL> CREATE TABLE EMPLOYEE (
SSN VARCHAR2 (20) PRIMARY KEY,
FNAME VARCHAR2 (20),
LNAME VARCHAR2 (20),
ADDRESS VARCHAR2 (20),
SEX CHAR (1),
SALARY INTEGER,
SUPERSSN REFERENCES EMPLOYEE (SSN),
DNO REFERENCES DEPARTMENT (DNO));

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
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSACC01‘,‘AHANA‘,‘K‘,‘MANGALORE‘,‘F‘, 350000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSACC02‘,‘SANTHOSH‘,‘KUMAR‘,‘MANGALORE‘,‘M‘, 300000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSISE01‘,‘VEENA‘,‘M‘,‘MYSORE‘,‘M‘, 600000);
INSERT INTO EMPLOYEE (SSN, FNAME, LNAME, ADDRESS, SEX,SALARY)
VALUES (‘RNSIT01‘,‘NAGESH‘,‘HR‘,‘BANGALORE‘,‘M‘, 500000);

/*Creating View
The query that defines the sales_staffview references only rows in department 5.
Furthermore, the CHECK OPTION creates the view with the constraint (named
sales_staff_cnst) that INSERT and UPDATE statements issued against the view cannot
result in rows that the view cannot select.*/

/*1. Creating Views (With and Without Check Option)*/
SQL> CREATE VIEW sales_staff AS
2 SELECT fname, ssn, dno
3 FROM employee
4 WHERE dno =5
5 WITH CHECK OPTION CONSTRAINTsales_staff_cnst;
/*View created.*/

/*2. Selecting from a View*/
SQL> select * from sales_staff;

/*3. Drop View*/
SQL>DROP VIEW sales_staff;
