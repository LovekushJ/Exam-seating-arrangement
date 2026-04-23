<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List, model.Student, model.Room, dao.Studentdao, dao.Roomdao" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Exam Seating System</title>
  <link rel="stylesheet" href="css/style.css">
  <style>
    .hero {
      padding: 52px 0 10px;
    }
    .hero .eyebrow {
      font-size: 0.7rem;
      font-weight: 600;
      letter-spacing: 0.12em;
      text-transform: uppercase;
      color: #6b7280;
      margin-bottom: 12px;
    }
    .hero h1 {
      font-size: 2.6rem;
      font-weight: 700;
      color: #111;
      line-height: 1.15;
      margin-bottom: 14px;
      letter-spacing: -0.02em;
    }
    .hero p {
      color: #555;
      font-size: 0.97rem;
      max-width: 480px;
      line-height: 1.65;
      margin: 0;
    }

    /* stats */
    .stats-row {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 12px;
      margin: 36px 0;
    }
    .stat-box {
      background: #fff;
      border: 1px solid #e0dfd9;
      border-radius: 8px;
      padding: 20px 18px;
    }
    .stat-box .num {
      font-family: 'DM Mono', monospace;
      font-size: 2rem;
      font-weight: 500;
      color: #111;
      line-height: 1;
    }
    .stat-box .num.c-blue  { color: #2563eb; }
    .stat-box .num.c-green { color: #16a34a; }
    .stat-box .num.c-red   { color: #dc2626; }
    .stat-box .lbl {
      font-size: 0.7rem;
      font-weight: 600;
      letter-spacing: 0.07em;
      text-transform: uppercase;
      color: #999;
      margin-top: 6px;
    }

    /* quick actions */
    .section-label {
      font-size: 0.72rem;
      font-weight: 600;
      letter-spacing: 0.08em;
      text-transform: uppercase;
      color: #888;
      margin-bottom: 12px;
    }
    .actions-row {
      display: flex;
      gap: 10px;
      flex-wrap: wrap;
      margin-bottom: 36px;
    }

    /* workflow card */
    .workflow {
      background: #fff;
      border: 1px solid #e0dfd9;
      border-radius: 8px;
      padding: 24px;
      margin-bottom: 20px;
    }
    .workflow h3 {
      font-size: 0.88rem;
      font-weight: 600;
      color: #333;
      margin-bottom: 20px;
    }
    .steps {
      display: flex;
      align-items: flex-start;
      gap: 0;
      flex-wrap: wrap;
    }
    .step {
      flex: 1;
      min-width: 120px;
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      position: relative;
    }
    .step:not(:last-child)::after {
      content: '→';
      position: absolute;
      right: -8px;
      top: 12px;
      color: #ccc;
      font-size: 1rem;
    }
    .step .circle {
      width: 38px;
      height: 38px;
      border-radius: 50%;
      background: #f5f4f0;
      border: 1px solid #ddd;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1rem;
      margin-bottom: 9px;
    }
    .step h4 {
      font-size: 0.8rem;
      font-weight: 600;
      color: #222;
      margin-bottom: 3px;
    }
    .step p {
      font-size: 0.7rem;
      color: #888;
      line-height: 1.4;
    }

    /* two col guides */
    .two-col {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 14px;
      margin-bottom: 30px;
    }
    .mini-table { font-size: 0.82rem; }
    .mini-table .row {
      display: flex;
      justify-content: space-between;
      padding: 7px 0;
      border-bottom: 1px solid #eee;
      color: #333;
    }
    .mini-table .row:last-child { border-bottom: none; }
    .mini-table .row span {
      color: #777;
      font-family: 'DM Mono', monospace;
      font-size: 0.78rem;
    }

    @media (max-width: 700px) {
      .stats-row { grid-template-columns: 1fr 1fr; }
      .two-col { grid-template-columns: 1fr; }
      .hero h1 { font-size: 1.9rem; }
      .step:not(:last-child)::after { display: none; }
    }
  </style>
</head>
<body>

<nav class="topnav">
  <a class="logo" href="index.jsp">ExamSeat</a>
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

  <%
    int totalStudents = 0;
    int totalRooms = 0;
    try {
      Studentdao sdao = new Studentdao();
      Roomdao rdao = new Roomdao();
      totalStudents = sdao.getAllStudents().size();
      totalRooms = rdao.getAllRooms().size();
    } catch(Exception e) {}
  %>

  <!-- HERO -->
  <div class="hero">
    <div class="eyebrow">Dashboard</div>
    <h1>Exam Seating<br>Arrangement</h1>
    <p>Manage students and rooms, then generate seating plans automatically for all branches and divisions.</p>
  </div>

  <!-- STATS -->
  <div class="stats-row">
    <div class="stat-box">
      <div class="num c-blue"><%= totalStudents %></div>
      <div class="lbl">Students</div>
    </div>
    <div class="stat-box">
      <div class="num c-green"><%= totalRooms %></div>
      <div class="lbl">Rooms</div>
    </div>
    <div class="stat-box">
      <div class="num">6</div>
      <div class="lbl">Branches</div>
    </div>
    <div class="stat-box">
      <div class="num c-red">4</div>
      <div class="lbl">Divisions</div>
    </div>
  </div>

  <!-- QUICK ACTIONS -->
  <div class="section-label">Quick Actions</div>
  <div class="actions-row">
    <a href="addStudent.jsp"     class="btn btn-primary">+ Add Student</a>
    <a href="addRoom.jsp"        class="btn btn-success">+ Add Room</a>
    <a href="generateSeating.jsp" class="btn btn-danger">&#9881; Generate Seating</a>
    <a href="viewSeating.jsp"    class="btn btn-ghost">&#128269; Find My Seat</a>
  </div>

  <!-- HOW IT WORKS -->
  <div class="workflow">
    <h3>How to use &mdash; follow this order</h3>
    <div class="steps">
      <div class="step">
        <div class="circle">🏫</div>
        <h4>Add Rooms</h4>
        <p>e.g. COMP-A1, COMP-A2</p>
      </div>
      <div class="step">
        <div class="circle">👤</div>
        <h4>Add Students</h4>
        <p>Roll no, branch, division</p>
      </div>
      <div class="step">
        <div class="circle">⚙️</div>
        <h4>Generate</h4>
        <p>Auto-assigns all seats</p>
      </div>
      <div class="step">
        <div class="circle">🔍</div>
        <h4>View Seat</h4>
        <p>Search by roll number</p>
      </div>
    </div>
  </div>

  <!-- GUIDES -->
  <div class="two-col">
    <div class="card" style="margin-bottom:0;">
      <div class="section-label">Room Naming Guide</div>
      <div class="mini-table">
        <div class="row">COMP Div A <span>COMP-A1, COMP-A2</span></div>
        <div class="row">IT Div B <span>IT-B1, IT-B2</span></div>
        <div class="row">AIML Div A <span>AIML-A1, AIML-A2</span></div>
        <div class="row">CIVIL Div C <span>CIVIL-C1, CIVIL-C2</span></div>
      </div>
    </div>
    <div class="card" style="margin-bottom:0;">
      <div class="section-label">Roll Number Logic</div>
      <div class="mini-table">
        <div class="row">Roll 1–30 <span>Room 1 (e.g. COMP-A1)</span></div>
        <div class="row">Roll 31–60 <span>Room 2 (e.g. COMP-A2)</span></div>
        <div class="row">Max per room <span>30 students</span></div>
        <div class="row">Max per division <span>60 students</span></div>
      </div>
    </div>
  </div>

</div>

<footer>&copy; 2026 Exam Seating System &mdash; Built with Java EE</footer>
</body>
</html>
