-- Create Wine table
CREATE TABLE Wine (
    wine_id int PRIMARY KEY,
    wine_type VARCHAR(20),
    year int,
    degree FLOAT
	);

-- Create Producer table
CREATE TABLE Producer (
    producer_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    region VARCHAR(20)
    );

--create Harvest table 
	CREATE TABLE Harvest (
    NumW INT,
    NumP INT,
    Quantity INT,
    PRIMARY KEY (NumW, NumP),
    FOREIGN KEY (NumW) REFERENCES Wine(wine_id),
    FOREIGN KEY (NumP) REFERENCES Producer(producer_id)
);

-- Insert data into Wine table
INSERT INTO Wine (wine_id, wine_type, year, degree) VALUES
('1', 'Red', '2019', '13.5'),
('2', 'White', '2020', '12.0'),
('3', 'Rose', '2018', '11.5'),
('4', 'Red', '2021', '14.0'),
('5', 'Sparkling', '2017', '10.5'),
('6', 'White', '2019', '12.5'),
('7', 'Red', '2022', '13.0'),
('8', 'Rose', '2020', '11.0'),
('9', 'Red', '2018', '12.0'),
('10', 'Sparkling', '2019', '10.0'),
('11', 'White', '2021', '11.5'),
('12', 'Red', '2022', '15.0');

-- Insert data into Producer table
INSERT INTO Producer (producer_id, first_name, last_name, region) VALUES
('1', 'John', 'Smith', 'Sousse'),
('2', 'Emma', 'Johnson', 'Tunis'),
('3', 'Michael', 'Williams', 'Sfax'),
('4', 'Emily', 'Brown', 'Sousse'),
('5', 'James', 'Jones', 'Sousse'),
('6', 'Sarah', 'Davis', 'Tunis'),
('7', 'David', 'Miller', 'Sfax'),
('8', 'Olivia', 'Wilson', 'Monastir'),
('9', 'Daniel', 'Moore', 'Sousse'),
('10', 'Sophia', 'Taylor', 'Tunis'),
('11', 'Matthew', 'Anderson', 'Sfax'),
('12', 'Amelia', 'Thomas', 'Sousse');

INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (1, 1, 1000);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (2, 2, 1500);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (3, 3, 1200);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (4, 4, 1300);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (5, 5, 900);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (6, 6, 1100);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (7, 7, 1400);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (8, 8, 1000);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (9, 9, 1050);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (10, 10, 980);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (11, 11, 1130);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (12, 12, 1270);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (1, 2, 950);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (3, 4, 1010);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (6, 5, 1500);
INSERT INTO Harvest (NumW, NumP, Quantity) VALUES (7, 1, 1360);


--Retrieve a list of all producers.
select * from Producer

--Retrieve a sorted list of producers by name.
select first_name, last_name
from Producer;

--Retrieve a list of producers from Sousse.
select * from Producer
where region = 'Sousse';

select first_name, last_name
from Producer
where region = 'Sousse';


--Calculate the total quantity of wine produced with the wine number 12.
SELECT SUM (Quantity) AS total_quantity
FROM Harvest
WHERE NumW = 12;

--Calculate the quantity of wine produced for each category.
SELECT wine_type, sum(Quantity) AS Winequantity
FROM Harvest
inner join  Wine
on wine.wine_id = harvest.NumW
GROUP BY wine_type;

--Find producers in the Sousse region who have harvested at least one wine in quantities greater than 300 liters. Display their names and first names, sorted alphabetically.
select producer.first_name, producer.last_name, Harvest.NumP
from Producer
inner join Harvest
on producer.producer_id = Harvest.NumP
where region= 'sousse' and quantity > '300'
ORDER BY Producer.last_name, Producer.first_name;


--List the wine numbers with a degree greater than 12.
select producer_id, wine_type 
from Wine
join Producer
on wine.wine_id = Producer.producer_id
where degree > 12 
order by wine_type

--Find the producer who has produced the highest quantity of wine.
select Top 1  producer_id, sum(quantity) as totalquantity  
from producer 
join Harvest
on Producer.producer_id = Harvest.NumP
group by Producer.producer_id
order by totalquantity desc

--Find the average degree of wine produced.
select avg(degree) as averagewine 
from Wine 

--Find the oldest wine in the database.
select year
from wine 
group by year
order by year asc


--Retrieve a list of producers along with the total quantity of wine they have produced.
select producer_id, sum (quantity) as winequantity 
from harvest 
join Producer 
on Producer.producer_id= Harvest.NumP
group by producer_id


--Retrieve a list of wines along with their producer details.
select producer_id, first_name, last_name, region, wine_id, wine_type, year, degree
from Producer
join wine
on producer_id = wine_id
join harvest 
on Producer.producer_id = Harvest.NumW



