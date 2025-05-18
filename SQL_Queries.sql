use ecommmerce_db;
select * from Superstore ; 

-- To check null values

select *from Superstore 
where `Order Date` is null or
       `Order ID` is null or
       `Ship Date` is null or
       `Ship Mode` is null or 
       `Customer ID` is null or
       `Customer Name` is null or 
       Segment is null or
       Country is null or
       City is null or 
       State is null or
       `Postal Code` is null or
       Region is null or
       `Product ID` IS  null or
       Category is null or
       `Sub-Category` is null or
       `Product Name` is null OR
       Sales is null or
       Quantity is null or
       Discount is null or
       Profit is null;

-- checking duplicate rows
 
select *, count(*) as count
from Superstore
group by 
	`Row ID`, `Order ID`, `Order Date`, `Ship Date`, `Ship Mode`,
    `Customer ID`, `Customer Name`, Segment, Country, City, State,
    `Postal Code`, Region, `Product ID`, Category, `Sub-Category`,
    `Product Name`, Sales, Quantity, Discount, Profit
having count(*) > 1 ;

-- Inconsistent text formats

update Superstore
set
Category= trim(lower(Category)),
`Sub-Category`= trim(lower(`Sub-Category`)),
`Ship Mode`=trim(lower(`Ship Mode`)) ,
 Segment=trim(lower(Segment)) ,
 Country=trim(lower(Country)) ,
 City=trim(lower(City)) ,
 State=trim(lower(State)) ,
 Region=trim(lower(Region)), 
 `Product Name`=trim(lower(`Product Name`)) ,
 `Customer Name`=trim(lower(`Customer Name`)) ;

-- changing datatype to date

alter table Superstore
add column odf date,
add column sdf date;

update Superstore
set 
odf=str_to_date(`Order Date`,'%m/%d/%Y'),
sdf=str_to_date(`Ship Date`,'%m/%d/%Y');

alter table Superstore
drop column `Order Date`,
drop column `Ship Date`;

alter table Superstore
change odf `Order Date` date,
change sdf `Ship Date` date;

-- To check the columns datatypes

describe Superstore;

-- calculate profit Margin

ALTER TABLE Superstore
ADD COLUMN `Profit Margin` DECIMAL(10,2);
UPDATE Superstore
SET `Profit Margin` = 
  CASE 
    WHEN Sales != 0 THEN ROUND((Profit / Sales) * 100, 2)
    ELSE NULL
  END;



