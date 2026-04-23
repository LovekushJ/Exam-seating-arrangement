<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="model.Seating" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Seating — Exam Seating</title>
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
    <h2>View Seating</h2>
    <p>Find your assigned exam room and seat number.</p>
  </div>

  <div class="card">
    <form action="ViewSeatingServlet" method="post">
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
        <label>Roll Number</label>
        <input type="number" name="roll_no" required placeholder="Enter your roll number" min="1" max="60">
      </div>
      <button type="submit" class="btn btn-primary btn-full">🔍 &nbsp;Find My Seat</button>
    </form>
  </div>

  <%-- Show generation result message --%>
  <%
    String genMsg = (String) request.getAttribute("message");
    if (genMsg != null) {
  %>
    <div class="alert alert-success">✅ <%= genMsg %></div>
  <% } %>

  <%-- Show not found message --%>
  <%
    String notFound = (String) request.getAttribute("notFound");
    if (notFound != null) {
  %>
    <div class="alert alert-error">❌ <%= notFound %></div>
  <% } %>

  <%-- Show seating result --%>
  <%
    Seating seating = (Seating) request.getAttribute("seating");
    if (seating != null) {
  %>
    <div class="card" style="border-color: var(--accent); background: rgba(108,99,255,0.07);">
      <p style="font-size:0.75rem; font-weight:700; letter-spacing:0.1em; text-transform:uppercase; color:var(--accent); margin-bottom:20px;">
        🎯 &nbsp;Seat Assignment Found
      </p>
      <div class="seat-result">
        <div class="seat-stat">
          <div class="val"><%= seating.getBranch() %></div>
          <div class="lbl">Branch</div>
        </div>
        <div class="seat-stat">
          <div class="val"><%= seating.getDivision() %></div>
          <div class="lbl">Division</div>
        </div>
        <div class="seat-stat">
          <div class="val"><%= seating.getRollno() %></div>
          <div class="lbl">Roll No</div>
        </div>
        <div class="seat-stat" style="border-color: var(--accent); background: rgba(108,99,255,0.15);">
          <div class="val" style="color: var(--accent);"><%= seating.getRoomNo() %></div>
          <div class="lbl">Room</div>
        </div>
        <div class="seat-stat" style="border-color: var(--accent3); background: rgba(67,232,176,0.1);">
          <div class="val" style="color: var(--accent3);">#<%= seating.getSeatNo() %></div>
          <div class="lbl">Seat No</div>
        </div>
      </div>
    </div>
  <% } %>

</div>

<footer>&copy; 2026 Exam Seating System</footer>
</body>
</html>
