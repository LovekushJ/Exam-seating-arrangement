<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Student — Exam Seating</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<nav class="topnav">
  <a class="logo" href="index.jsp">Exam<span>Seat</span></a>
  <div class="topnav-links">
    <a href="addStudent.jsp">Add Student</a>
    <a href="viewStudents.jsp">Students</a>
    <a href="addRoom.jsp">Add Room</a>
    <a href="viewRooms.jsp">Rooms</a>
    <a href="generateSeating.jsp">Generate</a>
    <a href="viewSeating.jsp">View Seat</a>
  </div>
</nav>

<div class="container">
  <a href="index.jsp" class="back-link">&#8592; Back to Home</a>

  <div class="page-header">
    <div class="tag">Students</div>
    <h2>Add Student</h2>
    <p>Register a new student into the system.</p>
  </div>

  <div class="card">
    <form action="AddStudentServlet" method="post" onsubmit="return validateStudentForm()">
      <div class="form-row">
        <div class="form-group">
          <label>Roll Number</label>
          <input type="number" name="roll_no" required placeholder="1 – 60" min="1" max="60">
        </div>
        <div class="form-group">
          <label>Full Name</label>
          <input type="text" name="name" required placeholder="Student name">
        </div>
      </div>
      <div class="form-row">
        <div class="form-group">
          <label>Branch</label>
          <select name="branch" required>
            <option value="">Select branch</option>
            <option value="COMP">COMP</option>
            <option value="IT">IT</option>
            <option value="AIML">AIML</option>
            <option value="AIDS">AIDS</option>
            <option value="MECHANICAL">MECHANICAL</option>
            <option value="CIVIL">CIVIL</option>
          </select>
        </div>
        <div class="form-group">
          <label>Division</label>
          <select name="division" required>
            <option value="">Select division</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
          </select>
        </div>
      </div>
      <div class="form-group">
        <label>Year of Study</label>
        <select name="year" required>
          <option value="">Select year</option>
          <option value="FE">FE — First Year</option>
          <option value="SE">SE — Second Year</option>
          <option value="TE">TE — Third Year</option>
          <option value="BE">BE — Final Year</option>
        </select>
      </div>
      <button type="submit" class="btn btn-primary btn-full">Add Student</button>
    </form>
  </div>
</div>

<footer>&copy; 2026 Exam Seating System</footer>
<script src="script.js"></script>
</body>
</html>
