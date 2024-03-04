

E 4.1
SELECT avg(HOUR_RATE) FROM `HOURS`;
+----------------+
| avg(HOUR_RATE) |
+----------------+
|       7.033636 |
+----------------+


E 4.2
SELECT AVG(ATTRACT_AGE) FROM `ATTRACTION` WHERE PARK_CODE="UK3452";
+------------------+
| AVG(ATTRACT_AGE) |
+------------------+
|           7.2500 |
+------------------+


E 4.3

 SELECT EMP_NUM ,sum(HOURS_PER_ATTRACT)
    -> FROM `HOURS` 
    -> GROUP by EMP_NUM;
+---------+------------------------+
| EMP_NUM | sum(HOURS_PER_ATTRACT) |
+---------+------------------------+
|     100 |                     12 |
|     101 |                      6 |
|     102 |                     12 |
|     104 |                     12 |
|     105 |                     12 |
+---------+------------------------+


E 4.4

SELECT a.ATTRACT_NO, MIN(h.hour_rate) AS min_hour_rate, MAX(h.hour_rate) AS max_hour_rate
    -> FROM ATTRACTION a 
    -> JOIN HOURS h ON a.ATTRACT_NO = h.ATTRACT_NO
    -> GROUP BY a.ATTRACT_NO;
+------------+---------------+---------------+
| ATTRACT_NO | min_hour_rate | max_hour_rate |
+------------+---------------+---------------+
|      10034 |          6.50 |          6.50 |
|      10078 |          8.50 |          8.50 |
|      10098 |          8.50 |          8.50 |
|      30011 |          7.20 |          7.20 |
|      30012 |          5.99 |          7.20 |
|      30044 |          5.99 |          5.99 |
+------------+---------------+---------------+

E 4.5
SELECT EMP_NUM,ATTRACT_NO , AVG(HOURS_PER_ATTRACT) as avg_hour_per_attract
    -> 
    -> from HOURS
    -> 
    -> GROUP by EMP_NUM,ATTRACT_NO
    -> 
    -> HAVING avg(HOURS_PER_ATTRACT) >= 5;
+---------+------------+----------------------+
| EMP_NUM | ATTRACT_NO | avg_hour_per_attract |
+---------+------------+----------------------+
|     100 |      10034 |               6.0000 |
|     101 |      10034 |               6.0000 |
|     104 |      30011 |               6.0000 |
|     104 |      30012 |               6.0000 |
+---------+------------+----------------------+


E 4.6

SELECT count(*)
    -> FROM EMPLOYEE
    -> CROSS JOIN HOURS ;
+----------+
| count(*) |
+----------+
|       77 |
+----------+



E 4.7

select e.EMP_LNAME,e.EMP_FNAME ,h.ATTRACT_NO,h.DATE_WORKED
    -> 
    -> FROM EMPLOYEE e
    -> inner join HOURS h 
    -> on e.EMP_NUM=h.EMP_NUM;
+------------+-----------+------------+-------------+
| EMP_LNAME  | EMP_FNAME | ATTRACT_NO | DATE_WORKED |
+------------+-----------+------------+-------------+
| Calderdale | Emma      |      10034 | 2007-05-18  |
| Calderdale | Emma      |      10034 | 2007-05-20  |
| Ricardo    | Marshel   |      10034 | 2007-05-18  |
| Arshad     | Arif      |      30012 | 2007-05-23  |
| Arshad     | Arif      |      30044 | 2007-05-21  |
| Arshad     | Arif      |      30044 | 2007-05-22  |
| Denver     | Enrica    |      30011 | 2007-05-21  |
| Denver     | Enrica    |      30012 | 2007-05-22  |
| Namowa     | Mirrelle  |      10078 | 2007-05-18  |
| Namowa     | Mirrelle  |      10098 | 2007-05-18  |
| Namowa     | Mirrelle  |      10098 | 2007-05-19  |
+------------+-----------+------------+-------------+


E 4.8 

select e.EMP_LNAME,e.EMP_FNAME ,h.ATTRACT_NO,a.ATTRACT_NAME
    -> 
    -> FROM EMPLOYEE e
    -> inner join HOURS h 
    -> on e.EMP_NUM=h.EMP_NUM
    -> 
    -> JOIN ATTRACTION a
    -> ON a.ATTRACT_NO=h.ATTRACT_NO;
+------------+-----------+------------+----------------+
| EMP_LNAME  | EMP_FNAME | ATTRACT_NO | ATTRACT_NAME   |
+------------+-----------+------------+----------------+
| Calderdale | Emma      |      10034 | ThunderCoaster |
| Calderdale | Emma      |      10034 | ThunderCoaster |
| Ricardo    | Marshel   |      10034 | ThunderCoaster |
| Arshad     | Arif      |      30012 | Pirates        |
| Arshad     | Arif      |      30044 | UnderSeaWord   |
| Arshad     | Arif      |      30044 | UnderSeaWord   |
| Denver     | Enrica    |      30011 | BlackHole2     |
| Denver     | Enrica    |      30012 | Pirates        |
| Namowa     | Mirrelle  |      10078 | Ant-Trap       |
| Namowa     | Mirrelle  |      10098 | Carnival       |
| Namowa     | Mirrelle  |      10098 | Carnival       |
+------------+-----------+------------+----------------+
11 rows in set (0.000 sec)


E 4.9

SELECT TP.PARK_NAME, TP.PARK_COUNTRY, COUNT(S.TRANSACTION_NO) AS TOTAL_SALES
    -> FROM THEMEPARK TP
    -> JOIN SALES S ON TP.PARK_CODE = S.PARK_CODE
    -> WHERE TP.PARK_COUNTRY IN ('UK', 'FR')
    -> GROUP BY TP.PARK_NAME, TP.PARK_COUNTRY;
+--------------+--------------+-------------+
| PARK_NAME    | PARK_COUNTRY | TOTAL_SALES |
+--------------+--------------+-------------+
| FairyLand    | FR           |           6 |
| PleasureLand | UK           |           8 |
+--------------+--------------+-------------+
2 rows in set (0.000 sec)


E 4.10

SELECT SALES.SALE_DATE, SALES_LINE.LINE_QTY, SALES_LINE.LINE_PRICE
    -> FROM SALES
    -> JOIN SALES_LINE ON SALES.TRANSACTION_NO = SALES_LINE.TRANSACTION_NO
    -> WHERE SALES.SALE_DATE = '2007-05-18';
+------------+----------+------------+
| SALE_DATE  | LINE_QTY | LINE_PRICE |
+------------+----------+------------+
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        2 |      69.98 |
| 2007-05-18 |        2 |      41.98 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      14.99 |
| 2007-05-18 |        1 |      34.99 |
| 2007-05-18 |        4 |     139.96 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        4 |     168.40 |
| 2007-05-18 |        1 |      22.50 |
| 2007-05-18 |        2 |      21.98 |
| 2007-05-18 |        2 |      84.20 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
| 2007-05-18 |        1 |      18.56 |
| 2007-05-18 |        1 |      12.12 |
| 2007-05-18 |        4 |     114.68 |
| 2007-05-18 |        2 |      57.34 |
| 2007-05-18 |        2 |      37.12 |
+------------+----------+------------+
31 rows in set (0.000 sec)





 




