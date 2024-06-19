CREATE TABLE manufacturer (  
    manufacturer_id INT PRIMARY KEY,  
    manufacturer_name VARCHAR(20) NOT NULL  
);

insert all   
into manufacturer values(100,'Samsung Electronics')  
into manufacturer values(101,'Puma Sports.Ltd')  
into manufacturer values(102,'Diakin.Ltd')  
into manufacturer values(103,'Lenovo Grp.Ltd')  
into manufacturer values(104,'Octave Pvt.Ltd')  
into manufacturer values(105,'Titan')  
into manufacturer values(106,'Goldstar')  
into manufacturer values(107,'Hvac.Ltd ')  
into manufacturer values(108,'Whirpool Ind.Ltd')  
into manufacturer values(109,'Couturiere Coco.Ltd')  
select * from dual;

SELECT * FROM manufacturer;

CREATE TABLE product (  
    product_id INT PRIMARY KEY,  
    product_name VARCHAR(50) NOT NULL,  
    price DECIMAL(8 , 2) NOT NULL );

alter table product add manufacturer_id int;

alter table product add foreign key (manufacturer_id) references manufacturer(manufacturer_id) on delete cascade;

insert all  
into product values (1, 'Smartphone', 20000, 100)  
into product values (2, 'Shoes', 5000, 101)  
into product values (3, 'Air Conditioner', 30000, 102)  
into product values (4, 'Laptop', 50000, 103)  
into product values (5, 'Clothes', 2000, 104)  
into product values (6, 'Wrist Watch', 4000, 105)  
into product values (7, 'Television', 25000, 106)  
into product values (8, 'Refrigerator', 28000, 107)  
into product values (9, 'Washing Machine', 17000, 108)  
into product values (10, 'Perfume', 13000, 109)  
select 1 from dual;

SELECT * FROM product;

CREATE TABLE specifications (  
    brand VARCHAR(20) NOT NULL,  
    product_id INT PRIMARY KEY,  
    warranty INT,  
    product_description VARCHAR(100)  
);

desc specifications 


insert all  
into specifications values('Samsung',1,15,'Samsung Galaxy M53 5G (Deep Ocean Blue, 6GB, 128GB Storage)')  
into specifications values('Puma',2,6,'Puma Mens Dwane Idp Closed Shoe')  
into specifications values('Diakin',3,12,'Diakin 1.5 Ton 5 Star,Inverter Split AC')  
into specifications values('Lenovo',4,12,'Lenovo IdeaPad 3 10th Gen Intel Core i3 15.6 HD Thin and Light Laptop')  
into specifications values('Octave',5,3,'Octave Clothing Mens Round Neck Graphic Print T-Shirt')  
into specifications values('Fastrack',6,9,'Fastrack Reflex VOX Smartwatch with Alexa Built-in,1.69')  
into specifications values('LG',7,24,'LG 108 cm (43 inches) 4K Ultra HD Smart LED TV')  
into specifications values('Panasonic',8,18,'Panasonic Econavi 601 L 6-Stage Inverter Frost-Free Multi-Door Refrigerator')  
into specifications values('Whirpool',9,15,'Whirlpool 7 Kg 5 Star Fully-Automatic Top Loading Washing Machine')  
into specifications values('Chanel',10,null,'Coco By Chanel For Women 100 ml') select * from dual;

SELECT * FROM specifications;

CREATE TABLE man_normalized (  
    manufacturer_id INT,  
    manufacturer_phno number,  
    PRIMARY KEY (manufacturer_id , manufacturer_phno),  
    FOREIGN KEY (manufacturer_id)  
        REFERENCES manufacturer (manufacturer_id)  
        ON DELETE CASCADE  
);

insert all  
into man_normalized values(100, 8877665544)  
into man_normalized values(101, 987653245)  
into man_normalized values(102, 9900776655)  
into man_normalized values(103, 9833665544)  
into man_normalized values(104, 8967665004)  
into man_normalized values(105, 8432169944)  
into man_normalized values(106, 9334560044)  
into man_normalized values(107, 9999952244)  
into man_normalized values(108, 8899955414)  
into man_normalized values(109, 9898400133)  
select * from dual;

select * from man_normalized;

CREATE TABLE customer (  
    customer_id INT PRIMARY KEY,  
    customer_name VARCHAR(20) NOT NULL,  
    email_id VARCHAR(255),  
    CHECK (email_id LIKE '%@%') );

desc customer 


alter table customer add product_id int ;

alter table customer  
add foreign key (product_id) references product(product_id);

insert all  
into customer values(1000,'Ashish','ashish123@gmail.com',1)  
into customer values(1001,'Sumit','sumit123@gmail.com',2)  
into customer values(1002,'Akshat','akshat123@gmail.com',3)  
into customer values(1003,'Neeraj','neeraj123@gmail.com',4)  
into customer values(1004,'Girish','girish123@gmail.com',5)  
into customer values(1005,'Sukham','sukham123@gmail.com',6)  
into customer values(1006,'Lagan','lagan@gmail.com',7)  
into customer values(1007,'Himanshu','himanshu123@gmail.com',8)  
into customer values(1008,'Naman','naman123@gmail.com',9)  
into customer values(1009,'Aman','aman123@gmail.com',10)  
select * from dual;

SELECT * FROM customer;

CREATE TABLE customer_normalized (  
    customer_id INT,  
    customer_phno number,  
    PRIMARY KEY (customer_id , customer_phno),  
    FOREIGN KEY (customer_id)  
        REFERENCES customer (customer_id)  
        ON DELETE CASCADE  
);

insert all   
into customer_normalized values(1000,9988776655)  
into customer_normalized values(1001,9933006655)  
into customer_normalized values(1002,8842996655)  
into customer_normalized values(1003,8977662255)  
into customer_normalized values(1004,8877526655)  
into customer_normalized values(1005,9999006655)  
into customer_normalized values(1006,8888774400)  
into customer_normalized values(1007,8700444001)  
into customer_normalized values(1008,9352567800)  
into customer_normalized values(1009,9258787210)  
select * from dual;

SELECT   
    *  
FROM  
    customer_normalized;

CREATE TABLE reviews (  
    review_id INT PRIMARY KEY,  
    review_date varchar(100),  
    rating INT,  
    comments VARCHAR(100),  
    customer_id INT,  
    FOREIGN KEY (customer_id)  
        REFERENCES customer (customer_id)  
        ON DELETE CASCADE,  
    CHECK (rating <= 5 AND rating > 0) );

insert all  
into reviews values(20,'2022-02-01',4,'Awesome product',1000)  
into reviews values(21,'2021-04-27',3,'Very Comfortable Shoes',1001)  
into reviews values(22,'2020-03-26',3,'Ac cools the room very fast',1002)  
into reviews values(23,'2022-06-25',2,'Heating issues',1003)  
into reviews values(24,'2021-08-22',2,'cloth shrinked after washing',1004)  
into reviews values(25,'2020-09-18',5,'Elegant and comfortable',1005)  
into reviews values(26,'2022-12-06',5,'Vibrant colors and hd display',1006)  
into reviews values(27,'2022-09-04',1,'Cooling coil damaged',1007)  
into reviews values(28,'2020-03-12',2,'Outlet pipe damaged',1008)  
into reviews values(29,'2021-05-11',5,'Very good fragrance',1009)  
select * from dual;

SELECT * FROM reviews;

CREATE TABLE orders (  
    order_id INT PRIMARY KEY,  
    delivery_address VARCHAR(100) NOT NULL,  
    customer_id INT,  
    product_id INT,  
    FOREIGN KEY (customer_id)  
        REFERENCES customer (customer_id)  
        ON DELETE CASCADE,  
    FOREIGN KEY (product_id)  
        REFERENCES product (product_id)  
        ON DELETE CASCADE  
);

insert all   
into orders values(30,'Shimla',1000,1)  
into orders values(31,'Noida',1001,2)  
into orders values(32,'Faridabad',1002,3)  
into orders values(33,'Gurgaon',1003,4)  
into orders values(34,'Amritsar',1004,5)  
into orders values(35,'Chandigarh',1005,6)  
into orders values(36,'Delhi',1006,7)  
into orders values(37,'Panipat',1007,8)  
into orders values(38,'Lucknow',1008,9)  
into orders values(39,'Kanpur',1009,10)  
select * from dual;

SELECT   
    *  
FROM  
    orders;

SELECT p.product_id, p.product_name, p.price, m.manufacturer_name 
FROM product p;

SELECT p.product_id, p.product_name, p.price, m.manufacturer_name 
FROM product p 
INNER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id;

SELECT c.customer_id, c.customer_name, p.product_name 
FROM customer c 
INNER JOIN product p ON c.product_id = p.product_id 
WHERE p.product_name = 'Smartphone';

SELECT p.product_id, p.product_name, p.price, m.manufacturer_name 
FROM product p 
INNER JOIN manufacturer m ON p.manufacturer_id = m.manufacturer_id;

SELECT p.product_name, s.brand, s.warranty, s.product_description 
FROM product p 
INNER JOIN specifications s ON p.product_id = s.product_id;

SELECT r.rating, r.comments, c.customer_name 
FROM reviews r 
INNER JOIN customer c ON r.customer_id = c.customer_id 
WHERE r.product_id = 1; -- Replace '1' with the desired product ID 
;

SELECT r.rating, r.comments, c.customer_name 
FROM reviews r 
INNER JOIN customer c ON r.customer_id = c.customer_id 
WHERE r.product_id = 1;

SELECT p.product_name, COUNT(o.order_id) AS total_orders, SUM(p.price) AS total_revenue 
FROM product p 
LEFT JOIN orders o ON p.product_id = o.product_id 
GROUP BY p.product_name;

SELECT r.rating, r.comments, c.customer_name 
FROM reviews r 
INNER JOIN customer c ON r.customer_id = c.customer_id 
WHERE r.product_id = 1;

SELECT r.rating, r.comments, c.customer_name 
FROM reviews r 
INNER JOIN customer c ON r.customer_id = c.customer_id 
WHERE r.product_id = 6;

SELECT r.rating, r.comments, c.customer_name 
FROM reviews r 
INNER JOIN customer c ON r.customer_id = c.customer_id 
WHERE c.product_id = 6;

DECLARE 
CURSOR c1 IS SELECT * FROM product where product_id=1; 
CURSOR c2 IS SELECT * FROM specifications where product_id=1; 
rec c1%ROWTYPE; 
rec1 c2%ROWTYPE; 
BEGIN 
open c1; 
open c2; 
loop 
fetch c1 into rec; 
fetch c2 into rec1; 
exit when c1%NOTFOUND; 
dbms_output.put_line('brand of the product' || rec1.brand); 
dbms_output.put_line('warranty of the product' || rec1.warranty); 
dbms_output.put_line('description of the product' || rec1.product_description); 
end loop; 
close c1; 
close c2; 
end; 

/

