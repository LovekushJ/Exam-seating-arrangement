<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Generate Seating — Exam Seating</title>
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
    <div class="tag">Seating</div>
    <h2>Generate Seating</h2>
    <p>Auto-assign all students to rooms based on roll number. Previous seating will be cleared.</p>
  </div>

  <div class="card">
    <p style="color:var(--muted); font-size:0.9rem; line-height:1.8; margin-bottom:24px;">
      ⚠️ &nbsp;This will <strong style="color:var(--accent2);">clear all existing seating</strong> and regenerate from scratch.<br>
      🔢 &nbsp;Roll <strong style="color:var(--text);">1–30</strong> → Room <code style="color:var(--accent3);">BRANCH-DIV1</code><br>
      🔢 &nbsp;Roll <strong style="color:var(--text);">31–60</strong> → Room <code style="color:var(--accent3);">BRANCH-DIV2</code><br>
      🏫 &nbsp;Make sure all required rooms are added before generating.
    </p>
    <form action="GenerateSeatingServlet" method="get">
      <button type="submit" class="btn btn-danger btn-full">⚙️ &nbsp;Generate Seating Now</button>
    </form>
  </div>

  <div class="card" style="background:rgba(67,232,176,0.05); border-color:rgba(67,232,176,0.2);">
    <p style="font-size:0.82rem; color:var(--muted); line-height:1.7;">
      <strong style="color:var(--accent3);">Room naming required:</strong><br>
      For COMP division A → add rooms <code style="color:var(--accent3);">COMP-A1</code> and <code style="color:var(--accent3);">COMP-A2</code><br>
      For IT division B → add rooms <code style="color:var(--accent3);">IT-B1</code> and <code style="color:var(--accent3);">IT-B2</code>
    </p>
  </div>
</div>

<footer>&copy; 2026 Exam Seating System</footer>
</body>
</html>
