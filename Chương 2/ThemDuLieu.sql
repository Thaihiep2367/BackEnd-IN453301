-- 1. Chèn dữ liệu mẫu vào bảng members
INSERT INTO "KhoaHoc".members (full_name, email) VALUES
    ('Nguyễn An', 'an@dthu.edu.vn'),
    ('Trần Bình', 'binh@dthu.edu.vn'),
    ('Lê Chi', 'chi@dthu.edu.vn');

-- 2. Chèn dữ liệu mẫu vào bảng courses
INSERT INTO "KhoaHoc".courses (title, capacity) VALUES
    ('Lập trình Web', 2),
    ('Cơ sở dữ liệu', 40);

-- 3. Chèn dữ liệu mẫu vào bảng registrations
INSERT INTO "KhoaHoc".registrations (member_id, course_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1);

-- 4. Kiểm tra dữ liệu sau khi chèn
SELECT * FROM "KhoaHoc".members;
SELECT * FROM "KhoaHoc".courses;
SELECT * FROM "KhoaHoc".registrations;