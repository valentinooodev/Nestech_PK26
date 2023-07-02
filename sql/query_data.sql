use my_database;

--Thay đổi kiểu dữ liệu ở các column cũ
alter table excel_tables alter column country int;

--Lấy tất cả các column trong table
select * from excel_tables;

--Lấy các clumn theo yêu cầu
select first_name, last_name, age from excel_tables;

--Sử dụng cột bí danh
select first_name as ten, last_name as ho, age as tuoi from excel_tables;

--Sử dụng toán tử nối chuỗi
select first_name + ' ' + last_name as full_name, age from excel_tables;

--Loại bỏ bản ghi bị trùng lặp
select distinct country from excel_tables;

--Lấy số lượng bản ghi mong muốn
select top 100 * from excel_tables;

--Sử dụng toán tử số học
select first_name, last_name, 2023 - age as year_of_birth from excel_tables;


--Sử dụng câu lệnh where để lọc 
select * from excel_tables where gender = 'Female' and age = 27;
select * from excel_tables where age in (25, 28, 29);


--Sử dụng câu lệnh like để search theo pattern
select * from excel_tables where first_name like '%a%';

alter table excel_tables add new_col nvarchar(50);

--update excel_tables set new_col = 'a' where no >=4;

--So sánh với null
select * from excel_tables where new_col is not null;


select * from excel_tables where age between 25 and 30;


--avg: Trung bình
--sum: tính tổng
--count: đếm số lượng bản ghi
--min: giá trị nhỏ nhất
--max: giá trị lơn nhất
select min(age) from excel_tables where country = 'France';

--Sử dụng group by để nhóm các bản ghi lại
select min(age), country from excel_tables where gender = 'Female' group by country;

--Sử dụng order by để sắp xếp lại thứ tự kết quả
select * from excel_tables order by age desc;

--Sử dụng having
select min(age), country from excel_tables group by country having min(age) > 22 ;


select count(*), country from excel_tables group by country;


alter table new_tables alter column last_name nvarchar(50);


select * from excel_tables order by no offset 100 rows fetch next 100 rows only;



CREATE TABLE mytable (
   name varchar(50),
   created_at datetime DEFAULT GETDATE(),
   --updated_at datetime DEFAULT GETDATE()
   --   ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO mytable (name)
VALUES ('John Doe'), ('Jane Smith'), ('Bob Johnson');
