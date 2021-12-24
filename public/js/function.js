var ids=["form-insert-course","course-info","find-courses","my-courses","registered-courses-data",
"form-become-teacher","form-change-info","form-update-cert","schedule","show-cert"]

function show(id){
    
    ids.forEach(id=>{
        var div = document.querySelector("#"+id);
        div.style.display = "none";
    })
    var div = document.querySelector("#"+id);
        div.style.display = "flex";
}



function find_courses(){
    var input=document.getElementById("find-courses-input")
    //console.log(input.value)
    

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        input.value="";
        var data=JSON.parse(this.responseText)
        //console.log(data)
        document.getElementById("search-result").innerHTML=grid_render(data)
        //document.getElementById("search-result").innerHTML=htmlTable(data)
    }

    xhtml.open("POST", "find-courses");
    xhtml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhtml.send('keyword='+input.value);
    return false;
}

function grid_render(data){
    var div=`<div class="grid-container">`

    //console.log(headings)
    data.forEach(element => {
        div=div+`<div class="grid-item">
        <div>${element.TenKhoaHoc}</div>
        <button onclick="show_KH('${element.MaKH}')">Join</button></div>
        `
        //div=div+`<div class="grid-item">${element.TenKH}</div>`
    })
    div=div+`</div>`
    return div
}

function grid_render_BC(data){
    var div=`<div class="grid-container">`
    data.forEach(element => {
        var date=element.NgayCap.split('T')[0]
        div=div+`<div class="grid-item">
        <div>${element.TenBang}</div>
        <div>${date}</div>
        <div>${element.NoiCap}</div>
        </div>
        `
    })
    div=div+`</div>`
    return div
}



function insert_course(){
    var course_name=document.getElementById("course_name");
    var course_grade=document.getElementById("course_grade");
    var course_class_num=document.getElementById("course_class_num");
    var course_min_student=document.getElementById("course_min_student");
    var fee=document.getElementById("fee");

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
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
    show('my-courses')
    
    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        var data=JSON.parse(this.responseText)
        document.getElementById("my-courses").innerHTML=grid_render(data)
    }

    xhtml.open("GET", "my-courses");
    xhtml.send();

    return false;
}

function show_registered_courses(){
    show('registered-courses-data')

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        var data=JSON.parse(this.responseText)
        document.getElementById("registered-courses-data").innerHTML=grid_render(data) 
    }

    xhtml.open("GET", "registered-courses");
    xhtml.send();

} 

function update_cert(){
    var cert_name_more=document.getElementById("cert_name_more");
    var cert_recv_date_more=document.getElementById("cert_recv_date_more");
    var cert_provider_more=document.getElementById("cert_provider_more");

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        // console.log(this.responseText)
        cert_name_more.value=""
        cert_recv_date_more.value=0
        cert_provider_more.value=""
    }

    xhtml.open("POST", "update-cert");
    xhtml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhtml.send(
        'cert_name_more='+cert_name_more.value+//
        '&cert_recv_date_more='+cert_recv_date_more.value+//
        '&cert_provider_more='+cert_provider_more.value
    );

    return false;
}


function show_cert(){
    show('show-cert')

    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        var data=JSON.parse(this.responseText)
        document.getElementById("show-cert").innerHTML=grid_render_BC(data)
    }

    xhtml.open("GET", "show-cert");
    xhtml.send();

}


function checkEmail() { 
    var email = document.getElementById('email'); 
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
    if (!filter.test(email.value)) { 
        alert('Vui lòng nhập email hợp lệ');
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
        alert('Vui lòng nhập số điện thoại hợp lệ');
        SDT.focus;
        return false;
    }
    else {
        return true;
    }
}
function show_KH(MaKH){
    document.getElementById("course-info").style.display="block";
    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        var data=JSON.parse(this.responseText)
        document.getElementById("course-info").innerHTML=render_courses_info(data[0])
    }

    xhtml.open("POST", "get-info-course");
    xhtml.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhtml.send("MaKH="+MaKH);
}

function render_courses_info(data){
    return `
    <form class="form"action="">
    <h2>Thông tin khóa học ${data.TenKhoaHoc}</h2>
    <div class="form__element">${data.Lop}</div>
    <div class="form__element">${data.DanhGiaKH}</div>
    <div class="form__element">${data.HocPhi}</div>
    <button type="button">Tham Gia</button>
    </form>`
}