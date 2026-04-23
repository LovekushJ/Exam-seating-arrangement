# 🎓 Exam Seating Arrangement System

![Java](https://img.shields.io/badge/Java-EE-orange?style=flat-square)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=flat-square)
![Tomcat](https://img.shields.io/badge/Apache%20Tomcat-9-green?style=flat-square)
![JSP](https://img.shields.io/badge/JSP-Servlets-red?style=flat-square)

A Java EE web application that automates exam seating arrangement for engineering colleges with multiple branches and divisions.

---

## 📋 Table of Contents
- [Overview](#-overview)
- [Tech Stack](#️-tech-stack)
- [Project Structure](#-project-structure)
- [Database Setup](#️-database-setup)
- [Installation](#️-installation)
- [How to Use](#-how-to-use)
- [Room Naming Convention](#-room-naming-convention)
- [Seating Logic](#-seating-logic)
- [Features](#-features)
- [Common Issues](#-common-issues--fixes)

---

## 🎯 Overview

Administrators can manage students and rooms, generate seating plans with one click, and students can instantly look up their assigned seat by entering their branch, division and roll number.

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Frontend | JSP, HTML5, CSS3, JavaScript |
| Backend | Java Servlets (Java EE) |
| Database | MySQL 8.0 |
| Server | Apache Tomcat 9 |
| IDE | Eclipse IDE |
| DB Driver | MySQL Connector/J 9.6.0 |

---

## 📁 Project Structure
SeatingArrangement/
├── src/main/java/
│   ├── dao/
│   │   ├── Roomdao.java
│   │   ├── Seatingdao.java
│   │   └── Studentdao.java
│   ├── model/
│   │   ├── Room.java
│   │   ├── Seating.java
│   │   └── Student.java
│   ├── servlet/
│   │   ├── AddRoomServlet.java
│   │   ├── AddStudentServlet.java
│   │   ├── GenerateSeatingServlet.java
│   │   ├── ViewSeatingServlet.java
│   │   ├── DeleteRoomServlet.java
│   │   └── DeleteStudentServlet.java
│   └── util/
│       └── DBConnection.java
└── src/main/webapp/
├── css/
│   └── style.css
├── WEB-INF/
│   └── lib/
│       └── mysql-connector-j-9.6.0.jar
├── index.jsp
├── addStudent.jsp
├── viewStudents.jsp
├── addRoom.jsp
├── viewRooms.jsp
├── generateSeating.jsp
├── viewSeating.jsp
├── error.jsp
└── script.js

---

## 🗄️ Database Setup

Run this SQL script in MySQL Workbench:

```sql
-- Create and select database
DROP DATABASE IF EXISTS Exam_seating;
CREATE DATABASE Exam_seating;
USE Exam_seating;

-- Student table
CREATE TABLE student (
    roll_no       INT          NOT NULL,
    name          VARCHAR(20)  NOT NULL,
    branch        VARCHAR(20)  NOT NULL,
    division      CHAR(1)      NOT NULL,
    yearofstudy   VARCHAR(10)  NOT NULL,
    PRIMARY KEY (branch, division, roll_no),
    CONSTRAINT chk_year CHECK (yearofstudy IN ('FE','SE','TE','BE'))
);

-- Room table
CREATE TABLE room (
    room_no   VARCHAR(10)  NOT NULL,
    capacity  INT          NOT NULL DEFAULT 30,
    PRIMARY KEY (room_no)
);

-- Seating table
CREATE TABLE seating (
    branch    VARCHAR(20)  NOT NULL,
    division  CHAR(1)      NOT NULL,
    roll_no   INT          NOT NULL,
    room_no   VARCHAR(10)  NOT NULL,
    seat_no   INT          NOT NULL,
    PRIMARY KEY (room_no, seat_no),
    UNIQUE (branch, division, roll_no),
    FOREIGN KEY (branch, division, roll_no)
        REFERENCES student(branch, division, roll_no),
    FOREIGN KEY (room_no)
        REFERENCES room(room_no)
);

-- Verify
SHOW TABLES;
DESCRIBE student;
DESCRIBE room;
DESCRIBE seating;
```

---

## ⚙️ Installation

### Prerequisites
- Java JDK 8 or above
- Eclipse IDE for Enterprise Java Developers
- Apache Tomcat 9
- MySQL 8.0
- MySQL Workbench

### Steps

**1. Import Project**
Download and import into Eclipse as an existing project.

**2. Run the SQL script**
Open MySQL Workbench, paste and run the full SQL script above.

**3. Update DB credentials**
Open `src/main/java/util/DBConnection.java`:
```java
private static final String URL = "jdbc:mysql://localhost:3306/Exam_seating?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "your_password_here";
```

**4. Add MySQL JAR**
Place `mysql-connector-j-9.6.0.jar` inside `webapp/WEB-INF/lib/`

**5. Add Tomcat in Eclipse**
Go to Servers tab → Add Tomcat 9 → Add your project.

**6. Clean and Run**
- Project → Clean → Clean All
- Right-click Tomcat → Clean → Restart
- Right-click project → Run As → Run on Server

**7. Open in browser**
http://localhost:8080/SeatingArrangement/index.jsp

---

## 🚀 How to Use

> Follow this exact order every time

| Step | Action |
|---|---|
| 1 | Go to **Add Room** and register all rooms |
| 2 | Go to **Add Student** and register students |
| 3 | Go to **Generate Seating** and click Generate |
| 4 | Go to **View Seating** and search by roll number |

---

## 🏫 Room Naming Convention

Rooms **must** follow the format `BRANCH-DIVISION1` or `BRANCH-DIVISION2`:

| Branch | Division | Room 1 | Room 2 |
|---|---|---|---|
| COMP | A | `COMP-A1` | `COMP-A2` |
| IT | B | `IT-B1` | `IT-B2` |
| AIML | A | `AIML-A1` | `AIML-A2` |
| MECHANICAL | C | `MECHANICAL-C1` | `MECHANICAL-C2` |

---

## 🔢 Seating Logic

| Roll Number | Assigned Room | Seat Number |
|---|---|---|
| 1 – 30 | `BRANCH-DIV1` | = Roll No |
| 31 – 60 | `BRANCH-DIV2` | = Roll No − 30 |

**Example:** Roll `35` from `COMP-A` → Room `COMP-A2`, Seat `5`

---

## 🌐 Supported Branches & Divisions

**Branches:** `COMP` `IT` `AIML` `AIDS` `MECHANICAL` `CIVIL`

**Divisions:** `A` `B` `C` `D`

**Max students per division:** 60 &nbsp;|&nbsp; **Per room:** 30

---

## ✨ Features

- ➕ Add, view and delete students
- 🏫 Add, view and delete exam rooms
- ⚙️ One-click seating generation for all branches and divisions
- 🔍 Student seat lookup by branch, division and roll number
- 📊 Live dashboard with real-time student and room counts
- 🗑️ Confirmation dialogs before all delete operations
- ⚠️ Descriptive error pages with back navigation

---

## 🐛 Common Issues & Fixes

| Issue | Fix |
|---|---|
| `Unknown column 'yearofstudy'` | Re-run SQL script using `DROP DATABASE` first |
| CSS not loading | Ensure `style.css` is inside `webapp/css/` folder |
| `ClassNotFoundException` MySQL driver | Check JAR is inside `WEB-INF/lib/` |
| NullPointerException on Generate | Add required rooms before generating seating |
| Port 8080 in use | Change Tomcat port in Eclipse → Servers tab |

---

## 👤 Author: Lovekush Jaiswar

Developed as a Mini Project — Academic Year **2025–2026**

> Built with Java EE · JSP · Servlets · JDBC · MySQL · Apache Tomcat 9
