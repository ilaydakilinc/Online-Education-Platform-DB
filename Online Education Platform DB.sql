CREATE TABLE Members (
    member_id BIGINT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE Courses (
    course_id BIGINT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    instructor VARCHAR(100)
);

CREATE TABLE Categories (
    category_id SMALLINT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id BIGINT PRIMARY KEY,
    member_id BIGINT REFERENCES Members(member_id),
    course_id BIGINT REFERENCES Courses(course_id),
    enrollment_date TIMESTAMP
);

CREATE TABLE Certificates (
    certificate_id BIGINT PRIMARY KEY,
    certificate_code VARCHAR(100) UNIQUE NOT NULL,
    issue_date DATE
);

CREATE TABLE CertificateAssignments (
    assignment_id BIGINT PRIMARY KEY,
    member_id BIGINT REFERENCES Members(member_id),
    certificate_id BIGINT REFERENCES Certificates(certificate_id),
    assignment_date DATE
);

CREATE TABLE BlogPosts (
    post_id BIGINT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    publish_date TIMESTAMP NOT NULL,
    author_id BIGINT REFERENCES Members(member_id)
);

INSERT INTO Members (member_id, username, email, password, registration_date, first_name, last_name) VALUES
(1, 'john_doe', 'john@example.com', 'password123', NOW(), 'John', 'Doe'),
(2, 'jane_smith', 'jane@example.com', 'password456', NOW(), 'Jane', 'Smith'),
(3, 'alice_jones', 'alice@example.com', 'password789', NOW(), 'Alice', 'Jones');

SELECT * FROM Members;

INSERT INTO Courses (course_id, name, description, start_date, end_date, instructor) VALUES
(1, 'Veritabanı Yönetimi', 'PostgreSQL ile veritabanı yönetimi eğitimi.', '2023-05-01', '2023-06-01', 'Dr. Ahmet Yılmaz'),
(2, 'Veri Bilimi', 'Veri bilimi ve makine öğrenimi temelleri.', '2023-07-01', '2023-08-01', 'Prof. Elif Demir'),
(3, 'Web Geliştirme', 'HTML, CSS ve JavaScript ile web geliştirme.', '2023-09-01', '2023-10-01', 'Dr. Mehmet Can');

SELECT * FROM Courses;

INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Yapay Zeka'),
(2, 'Veri Bilimi'),
(3, 'Web Geliştirme'),
(4, 'Siber Güvenlik');

SELECT * FROM Categories;

INSERT INTO Enrollments (enrollment_id, member_id, course_id, enrollment_date) VALUES
(1, 1, 1, NOW()),
(2, 1, 2, NOW()),
(3, 2, 1, NOW()),
(4, 3, 3, NOW());

SELECT * FROM Enrollments;

INSERT INTO Certificates (certificate_id, certificate_code, issue_date) VALUES
(1, 'CERT123', '2023-06-02'),
(2, 'CERT456', '2023-08-02'),
(3, 'CERT789', '2023-10-02');

SELECT * FROM Certificates;

INSERT INTO CertificateAssignments (assignment_id, member_id, certificate_id, assignment_date) VALUES
(1, 1, 1, '2023-06-02'),
(2, 2, 2, '2023-08-02'),
(3, 3, 3, '2023-10-02');

SELECT * FROM CertificateAssignments;

INSERT INTO BlogPosts (post_id, title, content, publish_date, author_id) VALUES
(1, 'Veritabanı Yönetimi Nedir?', 'Veritabanı yönetimi, verilerin düzenli bir şekilde saklanması ve yönetilmesi sürecidir.', NOW(), 1),
(2, 'Veri Bilimi ve Geleceği', 'Veri bilimi, günümüzün en önemli alanlarından biridir.', NOW(), 2),
(3, 'Web Geliştirme Temelleri', 'Web geliştirme, internet üzerinde uygulama ve sitelerin oluşturulmasıdır.', NOW(), 3);

SELECT * FROM BlogPosts;


