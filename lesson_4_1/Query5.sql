select Country, `Official language`, `Maternal mortality ratio`, `Life expectancy`
from 1t.world
where `Official language` = 'English' and (`Maternal mortality ratio` > 20 or `Life expectancy` < 60);