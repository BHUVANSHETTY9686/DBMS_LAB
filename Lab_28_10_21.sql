mysql> CREATE DATABASE LIBRARY_5CS1_B1;

mysql> USE LIBRARY_5CS1_B1;
Database changed

mysql> CREATE TABLE PUBLISHER(NAME VARCHAR(20) PRIMARY KEY,ADDRESS VARCHAR(40),PHONE INT);


mysql> CREATE TABLE LIBRARY_PROGRAMME(PROGRAMME_ID INT PRIMARY KEY,BRANCH_NAME VARCHAR(40),ADDRESS VARCHAR(40));


mysql> DESC PUBLISHER;


mysql> DESC LIBRARY_PROGRAMME;


mysql> CREATE TABLE BOOK(BOOK_ID INT PRIMARY KEY,TITLE VARCHAR(20),PUBLISHER_NAME VARCHAR(20),PUB_YEAR INT,FOREIGN KEY(PUBLISHER_NAME) REFERENCES PUBLISHER(NAME));


mysql> DESC BOOK;

/* Above book table does not contains ON DELETE CASCADE */
mysql> DROP TABLE BOOK;


mysql> CREATE TABLE BOOK(BOOK_ID INT PRIMARY KEY,TITLE VARCHAR(20),PUBLISHER_NAME VARCHAR(20),PUB_YEAR INT,FOREIGN KEY(PUBLISHER_NAME) REFERENCES PUBLISHER(NAME) ON DELETE CASCADE);


mysql> CREATE TABLE BOOK_AUTHOR(BOOK_ID INT PRIMARY KEY,AUTHOR_NAME VARCHAR(20),FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE);


mysql> CREATE TABLE BOOK_LENDING(BOOK_ID INT,PROGRAMME_ID INT,CARD_NO INT,DATE_OUT DATE,DUE_DATE DATE,PRIMARY KEY(BOOK_ID,PROGRAMME_ID,CARD_NO),FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID)ON DELETE CASCADE,FOREIGN KEY(PROGRAMME_ID) REFERENCES LIBRARY_PROGRAMME(PROGRAMME_ID) ON DELETE CASCADE);


mysql> CREATE TABLE BOOK_COPIES(BOOK_ID INT,PROGRAMME_ID INT,NO_OFCOPIES INT,PRIMARY KEY(BOOK_ID,PROGRAMME_ID),FOREIGN KEY(BOOK_ID) REFERENCES BOOK(BOOK_ID) ON DELETE CASCADE,FOREIGN KEY(PROGRAMME_ID) REFERENCES LIBRARY_PROGRAMME(PROGRAMME_ID) ON DELETE CASCADE);