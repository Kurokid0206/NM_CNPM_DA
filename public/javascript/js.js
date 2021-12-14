function show_find_course(){
    var div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "flex";
    div = document.querySelector("#schedule")
    div.style.display = "none";
}

function show_insert_course() {
    var div = document.querySelector("#form-insert-course")
    div.style.display = "flex";
    div = document.querySelector("#find-courses")
    div.style.display = "none";
    div = document.querySelector("#schedule")
    div.style.display = "none";
}


function show_schedule() {
    var div = document.querySelector("#schedule")
    div.style.display = "flex";
    div = document.querySelector("#form-insert-course")
    div.style.display = "none";
    div = document.querySelector("#find-courses")
    div.style.display = "none";

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
