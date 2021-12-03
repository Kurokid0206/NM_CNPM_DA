
function show_insert_course() {
    var div = document.querySelector("#form-insert-course")
    div.style.display = "flex";
    div = document.querySelector("#courses")
    div.style.display = "none";
}

function show_find_course(){
    var div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#courses")
    div.style.display = "flex";
}