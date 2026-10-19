-- 1. Tạo bảng members trong schema "1"
CREATE TABLE "KhoaHoc".members (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    joined_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2. Tạo bảng courses trong schema "1"
CREATE TABLE "KhoaHoc".courses (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    capacity INT NOT NULL CHECK (capacity > 0)
);

-- 3. Tạo bảng registrations trong schema "1"
CREATE TABLE "KhoaHoc".registrations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    member_id INT NOT NULL REFERENCES "KhoaHoc".members(id),
    course_id INT NOT NULL REFERENCES "KhoaHoc".courses(id),
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    registered_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (member_id, course_id)
);

-- 4. Tạo chỉ mục (Index)
CREATE INDEX ix_reg_course ON "KhoaHoc".registrations (course_id);