# 📊 Supabase Table Outputs

---

## **Step 1: Students Table After Insert**

| id | first_name | last_name | email                     | enrollment_date |
| -- | ---------- | --------- | ------------------------- | --------------- |
| 1  | John       | Doe       | john.doe@example.com      | 2024-01-15      |
| 2  | Jane       | Smith     | jane.smith@example.com    | 2023-09-10      |
| 3  | Michael    | Brown     | michael.brown@example.com | 2022-05-20      |
| 4  | Emily      | Davis     | emily.davis@example.com   | 2023-11-01      |
| 5  | Chris      | Miller    | chris.miller@example.com  | 2021-08-25      |

---

## **Step 2: Courses Table After Insert**

| course_id | course_name                | ects | hours | format  | instructor         |
| --------- | -------------------------- | ---- | ----- | ------- | ------------------ |
| 1         | SQL Basics                 | 5    | 40    | Online  | Dr. Alice Johnson  |
| 2         | Data Science 101           | 6    | 50    | Campus  | Prof. Robert Green |
| 3         | Python for Beginners       | 4    | 30    | Blended | Dr. Sarah Lee      |
| 4         | Cybersecurity Fundamentals | 7    | 60    | Online  | Dr. James Smith    |
| 5         | AI and Machine Learning    | 8    | 70    | Campus  | Prof. Linda Brown  |

---

## **Step 3: Enrollments Table After Insert**

| enrollment_id | student_id | course_id | enrollment_date |
| ------------- | ---------- | --------- | --------------- |
| 1             | 2          | 1         | 2024-01-16      |
| 2             | 3          | 3         | 2023-09-12      |
| 3             | 5          | 2         | 2022-05-22      |
| 4             | 1          | 4         | 2023-11-05      |
| 5             | 4          | 5         | 2021-08-30      |
| 6             | 2          | 2         | 2024-02-01      |
| 7             | 3          | 5         | 2022-06-10      |

---

## **Step 4: Query Outputs**

### **4.1: Students Enrolled After 2023-09-30**

| id | first_name | last_name | email                     | enrollment_date |
| -- | ---------- | --------- | ------------------------- | --------------- |
| 1  | John       | Doe       | john.doe@example.com      | 2024-01-15      |
| 4  | Emily      | Davis     | emily.davis@example.com   | 2023-11-01      |

---

### **4.2: Students Whose Email is NOT Gmail**

| id | first_name | last_name | email                     | enrollment_date |
| -- | ---------- | --------- | ------------------------- | --------------- |
| 1  | John       | Doe       | john.doe@example.com      | 2024-01-15      |
| 2  | Jane       | Smith     | jane.smith@example.com    | 2023-09-10      |
| 3  | Michael    | Brown     | michael.brown@example.com | 2022-05-20      |
| 4  | Emily      | Davis     | emily.davis@example.com   | 2023-11-01      |
| 5  | Chris      | Miller    | chris.miller@example.com  | 2021-08-25      |

---

### **4.3: Students Enrolled Before 2025-01-01 and First Name 'Mario'**

| id | first_name | last_name | email | enrollment_date |
| -- | ---------- | --------- | ----- | --------------- |
|    |            |           |       |                 |

*No records found.*

---

### **4.4: List All Students and Their Enrolled Courses**

| first_name | last_name | course_name                | enrollment_date |
| ---------- | --------- | -------------------------- | --------------- |
| Michael    | Brown     | Python for Beginners       | 2023-09-12      |
| Michael    | Brown     | AI and Machine Learning    | 2022-06-10      |
| Emily      | Davis     | AI and Machine Learning    | 2021-08-30      |
| John       | Doe       | Cybersecurity Fundamentals | 2023-11-05      |
| Chris      | Miller    | Data Science 101           | 2022-05-22      |
| Jane       | Smith     | SQL Basics                 | 2024-01-16      |
| Jane       | Smith     | Data Science 101           | 2024-02-01      |

---

### **4.5: Find All Courses for a Specific Student (e.g., John Doe)**

| course_name                | enrollment_date |
| -------------------------- | --------------- |
| Cybersecurity Fundamentals | 2023-11-05      |

---

### **4.6: Count the Number of Students in Each Course**

| course_name                | student_count |
| -------------------------- | ------------- |
| Data Science 101           | 2             |
| AI and Machine Learning    | 2             |
| SQL Basics                 | 1             |
| Python for Beginners       | 1             |
| Cybersecurity Fundamentals | 1             |

---

### **4.7: List All Students Enrolled in More Than One Course**

| first_name | last_name | course_count |
| ---------- | --------- | ------------ |
| Michael    | Brown     | 2            |
| Jane       | Smith     | 2            |
