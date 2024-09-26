use harry_potter;
select * from wands;
select * from wands_property;

-- Create a view for ID,age, power and coins_needed.
Create view wands_p as 
select w.ID,w_p.age,w.power,w.coins_needed
from wands w inner join 
wands_property w_p on w.code=w_p.code
order by w.power,w_p.age desc;

select * from wands_p;

-- Show the wands that need less coins_needed and have same power and age and is not evil
Create view wands_no_evil as 
select w.ID,w_p.age,w.power,w.coins_needed,w_p.is_evil
from wands w inner join 
wands_property w_p on w.code=w_p.code
where w_p.is_evil= 0
order by w.power desc,w_p.age desc,w.coins_needed asc;

select a.ID,a.age,a.power,a.coins_needed,a.is_evil
from wands_no_evil as a inner join wands w on a.ID=w.ID inner join wands_property as b on b.code=w.code
where a.power=w.power and a.age=b.age;

-- show the coins needed for age more than 20 
select c.age,b.coins_needed
from wands b left join wands_property c on b.code=c.code
where c.age > 20;

-- show the code for wands that are not evil
select d.code,e.is_evil
from wands d left join wands_property e on d.code=e.code
where is_evil=0;

