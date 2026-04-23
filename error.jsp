<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Error — Exam Seating</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>

<nav class="topnav">
  <a class="logo" href="index.jsp">Exam<span>Seat</span></a>
</nav>

<div class="container" style="text-align:center; padding-top: 80px;">
  <div style="font-size:3rem; margin-bottom:20px;">⚠️</div>
  <h2 style="color: var(--accent2); font-size:1.8rem; margin-bottom:12px;">Something went wrong</h2>
  <p style="color:var(--muted); margin-bottom:28px; max-width:480px; margin-left:auto; margin-right:auto; line-height:1.6;">
    <%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "An unexpected error occurred." %>
  </p>
  <a href="index.jsp" class="btn btn-primary">&#8592; Back to Home</a>
</div>

<footer>&copy; 2026 Exam Seating System</footer>
</body>
</html>
