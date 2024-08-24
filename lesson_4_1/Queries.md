1. Запрос, который вернет характеристики размера вооружённых сил Катара. 

```sql
select Country, `Armed Forces size`
from world
where Country = 'Qatar';
```

2. Запрос, который вернет все страны с Fertility Rate менее 2.

```sql
select Country, `Fertility Rate`
from world
where `Fertility Rate` < 2;
```

3. Запрос, который вернет все страны с аббревиатурой  abbreviation, начинающейся на S, или продолжительностью жизни «Life expectancy» менее 60 лет.

```sql
select Country, Abbreviation 
from world
where Abbreviation like 'S%';
```

4. Запрос который вернёт все страны, где официальный язык английский.

```sql
select Country, `Official language`
from world
where `Official language` = 'English';
```

5. Запрос который вернёт все страны, где официальный язык английский с «Maternal mortality ratio»  менее 20  или  Life expectancy < 60. 

```sql
select Country, `Official language`, `Maternal mortality ratio`, `Life expectancy`
from world
where `Official language` = 'English' and (`Maternal mortality ratio` > 20 or `Life expectancy` < 60);
```