				/* Creazione database "ToysGroup" e utilizzo */

CREATE DATABASE ToysGroup;
USE ToysGroup;
-- DROP DATABASE ToysGroup;								-- nel caso in cui si voglia cancellare il database (mi è servito durante l'esercitazione e l'ho tenuto commentato.

				/* Creazione tabelle con visualizzazione dei relativi DATATYPE */
                
CREATE TABLE Category (
  ID_Category TINYINT PRIMARY KEY	AUTO_INCREMENT		-- Ho usato TINYINT in quanto difficilmente si riuscirebbero a superare 127 tipi di categorie diverse
, CategoryName VARCHAR(25)
);

CREATE TABLE Region (
  ID_Region TINYINT PRIMARY KEY AUTO_INCREMENT		-- Ho usato TINYINT in quanto non si superano 127 aree geografiche diverse
, RegionName VARCHAR(40)	
, States VARCHAR(20)				-- Per questo database ho impostato la tabella con uno stato solo per regione. Avrei potuto creare una tabella con diversi stati, collegata a questa, ma non era necessario ai fini del compito.
);

CREATE TABLE States (
  ID_States TINYINT PRIMARY KEY AUTO_INCREMENT		-- Ho usato TINYINT in quanto non supero più di 5 stati
, StatesName VARCHAR(40)			
);


CREATE TABLE Product (
  ID_Product INT PRIMARY KEY AUTO_INCREMENT		-- Ho usato INT in quanto il database potrebbe espandersi (nella teoria) e quindi potrebbe servire più spazio, in questo esercizio basterebbe "TINYINT"
, ID_Category TINYINT							-- Ho usato TINYINT in quanto difficilmente si riuscirebbero a superare 127 tipi di categorie diverse
, ProductName VARCHAR(25)						
, StandardCost DECIMAL(20,2)					
, FinishedGoodsFlag CHAR(1) 					-- Ho usato CHAR perchè si tratta di un valore 0 o 1, basta 1 come dimensione del dato
, ListPrice DECIMAL(20,2)
												-- Dichiarazione delle chiavi esterne:
, FOREIGN KEY (ID_Category) REFERENCES Category (ID_Category)

);

CREATE TABLE Sales (
  SalesOrderNumber VARCHAR(20)		-- Ho usato VARCHAR perchè di solito si utilizzano valori alfanumerici
, SalesOrderLineNumber TINYINT 
, ID_Region TINYINT
, ID_Product INT
,OrderDate DATE
,OrderQuantity SMALLINT							
,TotalProductCost DECIMAL(10,2)

, PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber)

												-- Dichiarazione delle chiavi esterne:
                                                
, FOREIGN KEY (ID_Region) REFERENCES Region (ID_Region)
, FOREIGN KEY (ID_Product) REFERENCES Product (ID_Product)
);

				/* Inserimento dati nelle tabelle */
                
INSERT INTO Category (CategoryName) 			-- Non ho inserito dati all'interno della colonna "ID_Category" in quanto ho usato "AUTO_INCREMENT" in fase di creazione della tabella)
VALUES 		
('Action Figures'),
('Dolls'),
('Puzzles'),
('Board Games'),
('Outdoor Toys'),
('Educational Toys'),
('Building Blocks'),
('Remote Control Toys'),
('Stuffed Animals'),
('Art and Craft Kits');

INSERT INTO Product (ID_Category, ProductName, StandardCost, FinishedGoodsFlag, ListPrice) -- Non ho inserito dati all'interno della colonna "ID_Product" in quanto ho usato "AUTO_INCREMENT" in fase di creazione della tabella)
VALUES 
(1, 'Superhero Action Figure', 12.99, 1, 24.99),
(1, 'Robot Action Figure', 14.49, 1, 29.99),
(2, 'Barbie Doll', 10.99, 1, 19.99),
(2, 'Ken Doll', 9.99, 1, 18.99),
(3, '3D Puzzle', 7.99, 1, 15.99),
(3, 'Wooden Puzzle', 5.99, 1, 12.99),
(4, 'Monopoly Board Game', 15.99, 1, 29.99),
(4, 'Chess Set', 11.49, 1, 22.99),
(5, 'Soccer Ball', 8.49, 1, 16.99),
(5, 'Frisbee', 4.99, 1, 9.99),
(6, 'Math Learning Toy', 6.49, 1, 12.49),
(6, 'Science Experiment Kit', 10.99, 1, 19.99),
(7, 'Building Blocks Set', 11.99, 1, 24.99),
(7, 'Lego Castle Set', 14.99, 1, 29.99),
(8, 'RC Car', 20.49, 1, 39.99),
(8, 'RC Helicopter', 18.99, 1, 34.99),
(9, 'Teddy Bear', 9.49, 1, 18.49),
(9, 'Bunny Plush Toy', 8.99, 1, 17.99),
(10, 'Paint Set', 5.99, 1, 11.99),
(10, 'Clay Modeling Kit', 7.49, 1, 14.99),
(1, 'Action Hero Set', 13.49, 1, 26.99),
(1, 'Power Rangers Set', 16.49, 1, 31.99),
(2, 'Cinderella Doll', 12.99, 1, 22.49),
(2, 'Disney Princess Doll', 14.99, 1, 25.99),
(3, 'Puzzle Cube', 4.99, 1, 10.99),
(3, 'Jigsaw Puzzle', 6.49, 1, 13.99),
(4, 'Scrabble Board Game', 11.99, 1, 21.99),
(4, 'Risk Strategy Game', 16.99, 1, 32.99),
(5, 'Basketball', 9.99, 1, 19.99),
(5, 'Badminton Set', 7.49, 1, 14.99),
(6, 'Story Building Kit', 8.49, 1, 17.99),
(6, 'Geography Learning Set', 9.99, 1, 18.99),
(7, 'Toy Train Set', 13.49, 1, 27.99),
(7, 'Playdough Set', 5.99, 1, 12.49),
(8, 'Remote Control Boat', 22.99, 1, 44.99),
(8, 'RC Tank', 19.49, 1, 38.99),
(9, 'Plush Dinosaur', 11.99, 1, 22.49),
(9, 'Plush Elephant', 12.49, 1, 23.99),
(10, 'Art Easel Set', 14.49, 1, 29.99),
(10, 'Bead Craft Set', 8.99, 1, 17.49);

INSERT INTO Region (RegionName, States) 				-- Non ho inserito dati all'interno della colonna "ID_Region" in quanto ho usato "AUTO_INCREMENT" in fase di creazione della tabella)
VALUES
('North America', 'United States'),
('South America', 'Argentina'),
('Europe', 'Francia'),
('Asia', 'South Korea'),
('Africa', 'South Africa'),
('Oceania', 'Australia');

INSERT INTO SALES 
(SalesOrderNumber, SalesOrderLineNumber, ID_Region, ID_Product, OrderDate, OrderQuantity, TotalProductCost) 
VALUES
('SO4001', 1, 1, 15, '2023-05-01', 5, 120.50),
('SO4001', 2, 1, 8, '2023-05-01', 3, 85.30),
('SO4002', 1, 2, 12, '2023-06-15', 4, 102.75),
('SO4002', 2, 2, 34, '2023-06-15', 2, 44.95),
('SO4003', 1, 3, 6, '2023-07-10', 5, 99.50),
('SO4003', 2, 3, 25, '2023-07-10', 3, 65.20),
('SO4004', 1, 4, 3, '2023-08-20', 4, 112.90),
('SO4004', 2, 4, 27, '2023-08-20', 2, 54.99),
('SO4005', 1, 5, 19, '2023-09-25', 5, 150.85),
('SO4005', 2, 5, 30, '2023-09-25', 4, 76.95),
('SO4006', 1, 1, 11, '2023-10-15', 3, 95.00),
('SO4006', 2, 1, 36, '2023-10-15', 5, 65.50),
('SO4007', 1, 2, 7, '2023-11-12', 2, 45.75),
('SO4007', 2, 2, 20, '2023-11-12', 4, 82.65),
('SO4008', 1, 3, 32, '2023-12-05', 3, 125.40),
('SO4008', 2, 3, 18, '2023-12-05', 1, 50.50),
('SO4009', 1, 4, 9, '2024-01-10', 4, 119.75),
('SO4009', 2, 4, 22, '2024-01-10', 2, 65.40),
('SO4010', 1, 5, 13, '2024-02-14', 5, 132.60),
('SO4010', 2, 5, 28, '2024-02-14', 3, 95.75),
('SO4011', 1, 6, 4, '2024-03-05', 2, 72.30),
('SO4011', 2, 6, 24, '2024-03-05', 4, 84.90),
('SO4012', 1, 3, 40, '2024-04-08', 3, 54.10),
('SO4012', 2, 3, 2, '2024-04-08', 5, 120.40),
('SO4013', 1, 6, 1, '2024-05-15', 4, 99.25),
('SO4013', 2, 6, 33, '2024-05-15', 2, 45.65),
('SO4014', 1, 2, 38, '2024-06-20', 3, 110.00),
('SO4014', 2, 2, 14, '2024-06-20', 5, 65.25),
('SO4015', 1, 1, 21, '2024-07-10', 2, 79.50),
('SO4015', 2, 1, 35, '2024-07-10', 4, 87.10),
('SO4016', 1, 1, 8, '2024-08-05', 3, 55.80),
('SO4016', 2, 1, 10, '2024-08-05', 5, 99.50),
('SO4017', 1, 2, 23, '2024-09-18', 4, 82.75),
('SO4017', 2, 2, 16, '2024-09-18', 3, 72.60),
('SO4018', 1, 3, 31, '2024-10-14', 2, 63.40),
('SO4018', 2, 3, 12, '2024-10-14', 5, 99.99),
('SO4019', 1, 4, 5, '2024-11-02', 3, 80.55),
('SO4019', 2, 4, 29, '2024-11-02', 4, 95.00),
('SO4020', 1, 5, 19, '2024-12-01', 2, 59.30),
('SO4020', 2, 5, 13, '2024-12-01', 5, 112.60),
('SO4021', 1, 6, 26, '2023-01-10', 3, 120.40),
('SO4021', 2, 6, 34, '2023-01-10', 1, 50.30),
('SO4022', 1, 5, 39, '2023-02-20', 4, 95.20),
('SO4022', 2, 5, 40, '2023-02-20', 2, 79.80),
('SO4023', 1, 6, 17, '2023-03-13', 3, 88.90),
('SO4023', 2, 6, 6, '2023-03-13', 5, 120.50);

						/* 	QUERY */

-- 1. Verificare che i campi definiti come PK siano univoci.
		
        -- Tabella "Category"
SELECT 		
	count(ID_Category) AS Numero_Categorie						-- conteggio dei valori (risultato: 10) - il count esclude eventuali "null"
    ,count( DISTINCT ID_Category) AS Categorie_Uniche			-- conteggio dei valori, con il distinct (risultato: 10). - il count esclude eventuali "null"
FROM Category;									
-- Con questa query vediamo che entrambi i risultati sono uguali, quindi dimostriamo che i campi della primary key, sono univoci.


        -- Tabella "Product"
SELECT 		
	count(ID_Product) AS Numero_Prodotti						-- conteggio dei valori (risultato: 40) - il count esclude eventuali "null"
    ,count( DISTINCT ID_Product) AS Prodotti_Unici				-- conteggio dei valori, con il distinct (risultato: 40). - il count esclude eventuali "null"
FROM Product;							
-- Con questa query vediamo che entrambi i risultati sono uguali, quindi dimostriamo che i campi della primary key, sono univoci.


        -- Tabella "Region"
SELECT 		
	count(ID_Region) AS Numero_Regioni							-- conteggio dei valori (risultato: 6) - il count esclude eventuali "null"
    ,count( DISTINCT ID_Region) AS Regioni_Uniche				-- conteggio dei valori, con il distinct (risultato: 6). - il count esclude eventuali "null"
FROM Region;							
-- Con questa query vediamo che entrambi i risultati sono uguali, quindi dimostriamo che i campi della primary key, sono univoci.


        -- Tabella "Sales"

SELECT 		
count(*) AS Numero_Vendite														-- conteggio delle righe (risultato: 46) - il count esclude eventuali "null"
,count(DISTINCT SalesOrderNumber,SalesOrderLineNumber) AS Vendite_Uniche		-- conteggio dei valori, con il distinct (risultato: 46). - il count esclude eventuali "null"
FROM Sales;
-- Con questa query vediamo che entrambi i risultati sono uguali, quindi dimostriamo che i campi della primary key combinata, sono univoci.


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 2. Esporre l’elenco dei soli prodotti venduti e, per ognuno di questi, il fatturato totale per anno.

SELECT 

p.ID_Product AS IdProdotto
,p.ProductName AS NomeProdotto
,YEAR(OrderDate) AS AnnoRiferimento
,CONCAT(SUM(p.ListPrice*s.OrderQuantity), ' ', "$") AS FatturatoTotale			-- ho utilizzato un concat per far vedere, in visualizzazione, la valuta in dollari.

FROM product p
INNER JOIN sales s																-- ho usato una inner join, in quanto cosi troviamo i prodotti (della tabella product) che si trovano nella tabella sales (quindi quelli venduti)
ON p.ID_Product = s.ID_Product
GROUP BY p.ID_Product,YEAR(OrderDate)											-- group by per ordinare per anno e per i prodotti (quindi è possibile trovare due volte gli stessi prodotti, ma in anni diversi, esempio IdProdotto: 8)
ORDER BY p.ID_Product;															-- Essendo che la prima richiesta chiedeva l'elenco dei prodotti, ho ordinato la visualizzazione per prodotti.


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 3. Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente. 

SELECT 
														
r.States AS Stato
,YEAR(s.OrderDate) AS AnnoRiferimento
,CONCAT(SUM(p.ListPrice*s.OrderQuantity), ' ', "$") AS FatturatoTotale			-- ho utilizzato un concat per far vedere, in visualizzazione, la valuta in dollari.

FROM sales s
INNER JOIN product p															
ON p.ID_Product = s.ID_Product													
INNER JOIN region r																	
ON r.ID_Region = s.ID_Region													

GROUP BY States, YEAR(s.OrderDate)
ORDER BY YEAR(s.OrderDate), (SUM(p.ListPrice*s.OrderQuantity)) DESC;			-- non ho ordinato per data, ma per anno, in quanto restituirebbe più record e andrebbe in conflitto con la prima richiesta che voleva 
																				-- la visualizzazione dell'anno. 

/* ho utilizzato una doppia "Inner Join" per unire le tre tabelle (sales, product,region), ma potevo usare anche una vista. 
Ho preferito cosi solo per una questione di esposizione dell'esercizio, quindi far vedere tutti i passaggi. 
Nel caso in cui avessi voluto creare una vista, la sintassi sarebbe stata:
;CREATE VIEW ToysGroup.SalesProductRegion AS ( SELECT * FROM sales s INNER JOIN product p ON p.ID_Product = s.ID_Product INNER JOIN region r ON r.ID_Region = s.ID_Region); */


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 4. Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?

SELECT 

CategoryName
,SUM(s.orderquantity) AS QuantitàVendute
FROM product p
INNER JOIN category c
ON c.ID_Category = p.ID_Category
INNER JOIN sales s
ON p.ID_Product = s.ID_Product
GROUP BY c.ID_Category
ORDER BY QuantitàVendute DESC;

/* Per quanto riguarda la richiesta, ho pensato che "gli articoli maggiormente richiesti" fossero quelli più venduti, quindi ho estrapolato la somma delle quantità vendute per ogni categoria,
con il risultato che, con 20 quantità vendute, le categorie più richieste sono: "Building Blocks" e "Art and Craft Kits" 
Ho eseguito le inner join su product,category e sales, in quanto mi serviva collegare sales a category tramite product. 
 */

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- 5. Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti. 
			-- PRIMO APPROCCIO
SELECT
p.ID_Product AS IdProdotto
,s.ID_Product AS IdProdottoSales										-- giusto per capire, a livello di visualizzazione, che effettivamente manca la vendita per quel prodotto
,p.ProductName AS NomeProdotto
,p.FinishedGoodsFlag
FROM product p
LEFT JOIN sales s
ON p.ID_Product = s.ID_Product
WHERE p.FinishedGoodsFlag = "1" AND s.ID_Product is null;

/* Per questa richiesta, ho utilizzato una LEFT JOIN, in quanto ci serve estrapolare tutti i prodotti, e poi fare il contronto con la tabella sales per vedere quali tra questi non sono stati venduti.
Il controllo nel where, è stato fatto sul "p.FinishedGoodsFlag" in quanto il prodotto, per essere invenduto, deve anche essere disponibile alla vendita (quindi finito).
Il risultato è che il prodotto "Plush Dinosaur", ID_Prodotto "37", ha 0 vendite.
controprova, cerchiamo l'id 37 per vedere se ha vendite: 
SELECT * FROM product p LEFT JOIN sales s ON p.ID_Product = s.ID_Product WHERE p.id_product = 37; 
Il risultato restituisce null nelle colonne della tabella sales. */

			-- SECONDO APPROCCIO

SELECT
s.ID_Product AS IdProdotto												-- giusto per capire, a livello di visualizzazione, che effettivamente manca la vendita per quel prodotto
,p.ProductName AS NomeProdotto
,COUNT(OrderQuantity) AS QuantitàVendute

FROM product p
LEFT JOIN sales s
ON p.ID_Product = s.ID_Product
GROUP BY s.ID_Product, p.ProductName
HAVING s.ID_Product IS NULL 
ORDER BY COUNT(OrderQuantity) ASC
;

/* Il controllo è stato fatto, questa volta, sulle quantità vendute. Quindi utilizzando sempre una LEFT JOIN, ho visualizzato il prodotto con meno vendite. 
Il prodotto con meno vendite è: "Plush Dinosaur", ID_Prodotto "37", con 0 vendite, come nella query precedente. */

			-- APPROCCIO EXTRA

SELECT
p.ID_Product AS IdProdotto
,p.ProductName AS NomeProdotto
,OrderDate AS DataVendita

FROM product p
LEFT JOIN sales s
ON p.ID_Product = s.ID_Product

GROUP BY p.ID_Product,OrderDate
ORDER BY OrderDate ASC
LIMIT 1;

/* Approccio in più, molto simile all'esempio precedente, ma essendo che ho visto che il prodotto con meno vendite è "Plush Dinosaur", ID_Prodotto "37", ed è quindi un singolo record, si può utilizzare 
anche il LIMIT 1, senza utilizzare l'HAVING. Inoltre ho messo in visualizzazione la data vendita che risulta NULL, quindi la vendita non è stata effettuata.*/

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Esercizio 6: Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente).

SELECT
s.ID_Product AS IdProdotto
,ProductName AS NomeProdotto
,MAX(OrderDate) AS UltimaVendita

FROM product p
INNER JOIN sales s
ON p.ID_Product = s.ID_Product
GROUP BY s.ID_Product
ORDER BY s.ID_Product											-- Ho ordinato per prodotto in quanto nella richiesta chiedeva di esporre i prodotti, quindi ho preferito far vedere loro in maniera ordinata.
;

/* In questo caso mi è bastato ordinare per prodotto "s.ID_Product", ma inserire il "MAX(OrderDate)" sul SELECT. 
Quindi in visualizzazione ho ottenuto un raggruppamento senza duplicati per "s.ID_Product", e il valore massimo delle date di vendita per ogni prodotto con "MAX(OrderDate)".
Come controprova, ho raggruppato anche per OrderDate (vedi sotto), e ho visto che restituisce tutti i prodotti venduti, potendo cosi controllare la data più recente e fare il confronto con la query qui sopra. 

SELECT
p.ID_Product AS IdProdotto
,ProductName AS NomeProdotto
,OrderDate AS DataVendita

FROM product p
INNER JOIN sales s
ON p.ID_Product = s.ID_Product
GROUP BY p.ID_Product, OrderDate
ORDER BY p.ID_Product;
*/ 