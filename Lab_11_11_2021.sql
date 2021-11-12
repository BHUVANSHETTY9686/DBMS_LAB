mysql> USE LIBRARY_5CS1_B1;


Database changed




mysql> SELECT * FROM BOOK,BOOK_AUTHOR WHERE BOOK.BOOK_ID=BOOK_AUTHOR.BOOK_ID;

+---------+-------+----------------+----------+---------+-------------+
| BOOK_ID | TITLE | PUBLISHER_NAME | PUB_YEAR | BOOK_ID | AUTHOR_NAME |
+---------+-------+----------------+----------+---------+-------------+
|     101 | DBMS  | SBC            |     2016 |     101 | A1          |
|     102 | ADE   | PEARSON        |     2016 |     102 | A2          |
|     103 | DS    | PEARSON        |     2016 |     103 | A3          |
|     104 | NET   | SBC            |     2016 |     104 | A4          |
|     105 | JAVA  | SBC            |     2013 |     105 | A5          |
+---------+-------+----------------+----------+---------+-------------+
5 rows in set (0.02 sec)

/* In above Relation BOOK_ID attribute is displayed twice */

mysql> SELECT BOOK.BOOK_ID,TITLE,PUBLISHER_NAME,PUB_YEAR,AUTHOR_NAME FROM BOOK,BOOK_AUTHOR WHERE BOOK.BOOK_ID=BOOK_AUTHOR.BOOK_ID;

+---------+-------+----------------+----------+-------------+
| BOOK_ID | TITLE | PUBLISHER_NAME | PUB_YEAR | AUTHOR_NAME |
+---------+-------+----------------+----------+-------------+
|     101 | DBMS  | SBC            |     2016 | A1          |
|     102 | ADE   | PEARSON        |     2016 | A2          |
|     103 | DS    | PEARSON        |     2016 | A3          |
|     104 | NET   | SBC            |     2016 | A4          |
|     105 | JAVA  | SBC            |     2013 | A5          |
+---------+-------+----------------+----------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT BOOK.BOOK_ID,TITLE,PUBLISHER_NAME,AUTHOR_NAME,NO_OFCOPIES FROM BOOK,BOOK_AUTHOR,BOOK_COPIES WHERE BOOK.BOOK_ID=BOOK_AUTHOR.BOOK_ID AND BOOK.BOOK_ID=BOOK_COPIES.BOOK_ID;
+---------+-------+----------------+-------------+-------------+
| BOOK_ID | TITLE | PUBLISHER_NAME | AUTHOR_NAME | NO_OFCOPIES |
+---------+-------+----------------+-------------+-------------+
|     101 | DBMS  | SBC            | A1          |         200 |
|     101 | DBMS  | SBC            | A1          |         500 |
|     102 | ADE   | PEARSON        | A2          |         400 |
|     103 | DS    | PEARSON        | A3          |         700 |
|     103 | DS    | PEARSON        | A3          |         600 |
+---------+-------+----------------+-------------+-------------+
5 rows in set (0.03 sec)


mysql> SELECT COUNT(*) FROM BOOK;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)


mysql> SELECT COUNT(*) FROM BOOK_COPIES;
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.00 sec)


mysql> SELECT * FROM BOOK WHERE PUBLISHER_NAME='PEARSON';
+---------+-------+----------------+----------+
| BOOK_ID | TITLE | PUBLISHER_NAME | PUB_YEAR |
+---------+-------+----------------+----------+
|     102 | ADE   | PEARSON        |     2016 |
|     103 | DS    | PEARSON        |     2016 |
+---------+-------+----------------+----------+
2 rows in set (0.00 sec)

mysql> SELECT COUNT(BOOK_ID) FROM BOOK WHERE PUBLISHER_NAME='PEARSON';
+----------------+
| COUNT(BOOK_ID) |
+----------------+
|              2 |
+----------------+
1 row in set (0.01 sec)


mysql> SELECT COUNT(BOOK_ID) FROM BOOK;
+----------------+
| COUNT(BOOK_ID) |
+----------------+
|              5 |
+----------------+
1 row in set (0.00 sec)

/* mysql> SELECT COUNT(BOOK_ID,TITLE) FROM BOOK (We should not give more than 1 parameters in COUNT() )*/


mysql> SELECT BOOK_ID,COUNT(BOOK_ID) FROM BOOK_LENDING GROUP BY BOOK_ID;
+---------+----------------+
| BOOK_ID | COUNT(BOOK_ID) |
+---------+----------------+
|     101 |              2 |
|     102 |              1 |
|     103 |              2 |
|     104 |              1 |
|     105 |              1 |
+---------+----------------+
5 rows in set (0.00 sec)

mysql> SELECT BOOK_ID,COUNT(BOOK_ID) FROM BOOK_LENDING GROUP BY BOOK_ID HAVING COUNT(BOOK_ID)>=2;
+---------+----------------+
| BOOK_ID | COUNT(BOOK_ID) |
+---------+----------------+
|     101 |              2 |
|     103 |              2 |
+---------+----------------+
2 rows in set (0.00 sec)



mysql> SELECT CARD_NO,COUNT(CARD_NO) FROM BOOK_LENDING WHERE DATE_OUT BETWEEN 20170101 AND 20170630  GROUP BY CARD_NO;
+---------+----------------+
| CARD_NO | COUNT(CARD_NO) |
+---------+----------------+
|    1010 |              1 |
|    1011 |              1 |
+---------+----------------+
2 rows in set (0.00 sec)


mysql> SELECT CARD_NO,COUNT(CARD_NO) FROM BOOK_LENDING WHERE DATE_OUT BETWEEN 20170101 AND 20170630  GROUP BY CARD_NO HAVING COUNT(CARD_NO)>=1;
+---------+----------------+
| CARD_NO | COUNT(CARD_NO) |
+---------+----------------+
|    1010 |              1 |
|    1011 |              1 |
+---------+----------------+
2 rows in set (0.00 sec)



mysql> DELETE FROM BOOK WHERE BOOK_ID=105;
Query OK, 1 row affected (0.04 sec)

mysql> SELECT * FROM BOOK;
+---------+-------+----------------+----------+
| BOOK_ID | TITLE | PUBLISHER_NAME | PUB_YEAR |
+---------+-------+----------------+----------+
|     101 | DBMS  | SBC            |     2016 |
|     102 | ADE   | PEARSON        |     2016 |
|     103 | DS    | PEARSON        |     2016 |
|     104 | NET   | SBC            |     2016 |
+---------+-------+----------------+----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM BOOK_AUTHOR;
+---------+-------------+
| BOOK_ID | AUTHOR_NAME |
+---------+-------------+
|     101 | A1          |
|     102 | A2          |
|     103 | A3          |
|     104 | A4          |
+---------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM BOOK_COPIES;
+---------+--------------+-------------+
| BOOK_ID | PROGRAMME_ID | NO_OFCOPIES |
+---------+--------------+-------------+
|     101 |           10 |         200 |
|     101 |           11 |         500 |
|     102 |           11 |         400 |
|     103 |           11 |         700 |
|     103 |           12 |         600 |
+---------+--------------+-------------+
5 rows in set (0.00 sec)

mysql> SELECT SUM(NO_OFCOPIES) FROM BOOK_COPIES;
+------------------+
| SUM(NO_OFCOPIES) |
+------------------+
|             2400 |
+------------------+
1 row in set (0.00 sec)


mysql> SELECT BOOK_ID,SUM(NO_OFCOPIES) FROM BOOK_COPIES GROUP BY BOOK_ID;
+---------+------------------+
| BOOK_ID | SUM(NO_OFCOPIES) |
+---------+------------------+
|     101 |              700 |
|     102 |              400 |
|     103 |             1300 |
+---------+------------------+
3 rows in set (0.00 sec)

mysql> CREATE VIEW TOTAL_COPIES(BOOK_ID,TOTAL_NO_COPIES) AS SELECT BOOK_ID,SUM(NO_OFCOPIES) FROM BOOK_COPIES GROUP BY BOOK_ID;
Query OK, 0 rows affected (0.03 sec)


mysql> SELECT * FROM TOTAL_COPIES;
+---------+-----------------+
| BOOK_ID | TOTAL_NO_COPIES |
+---------+-----------------+
|     101 |             700 |
|     102 |             400 |
|     103 |            1300 |
+---------+-----------------+
3 rows in set (0.00 sec)


