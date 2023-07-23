CREATE DATABASE blog_database;
use blog_database;
CREATE TABLE accounts(
	id int primary key,
	email varchar(225) NOT NULL,
	UNIQUE(email),
	password varchar(225)
);

CREATE TABLE profiles(
	id int,
	primary key(id),
	username varchar(225) NOT NULL UNIQUE,
	gender varchar(6) check(gender='Male' or gender='Female'),
	date_of_birth varchar(225),
	address varchar(225),
	biography text,
	account_id int FOREIGN KEY REFERENCES accounts(id)
);
--khóa phụ sẽ kết nối accounts với profiles cho biết cột thông tin profile sẽ thuộc về acc nào 

CREATE TABLE posts(
	id int primary key,
	title varchar(225) NOT NULL UNIQUE,
	description text,
	content text NOT NULL,
	author_id int FOREIGN KEY REFERENCES profiles(id)
);
--khóa phụ kết nối từng cột post với id của profile

CREATE TABLE comments(
	id int primary key,
	post_id int FOREIGN KEY REFERENCES posts(id) NOT NULL,
	author_id int FOREIGN KEY REFERENCES profiles(id) NOT NULL,
	content text NOT NULL
);
--khóa phụ kết nối từng cột comment với id của post và profile


INSERT INTO accounts(id, email, password) 
VALUES
	(1,'user1', 'password'),
	(2,'user2', 'password'),
	(3,'user3', 'password'),
	(4,'user4', 'password'),
	(5,'user5', 'password');

INSERT INTO profiles(id,username, gender, date_of_birth, address, biography, account_id)
VALUES
	(1,'user1', 'male', '1990-01-15', 'Ha Noi', '...', 1),
	(2,'user2', 'female', '1991-01-15', 'Ha Noi', '...', 2),
	(3,'user3', 'male', '1992-01-15', 'Ha Noi', '...', 3),
	(4,'user4', 'female', '1993-01-15', 'Ha Noi', '...', 4),
	(5,'user5', 'female', '1994-01-15', 'Ha Noi', '...', 5);

INSERT INTO posts(id, title, description, content, author_id)
VALUES
	(1,'Post 1', 'Description 1', 'Content 1', 1),
	(2,'Post 2', 'Description 1', 'Content 1', 1),
	(3,'Post 3', 'Description 1', 'Content 1', 1),
	(4,'Post 4', 'Description 1', 'Content 1', 1),
	(5,'Post 5', 'Description 1', 'Content 1', 2),
	(6,'Post 6', 'Description 1', 'Content 1', 2),
	(7,'Post 7', 'Description 1', 'Content 1', 3),
	(8,'Post 8', 'Description 1', 'Content 1', 3),
	(9,'Post 9', 'Description 1', 'Content 1', 3),
	(10,'Post 10', 'Description 1', 'Content 1', 4);

INSERT INTO comments(id,post_id, author_id, content)
VALUES
	(1,1, 2, 'Great article, very informative!'),
	(2,1, 3, 'Well done, enjoyed reading this!'),
	(3,1, 4, 'Excellent content, thank you!'),
	(4,5, 1, 'Impressive article, keep it up!'),
	(5,5, 3, 'Love the insights, great job!'),
	(6,5, 4, 'Fantastic piece, learned a lot!'),
	(7,10, 1, 'Brilliant writing, thank you for sharing!'),
	(8,10, 2, 'Superb article, highly recommend!'),
	(9,10, 3, 'Top-notch content, thank you!'),
	(10,10, 5, 'Awesome read, thank you for this!');


--Truy vấn tên người dùng, địa chỉ, năm sinh của các người dùng, sắp xếp theo thứ tự năm sinh giảm dần
select username,address,date_of_birth  from profiles
order by date_of_birth DESC;

--Truy vấn hết các cột thông tin của người dùng là nữ có năm sinh lớn nhất (nhỏ tuổi nhất)
select TOP(1)* from profiles where gender = 'Female'
order by date_of_birth DESC;

--Truy vấn tên người dùng, địa chỉ, năm sinh và số lượng các bài viết của người dùng đó
SELECT p.username, p.address, p.date_of_birth, COUNT(posts.author_id) as post_count
FROM profiles p
LEFT JOIN posts ON p.account_id = posts.author_id
GROUP BY p.username, p.address, p.date_of_birth;

--Truy vấn các bình luận mà nội dung có chứa từ “thank”.
select content from comments where content like '%thank%';

-- Truy vấn tất cả các bình luận của người dùng có tên “user1”
SELECT content
FROM comments
WHERE author_id = (
  SELECT account_id
  FROM profiles
  WHERE username = 'user1'
);

--Truy vấn tên người dùng và tổng số bình luận của họ, sắp xếp theo thứ tự giảm dần của tổng số bình 
--luận, nếu số bình luận bằng nhau sắp xếp theo thứ tự tăng dần của tên người dùng
SELECT p.username, COUNT(c.author_id) as comment_count
FROM profiles p
LEFT JOIN comments c ON p.account_id = c.author_id
GROUP BY p.username
ORDER BY comment_count DESC, p.username ASC;
