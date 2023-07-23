create database product_management;
use product_management;

create table product_types (
	id int primary key identity (1, 1),
	name varchar(100) unique not null,
)

create table manufactures (
	id int primary key identity (1, 1),
	name varchar(100) unique not null,
	country varchar(100) unique
)

create table products (
	id int primary key identity (1, 1),
	name varchar(255) unique not null,
	product_type_id int foreign key references product_types(id),
	manufacturer_id int foreign key references manufactures(id),
	quantity int not null check (quantity >= 0)
)

create table prices (
	id int primary key identity (1, 1),
	price int not null check (price >= 0),
	from_date date not null,
	to_date date,
	product_id int foreign key references products(id) not null, 
)

insert into manufactures (name, country)
values
	('Samsung', 'Korea'),
	('Sony', 'Japan'),
	('Apple', 'United State');

insert into product_types (name)
values
	('Mobile Phone'),
	('Tablet'),
	('Charge Adapter'),
	('Charge Cable'),
	('Headphone');

insert into products (name, product_type_id, manufacturer_id, quantity)
values
	('Samsung Galaxy S23', 1, 1, 100),
	('Samsung Galaxy S22', 1, 1, 50),
	('Sony MDR-XB700', 5, 2, 200),
	('Apple Airpod Pro', 5, 3, 150),
	('Iphone 14 Pro Max', 1, 3, 100),
	('Ipad Pro 2023', 2, 3, 100),
	('Samsung 40W Adapter', 3, 1, 100),
	('Samsung Type C Cable', 4, 1, 100),
	('Apple Lightning Cable', 4, 3, 100);


insert into prices (price, from_date, to_date, product_id)
values
	(25000000, '2022-12-01', '2023-07-01', 1),
	(22000000, '2023-07-01', null, 1),
	(20000000, '2022-12-01', '2023-01-30', 2),
	(20000000, '2023-01-30', null, 2),
	(1000000, '2021-01-01', null, 3),
	(2000000, '2022-12-01', '2023-01-08', 4),
	(1500000, '2023-01-08', null, 4),
	(30000000, '2022-12-01', null, 5),
	(25000000, '2022-12-01', null, 6),
	(500000, '2022-12-01', null, 7),
	(100000, '2022-12-01', null, 8),
	(200000, '2022-12-01', null, 9);

select 
  products.id, 
  products.name, 
  product_types.name as product_type_name, 
  manufactures.name as manufacture_name, 
  manufactures.country, 
  prices.price, 
  products.quantity 
from 
  products
  left join product_types on (
    product_types.id = products.product_type_id
  ) 
  left join manufactures on (
    manufactures.id = products.manufacturer_id
  ) 
  left join prices on (
    prices.product_id = products.id 
    and (
      prices.from_date <= getdate() 
      and (
        prices.to_date > getdate() 
        or prices.to_date is null
      )
    )
  );


select * from products where name = 'Samsung Galaxy S23' and quantity >= 3;
select products.name, prices.price * 3 as total_price from products join prices on (
    prices.product_id = products.id 
    and (
      prices.from_date <= getdate() 
      and (
        prices.to_date > getdate() 
        or prices.to_date is null
      )
    )
  )
where products.name = 'Samsung Galaxy S23';

update products set quantity = quantity - 3 where name = 'Samsung Galaxy S23';



select products.name, prices.id as price_id from products join prices on (
    prices.product_id = products.id 
    and (
      prices.from_date <= getdate() 
      and (
        prices.to_date > getdate() 
        or prices.to_date is null
      )
    )
  )
where products.name = 'Samsung Galaxy S23';

update prices set to_date = getdate() where id = 2;

insert into prices (price, from_date, to_date, product_id)
values
	(10000000, getdate(), null, 1);
