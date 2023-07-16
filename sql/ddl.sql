--Tạo database mới, tên db là duy nhất
create database my_database;

--Xóa database
drop database my_database, my_database_2;

--Tạo Table
create table tên_table (
	--tên_cột kiểu_dữ_liệu(độ_dài_nếu có) default giá_trị_mặc_định primary key not null check () foreign key references Tên_bảng(tên_cột),
	col_1 int,
	gender nvarchar(10) check (gender in ('male', 'female')),
	score int check (score >=0 and score <=10),
)

--Xóa bảng
drop table tên_table;


-- Thêm cột
alter table tên_table add tên_column ...-- các thuộc tính, ràng buộc

-- Thay đổi kiểu dữ liệu của cột cũ
alter table tên_table alter column age type kiểu_dữ_liệu_mới;
