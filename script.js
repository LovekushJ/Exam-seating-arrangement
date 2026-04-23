// Validate Add Student form
function validateStudentForm() {
  const form = document.forms[0];
  const roll = parseInt(form["roll_no"].value);
  const name = form["name"].value.trim();
  const branch = form["branch"].value;
  const division = form["division"].value;
  const year = form["year"].value;

  if (!name) {
    alert("Please enter the student's name.");
    return false;
  }
  if (isNaN(roll) || roll < 1 || roll > 60) {
    alert("Roll number must be between 1 and 60.");
    return false;
  }
  if (!branch) {
    alert("Please select a branch.");
    return false;
  }
  if (!division) {
    alert("Please select a division.");
    return false;
  }
  if (!year) {
    alert("Please select a year of study.");
    return false;
  }
  return true;
}

// Validate Add Room form
function validateRoomForm() {
  const form = document.forms[0];
  const roomNo = form["room_no"].value.trim();
  const capacity = parseInt(form["capacity"].value);

  if (!roomNo) {
    alert("Room number is required.");
    return false;
  }
  if (isNaN(capacity) || capacity < 1) {
    alert("Capacity must be at least 1.");
    return false;
  }
  return true;
}