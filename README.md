# 🎓 Online Education Platform Database

A fully relational, normalized PostgreSQL database schema designed for an **Online Education Platform**, supporting user management, course enrollment, certification, and content publishing through blog posts. This project is suitable for educational, academic, or startup-level use cases involving online learning systems.

---

## 📌 Project Overview

This database is built to serve as the backend foundation for an online education system. It provides a modular and scalable data model that manages:

- Member registration and profile details
- Course management and enrollment tracking
- Certification generation and assignment
- Blog content creation by platform members
- Categorization of courses for discoverability

---

## 🧠 Key Features

✅ Normalized relational schema (3NF compliant)  
✅ Referential integrity via foreign key constraints  
✅ Unique constraints for critical fields (email, username, certificate_code)  
✅ Modular design to support extension and integration  
✅ Suitable for use in SQL-based web applications

---

## 🗂️ Project Structure

| File | Description |
|------|-------------|
| `Online Education Platform DB.sql` | PostgreSQL DDL file containing the schema definition |
| `ER Diagram for OEP DB.png` | Entity Relationship Diagram of the database structure |

---

## 🧬 Data Model Overview

![ER Diagram]

The system is composed of the following core entities:

- `Members`: Platform users (students, authors)
- `Courses`: Educational content offered on the platform
- `Enrollments`: Tracks course participation per member
- `Certificates`: Issued upon course completion
- `CertificateAssignments`: Links members to earned certificates
- `BlogPosts`: Articles published by members
- `Categories`: Classifies courses into thematic groups

---

## 📋 Table Descriptions

### 🧑‍💼 Members

Stores user credentials and personal info.

| Column | Type | Constraints |
|--------|------|-------------|
| `member_id` | BIGINT | Primary Key |
| `username` | VARCHAR | Unique |
| `email` | VARCHAR | Unique |
| `password` | VARCHAR | Not null |
| `registration_date` | TIMESTAMP | Default current timestamp |
| `first_name` | VARCHAR | - |
| `last_name` | VARCHAR | - |

---

### 📚 Courses

Stores course-related data.

| Column | Type | Description |
|--------|------|-------------|
| `course_id` | BIGINT | Primary Key |
| `name` | VARCHAR | Course title |
| `description` | TEXT | Syllabus/overview |
| `start_date`, `end_date` | DATE | Duration |
| `instructor` | VARCHAR | Instructor name |

---

### 📝 Enrollments

Tracks which members enrolled in which courses.

| Column | Type | Constraints |
|--------|------|-------------|
| `enrollment_id` | BIGINT | Primary Key |
| `member_id` | BIGINT | Foreign Key → Members |
| `course_id` | BIGINT | Foreign Key → Courses |
| `enrollment_date` | TIMESTAMP | - |

---

### 🏆 Certificates

Represents certificates issued by the platform.

| Column | Type | Constraints |
|--------|------|-------------|
| `certificate_id` | BIGINT | Primary Key |
| `certificate_code` | VARCHAR | Unique |
| `issue_date` | DATE | - |

---

### 🎖️ CertificateAssignments

Maps members to the certificates they've earned.

| Column | Type | Constraints |
|--------|------|-------------|
| `assignment_id` | BIGINT | Primary Key |
| `member_id` | BIGINT | Foreign Key → Members |
| `certificate_id` | BIGINT | Foreign Key → Certificates |
| `assignment_date` | DATE | - |

---

### ✍️ BlogPosts

Blog articles authored by members.

| Column | Type | Constraints |
|--------|------|-------------|
| `post_id` | BIGINT | Primary Key |
| `title` | VARCHAR | - |
| `content` | TEXT | - |
| `publish_date` | TIMESTAMP | - |
| `author_id` | BIGINT | Foreign Key → Members |

---

### 🗃️ Categories

Defines categories for organizing courses.

| Column | Type | Constraints |
|--------|------|-------------|
| `category_id` | SMALLINT | Primary Key |
| `category_name` | VARCHAR | - |

---

## 🚀 Usage Instructions

### 1. Import the Database

To initialize the database:

```bash
psql -U your_username -d your_database -f "Online Education Platform DB.sql"
```

Make sure PostgreSQL is installed and your user has the correct permissions.

### 2. Customize and Extend

- Add sample data using `INSERT` queries.
- Integrate with a backend service (Node.js, Django, Flask, etc.).
- Build front-end interfaces to consume the schema.

---

## 📈 Potential Extensions

- Role-based access (admin, student, instructor)
- Quiz/assessment modules
- Payment integration for premium courses
- Progress tracking per course
- Certificate verification endpoints

---

## 🤝 Contributing

Pull requests and forks are welcome! If you have ideas to improve the schema or want to add additional functionality, feel free to:

1. Fork the repository  
2. Create your feature branch: `git checkout -b feature/new-entity`  
3. Commit your changes  
4. Open a pull request for review  

---

## 📄 License

Feel free to use, modify, and share as needed.
---

## ✉️ Contact

If you have any questions or feedback, please feel free to reach out to me.

- GitHub: [https://github.com/ilaydakilinc]
- Email: [ilaydakilincthk@gmail.com]]
