function show_find_course(){
    var div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "flex";
    div = document.querySelector("#schedule")
    div.style.display = "none";
    div = document.querySelector("#form-change-info")
    div.style.display = "none";
    div = document.querySelector("#form-become-teacher")
    div.style.display = "none";
    div = document.querySelector("#form-update-cert")
    div.style.display = "none";
}

function show_insert_course() {
    var div = document.querySelector("#form-insert-course")
    div.style.display = "flex";
    div = document.querySelector("#find-courses")
    div.style.display = "none";
    div = document.querySelector("#schedule")
    div.style.display = "none";
    div = document.querySelector("#form-change-info")
    div.style.display = "none";
    div = document.querySelector("#form-become-teacher")
    div.style.display = "none";
    div = document.querySelector("#form-update-cert")
    div.style.display = "none";
}


function show_schedule() {
    var div = document.querySelector("#schedule")
    div.style.display = "flex";
    div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "none";
    div = document.querySelector("#form-change-info")
    div.style.display = "none";
    div = document.querySelector("#form-become-teacher")
    div.style.display = "none";
    div = document.querySelector("#form-update-cert")
    div.style.display = "none";
}

function change_info() {
    var div = document.querySelector("#schedule")
    div.style.display = "none";
    div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "none";
    div = document.querySelector("#form-change-info")
    div.style.display = "flex";
    div = document.querySelector("#form-become-teacher")
    div.style.display = "none";
    div = document.querySelector("#form-update-cert")
    div.style.display = "none";
}

function apply_teacher() {
    var div = document.querySelector("#schedule")
    div.style.display = "none";
    div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "none";
    div = document.querySelector("#form-change-info")
    div.style.display = "none";
    div = document.querySelector("#form-become-teacher")
    div.style.display = "flex";
    div = document.querySelector("#form-update-cert")
    div.style.display = "none";
}

function update_more_cert(){
    var div = document.querySelector("#schedule")
    div.style.display = "none";
    div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "none";
    div = document.querySelector("#form-change-info")
    div.style.display = "none";
    div = document.querySelector("#form-become-teacher")
    div.style.display = "none";
    div = document.querySelector("#form-update-cert")
    div.style.display = "flex";
}

function find_courses(){
    var input=document.getElementById("find-courses-input")
    console.log(input.value)
    

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {

        input.value="";
        var data=JSON.parse(this.responseText)
        console.log(data)
        document.getElementById("search-result").innerHTML=""
        document.getElementById("search-result").append(grid_render(data))
        //document.getElementById("search-result").innerHTML=htmlTable(data)
    }

    xhtml.open("POST", "find-courses");
    xhtml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhtml.send('keyword='+input.value);
    return false;
}

function grid_render(data){
    var new_grid=document.createElement('div')
    new_grid.className="grid-container"
    //console.log(headings)
    data.forEach(element => {
        var item = document.createElement('div');
        item.className="grid-item"
        Object.keys(element).forEach(heading=>{
            var data=document.createElement('div')
            data.innerHTML=element[heading]
            item.append(data)
        })
        new_grid.append(item)
    })
    return new_grid
}

const row = html => `<tr>\n${html}</tr>\n`,
      heading = object => row(Object.keys(object).reduce((html, heading) => (html + `<th>${heading}</th>`), '')),
      datarow = object => row(Object.values(object).reduce((html, value) => (html + `<td>${value}</td>`), ''));
//convert JSON to table                               
function htmlTable(dataList) {
  return `<table class="tbl">
            ${heading(dataList[0])}
            ${dataList.reduce((html, object) => (html + datarow(object)), '')}
          </table>`
}

function insert_course(){
    var course_name=document.getElementById("course_name");
    var course_grade=document.getElementById("course_grade");
    var course_class_num=document.getElementById("course_class_num");
    var course_min_student=document.getElementById("course_min_student");
    var fee=document.getElementById("fee");

    // course_name=""
    // course_grade=0
    // course_class_num=0
    // course_min_student=0
    // fee=0

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        // console.log(this.responseText)
        course_name.value=""
        course_grade.value=0
        course_class_num.value=0
        course_min_student.value=0
        fee.value=0
    }

    xhtml.open("POST", "insert-course");
    xhtml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhtml.send(
        'course_name='+course_name.value+//
        '&course_grade='+course_grade.value+//
        '&course_class_num='+course_class_num.value+//
        '&course_min_student='+course_min_student.value+//
        '&fee='+fee.value
    );

    return false;

}


function show_my_courses(){
    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        var data=JSON.parse(this.responseText)
        document.getElementById("my-courses").innerHTML=""
        document.getElementById("my-courses").append(grid_render(data))
    }

    xhtml.open("GET", "my-courses");
    xhtml.send();

    return false;
<<<<<<< Updated upstream
=======
}
>>>>>>> Stashed changes

function checkEmail() { 
    var email = document.getElementById('email'); 
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
    if (!filter.test(email.value)) { 
        alert('Vui long nhap dia chi email hop le');
        email.focus; 
        return false; 
    }
    else{ 
        return true;
    } 
} 

function checkSDT() {
    var SDT = document.getElementById('SDT');
    var filter = /^[0]+[0-9]{9}/;
    if (!filter.test(SDT.value)) {
        alert('Vui long nhap so dien thoai hop le');
        SDT.focus;
        return false;
    }
    else {
        return true;
    }
<<<<<<< Updated upstream
}}
=======
}
>>>>>>> Stashed changes
