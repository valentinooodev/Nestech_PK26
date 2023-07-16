--- JOIN join 2 bảng với nhau dựa trên điều kiện ON

--JOIN trả ra kết quả nếu ở cả 2 bảng có bản ghi thỏa mãn
SELECT T1.[group],
T1.[value],
T2.[order]
FROM table_1 as T1
INNER JOIN table_2 as T2
ON T1.[group]=T2.[group]


--LEFT JOIN trả ra tất cả các bên ghi của bảng bên trái
--và bảng bên phải nếu có dữ liệu
--trường hợp bảng bên phải không có dữ liệu trả về null
SELECT T1.[group],
T1.[value],
T2.[order]
FROM table_1 as T1
LEFT JOIN table_2 as T2
ON T1.[group]=T2.[group]

--RIGHT JOIN trả ra tất cả các bản ghi của bảng bên phải
-- và bảng bên trái nếu có dữ liệu
-- trường hợp bảng bên trái không có dữ liệu sẽ trả về null
SELECT T1.[group],
T1.[value],
T2.[order]
FROM table_1 as T1
RIGHT JOIN table_2 as T2
ON T1.[group]=T2.[group]

--FULL JOIN trả ra các bản ghi của cả 2 bảng
-- Đáp ứng điều kiện thì có dữ liệu trên cả 2 bảng
-- Trường hợp bảng bên trái không tồn tại bảng bên phải đáp ứng điều kiện, có dữ liệu ở bảng bên trái, bảng bên phải null
-- Trường hợp bảng bên phải không tồn tại bảng bên trái đáp ứng điều kiện, có dữ liệu ở bảng bên phải, bảng bên trái null
SELECT T1.[group],
T1.[value],
T2.[group],
T2.[order]
FROM table_1 as T1
FULL JOIN table_2 as T2
ON T1.[group]=T2.[group]

--- UNION Ghép nối các kết quả truy vấn có số cột giống nhau
--- và kiểu dữ liệu xếp theo thứ tự của các cột là giống nhau
-- UNION sẽ bỏ các bản ghi bị trùng
-- UNION ALL lấy tất cả các bản ghi kể cả trùng
(truy_vấn_1) UNION (truy_vấn_2);
(truy_vấn_1) UNION ALL (truy_vấn_2);


-- Sử dụng subquery
--Chúng ta có thể sử dụng kết quả của một query (subquery) để làm tham số cho một query khác
--Lưu ý không sử dụng order by ở trong subquery
--Nên bao quanh subquery bằng một cặp dấu ngoặc đơn


-- CASE WHEN sử dụng như một cột
--Cấu trúc hàm CaseWhen:
CASE WHEN (điều_kiện_1) THEN value_1
WHEN (điều_kiện_1) THEN value_2
... ...
WHEN (điều_kiện_N) THEN value_N
ELSE giá_trị_mặc_định
END
