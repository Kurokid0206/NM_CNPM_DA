// use node express
const express = require("express");
const app = express();
app.use(express.static('public'))
// parse application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: false }))
// parse application/json
app.use(express.json())

//app.set("view engine","ejs");

const sql = require('mssql');
//const { config } = require("nodemon");


app.listen(3000, function(){
	console.log("server is listen on port 3000.");
});


config = {
    user: 'sa',
    password: '.',
    server: 'localhost',
    database: 'qlKH',
    port: 1433,
    options: {
        trustServerCertificate: true // change to true for local dev / self-signed certs
    }
}

// async function getData() {
// 	try {
// 		let pool = await sql.connect(config);
// 		let result = await pool.request().query(`select * from KhoaHoc`);
// 		await pool.close();
// 		console.log(result)
// 	} catch (error) {
// 		console.log(error.message);
// 		return error.message
// 	}
// };
// getData()

var result=""
var qry=""
//get home page
app.get("/", function (req, res) {
	res.sendFile(__dirname+'/index.html');

});

app.post("/find-courses",function(req,res){
	//tạo promise chắc chắn trả về
	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('keyword', sql.NVarChar(50), `${req.body.keyword}`)
					//.output('output_parameter', sql.VarChar(50))
					.execute('sp_findCourses')
				pool.close()
				res.send(result.recordset)
				//console.log(result)
				return 
			} catch (error) {
				console.log(error.message);
				return error.message
			}
		}
	)
});

app.post("/insert-course",function(req,res){
	//console.log(req.body)

	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('MaGV', sql.VARCHAR(10), 'GV001')
					.input('TenKH', sql.NVarChar(50), `${req.body.course_name}`)
					.input('Lop', sql.Int, `${req.body.course_grade}`)
					.input('SoBuoi', sql.Int, `${req.body.course_class_num}`)
					.input('SoHS', sql.Int, `${req.body.course_min_student}`)
					.input('HocPhi', sql.Int, `${req.body.fee}`)
					//.output('output_parameter', sql.VarChar(50))
					.execute('sp_GV_TaoKH')
				pool.close()
				res.send(result.recordset)
				console.log(result)
				return
			} catch (error) {
				console.log(error.message);
				return error.message
			}
		}
	)
})

app.get("/my-courses",function(req,res){

	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('MaGV', sql.VARCHAR(10), 'GV001')
					//.output('output_parameter', sql.VarChar(50))
					.execute('sp_GV_XemKH')
				pool.close()
				res.send(result.recordset)
				console.log(result)
				return
			} catch (error) {
				console.log(error.message);
				return error.message
			}
		}
	)
})