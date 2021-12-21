var ids=["form-insert-course","find-courses","my-courses"]


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

function insert_course(){
    var course_name=document.getElementById("course_name");
    var course_grade=document.getElementById("course_grade");
    var course_class_num=document.getElementById("course_class_num");
    var course_min_student=document.getElementById("course_min_student");
    var fee=document.getElementById("fee");

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
    show('my-courses')
    
    var xhtml = new XMLHttpRequest();
    xhtml.onload = function() {
        var data=JSON.parse(this.responseText)
        document.getElementById("my-courses").innerHTML=""
        document.getElementById("my-courses").append(grid_render(data))  
    }

    xhtml.open("GET", "my-courses");
    xhtml.send();

    return false;
}