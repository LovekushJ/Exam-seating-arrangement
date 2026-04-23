<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Room, dao.Roomdao" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View Rooms — Exam Seating</title>
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
      padding: 10px 16px;
      margin-top: 8px;
      display: none;
      gap: 8px;
      align-items: center;
    }
    .confirm-delete span {
      font-size: 0.82rem;
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
    <div class="tag">Rooms</div>
    <h2>All Rooms</h2>
    <p>All registered exam rooms and their capacities.</p>
  </div>

  <%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
  %>
    <div class="alert alert-success">✅ <%= msg %></div>
  <% } %>

  <%
    try {
      Roomdao dao = new Roomdao();
      List<Room> rooms = dao.getAllRooms();
      if (rooms != null && !rooms.isEmpty()) {
  %>
    <div class="table-wrap">
      <table>
        <thead>
          <tr>
            <th>#</th>
            <th>Room Number</th>
            <th>Capacity</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <% int i = 1; for (Room r : rooms) { %>
          <tr>
            <td><%= i++ %></td>
            <td><%= r.getRoomNo() %></td>
            <td><%= r.getCapacity() %> seats</td>
            <td>
              <button class="btn btn-danger btn-sm"
                onclick="document.getElementById('del-room-<%= r.getRoomNo().replaceAll("[^a-zA-Z0-9]","") %>').style.display='flex'">
                🗑️ Delete
              </button>
              <div class="confirm-delete" id="del-room-<%= r.getRoomNo().replaceAll("[^a-zA-Z0-9]","") %>">
                <span>Sure? This cannot be undone.</span>
                <form action="DeleteRoomServlet" method="post" style="display:inline">
                  <input type="hidden" name="room_no" value="<%= r.getRoomNo() %>">
                  <button type="submit" class="btn btn-danger btn-sm">Yes, Delete</button>
                </form>
                <button class="btn btn-ghost btn-sm"
                  onclick="document.getElementById('del-room-<%= r.getRoomNo().replaceAll("[^a-zA-Z0-9]","") %>').style.display='none'">
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
    <a href="addRoom.jsp" class="btn btn-primary">+ Add New Room</a>
  <%
    } else {
  %>
    <div class="empty">
      <div class="icon">🏫</div>
      <p>No rooms registered yet.</p>
      <br>
      <a href="addRoom.jsp" class="btn btn-primary">Add First Room</a>
    </div>
  <%
    }
    } catch (Exception e) {
  %>
    <div class="alert alert-error">❌ Error loading rooms: <%= e.getMessage() %></div>
  <% } %>
</div>

<footer>&copy; 2026 Exam Seating System</footer>
</body>
</html>
