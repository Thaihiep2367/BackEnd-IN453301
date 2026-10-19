--Câu 1 Liệt kê tên các khoá học mà Nguyễn An đã đăng ký (JOIN)
SELECT c.title AS ten_khoa_hoc
FROM "KhoaHoc".courses c
JOIN "KhoaHoc".registrations r ON c.id = r.course_id
JOIN "KhoaHoc".members m ON m.id = r.member_id
WHERE m.full_name = 'Nguyễn An';

-- Câu 2 Đếm số thành viên của mỗi khoá, khoá nhiều người nhất đứng đầu (GROUP BY)
SELECT 
    c.id,
    c.title AS ten_khoa_hoc,
    COUNT(r.member_id) AS so_luong_thanh_vien
FROM "KhoaHoc".courses c
LEFT JOIN "KhoaHoc".registrations r ON c.id = r.course_id
GROUP BY c.id, c.title
ORDER BY COUNT(r.member_id) DESC;

-- Câu 3 Chuyển Lê Chi vào khoá "Cơ sở dữ liệu" bằng một transaction
-- Bắt đầu Transaction
BEGIN;

-- Thêm đăng ký khoá học "Cơ sở dữ liệu" (id = 2) cho Lê Chi (id = 3)
INSERT INTO "KhoaHoc".registrations (member_id, course_id)
VALUES (3, 2);

-- Kết thúc và xác nhận lưu giao dịch
COMMIT;

-- Kiểm tra lại thông tin vừa chuyển/đăng ký
SELECT 
    m.full_name,
    c.title,
    r.status,
    r.registered_at
FROM "KhoaHoc".registrations r
JOIN "KhoaHoc".members m ON m.id = r.member_id
JOIN "KhoaHoc".courses c ON c.id = r.course_id
WHERE m.full_name = 'Lê Chi';