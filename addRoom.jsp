<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Room — Exam Seating</title>
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
    <div class="tag">Rooms</div>
    <h2>Add Room</h2>
    <p>Register an exam room with its seating capacity.</p>
  </div>

  <div class="card">
    <form action="AddRoomServlet" method="post" onsubmit="return validateRoomForm()">
      <div class="form-group">
        <label>Room Number</label>
        <input type="text" name="room_no" required placeholder="e.g. COMP-A1">
      </div>
      <div class="form-group">
        <label>Capacity</label>
        <input type="number" name="capacity" value="30" min="1" max="100" required>
      </div>
      <button type="submit" class="btn btn-primary btn-full">Add Room</button>
    </form>
  </div>

  <div class="card" style="background:rgba(108,99,255,0.05); border-color:rgba(108,99,255,0.2);">
    <p style="font-size:0.82rem; color:var(--muted); line-height:1.7;">
      <strong style="color:var(--accent);">Room naming convention:</strong><br>
      Use format <code style="color:var(--accent3);">BRANCH-DIVISION1</code> or <code style="color:var(--accent3);">BRANCH-DIVISION2</code><br>
      Example: <code style="color:var(--accent3);">COMP-A1</code>, <code style="color:var(--accent3);">COMP-A2</code>, <code style="color:var(--accent3);">IT-B1</code>
    </p>
  </div>
</div>

<footer>&copy; 2026 Exam Seating System</footer>
<script src="script.js"></script>
</body>
</html>
