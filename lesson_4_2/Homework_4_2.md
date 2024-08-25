### Задание

Вам необходимо написать SQL-запросы для выполнения следующих задач:

1. Вам необходимо написать SQL-запросы для выполнения следующих задач:

- Загрузите в свою базу датафрейм Mall_Customers.  Напишите запрос, который вернёт долю мужчин и женщин среди посетителей магазина. (Хинт: количество посетителей можно посчитать отдельно).

```sql
SELECT Genre, count(Genre)
FROM mall_customers
GROUP BY Genre;
```

- Напишите запрос, который вернёт всех мужчин, отсортированных по возрастанию возраста, убыванию Annual_Income и возрастанию Spending_Score (используйте иерархическую сортировку).

```sql
SELECT *
FROM mall_customers
WHERE Genre = 'Male'
ORDER BY Age ASC, Annual_Income DESC, Spending_Score ASC;
```

2. Создайте новую схему в своей базе данных. Назовите её AERO и запустите на этой схеме следующий скрипт  aero_pg_script.sql Внимание! При первом запуске скрипта нужно будет пропустить 4 ошибки т.к. в начале  идёт удаление таблиц которых на данный момент не существует. 

3. Ознакомьтесь с моделью данных, представленной на схеме:

- Напишите скрипт, который позволит узнать, какой компанией летал каждый из пассажиров.

```sql
SELECT DISTINCT ps.name, c.name 
FROM passenger ps
JOIN pass_in_trip pt ON ps.ID_psg = pt.ID_psg
JOIN trip t ON pt.trip_no = t.trip_no 
JOIN company c ON t.ID_comp = c.ID_comp
ORDER BY ps.name ASC
```

- Напишите скрипт, который вернёт всех пассажиров, не совершавших полёт (не имевших билетов).

```sql
SELECT DISTINCT ps.name 
FROM passenger ps
LEFT JOIN pass_in_trip pt ON ps.ID_psg = pt.ID_psg
WHERE pt.trip_no IS NULL 
ORDER BY ps.name ASC
```

- Напишите скрипт, который позволит узнать, в какие города летала Николь Кидман.

```sql
SELECT DISTINCT ps.name, t.town_to
FROM passenger ps
JOIN pass_in_trip pt ON ps.ID_psg = pt.ID_psg AND ps.name = 'Nikole Kidman'
JOIN trip t ON pt.trip_no = t.trip_no
```

4. Создайте новую схему COMP для скрипта computer_pg_script.sql.

- Напишите скрипт, который позволит узнать цену PC с маркером А.

```sql
SELECT p.model, pc.speed, pc.ram, pc.hd, pc.cd, pc.price 
FROM product p 
JOIN pc ON p.model = pc.model AND p.maker = 'A'
```

- Напишите скрипт, который позволит узнать, какие маркеры у лазерных принтеров.

```sql
SELECT p.model, pr.`type`, p.maker 
FROM product p 
JOIN printer pr ON p.model = pr.model AND p.`type` = 'Printer' AND pr.`type` = 'Laser'
```