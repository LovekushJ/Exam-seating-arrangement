<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Student, dao.Studentdao" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Students — Exam Seating</title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    .btn-sm {
      padding: 6px 14px;
      font-size: 0.78rem;
      border-radius: 6px;
    }
    .confirm-delete {
      background: rgba(255,101,132,0.12);
      border: 1px solid rgba(255,101,132,0.3);
      border-radius: 8px;
      padding: 8px 12px;
      margin-top: 6px;
      display: none;
      gap: 8px;
      align-items: center;
    }
    .confirm-delete span {
      font-size: 0.78rem;
      color: var(--accent2);
      flex: 1;
    }
  </style>
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
    <h2>All Students</h2>
    <p>Complete list of registered students sorted by branch, division and roll number.</p>
  </div>

  <%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
  %>
    <div class="alert alert-success">✅ <%= msg %></div>
  <% } %>

  <%
    try {
      Studentdao dao = new Studentdao();
      List<Student> students = dao.getAllStudents();
      if (students != null && !students.isEmpty()) {
  %>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Branch</th>
            <th>Division</th>
            <th>Year</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <% for (Student s : students) {
            String branchKey = s.getBranch().toLowerCase();
            String badgeClass = "badge-comp";
            if (branchKey.equals("it")) badgeClass = "badge-it";
            else if (branchKey.equals("aiml")) badgeClass = "badge-aiml";
            else if (branchKey.equals("aids")) badgeClass = "badge-aids";
            else if (branchKey.equals("mechanical")) badgeClass = "badge-mech";
            else if (branchKey.equals("civil")) badgeClass = "badge-civil";
            String uid = s.getBranch() + s.getDivision() + s.getRollno();
          %>
          <tr>
            <td><%= s.getRollno() %></td>
            <td><%= s.getName() %></td>
            <td><span class="badge <%= badgeClass %>"><%= s.getBranch() %></span></td>
            <td><%= s.getDivision() %></td>
            <td><%= s.getYearofstudy() %></td>
            <td>
              <button class="btn btn-danger btn-sm"
                onclick="document.getElementById('del-<%= uid %>').style.display='flex'">
                🗑️ Delete
              </button>
              <div class="confirm-delete" id="del-<%= uid %>">
                <span>Sure?</span>
                <form action="DeleteStudentServlet" method="post" style="display:inline">
                  <input type="hidden" name="branch" value="<%= s.getBranch() %>">
                  <input type="hidden" name="division" value="<%= s.getDivision() %>">
                  <input type="hidden" name="roll_no" value="<%= s.getRollno() %>">
                  <button type="submit" class="btn btn-danger btn-sm">Yes</button>
                </form>
                <button class="btn btn-ghost btn-sm"
                  onclick="document.getElementById('del-<%= uid %>').style.display='none'">
                  Cancel
                </button>
              </div>
            </td>
          </tr>
          <% } %>
        </tbody>
      </table>
    </div>
    <br>
    <a href="addStudent.jsp" class="btn btn-primary">+ Add New Student</a>
  <%
    } else {
  %>
    <div class="empty">
      <div class="icon">📭</div>
      <p>No students registered yet.</p>
      <br>
      <a href="addStudent.jsp" class="btn btn-primary">Add First Student</a>
    </div>
  <%
    }
    } catch (Exception e) {
  %>
    <div class="alert alert-error">❌ Error loading students: <%= e.getMessage() %></div>
  <% } %>
</div>

<footer>&copy; 2026 Exam Seating System</footer>
</body>
</html>
