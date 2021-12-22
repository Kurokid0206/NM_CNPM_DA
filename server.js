// use node express
const express = require("express")
const session = require("express-session")
const app = express()
app.use(express.static("public"))
const path = require("path")
// parse application/x-www-form-urlencoded
app.use(express.urlencoded({ extended: false }))
// parse application/json
app.use(express.json())

app.use(session({ secret: "Aloha123456", resave: false, saveUninitialized: true }))

app.set("view engine", "ejs")
app.set("views", path.join(__dirname, "views"))
const sql = require("mssql")
// const { config } = require("nodemon");

app.listen(3000, function () {
    console.log("server is listen on port 3000.")
})

const config = {
    user: "sa", // nhớ đổi lại
    password: ".", // nhớ đổi lại
    server: "localhost",
    database: "qlKH",
    port: 1433,
    options: {
        trustServerCertificate: true // change to true for local dev / self-signed certs
    }
}

async function getData() {
    try {
        const pool = await sql.connect(config)
        const result = await pool.request().query("select * from KhoaHoc")
        await pool.close()
        console.log(result)
    } catch (error) {
        console.log(error.message)
        return error.message
    }
};
getData()

app.use((req, res, next) => {
    res.locals.user = req.session.user
    next()
})

// get home page
app.get("/", function (req, res) {
    res.render("index", {
        user: res.locals.user
    })
    
})

app.post("/insert-course", function (req, res) {
    res.redirect("/")

    console.log(req.body)
})

app.post("/find-courses", function (req, res) {
    // tạo promise chắc chắn trả về
    Promise.resolve("success").then(
        async function () {
            try {
                const pool = await sql.connect(config)
                const result = await pool.request()
                    .input("keyword", sql.NVarChar(50), `${req.body.keyword}`)
                // .output('output_parameter', sql.VarChar(50))
                    .execute("sp_findCourses")
                pool.close()
                res.send(result.recordset)
                console.log(result)
                return
            } catch (error) {
                console.log(error.message)
                return error.message
            }
        }
    )
})

app.get("/login", (req, res) => {
    res.render("login")
})

app.get("/signup", (req, res) => {
    res.render("signup")
})

app.post("/login", (req, res) => {
    Promise.resolve("success").then(
        async function () {
            try {
                const pool = await sql.connect(config)
                const result = await pool.request()
                    .input("tendn", sql.VarChar(50), req.body.username)
                    .input("mk", sql.VarChar(50), req.body.password)
                    .output("MaTK", sql.VarChar(10))
                    .execute("sp_signIn")
                
                if (!result.recordsets[0]) {
					const userToQuery = await pool.request().query(`select * from NguoiDung where tendn like '${req.body.username}'`)
					req.session.user = userToQuery.recordset[0]
					res.redirect("/")
				}
                else {
					res.render("login", {
						error: result.recordset[0].ErrorMessage
					})
				}
				
                pool.close()
                return
            } catch (error) {
                console.log(error.message)
                return error.message
            }
        }
    )
})

app.post("/signup", (req, res, next) => {
    Promise.resolve("success").then(
        async function () {
            try {
                const pool = await sql.connect(config)
                const { username, password, fullname, birthday, email, phonenumber } = req.body
                const result = await pool.request()
                    .input("tendn", sql.VarChar(50), username)
                    .input("mk", sql.VarChar(50), password)
                    .input("hoten", sql.NVarChar(50), fullname)
                    .input("ngaysinh", sql.Date, birthday)
                    .input("email", sql.VarChar(50), email)
                    .input("sdt", sql.VarChar(20), phonenumber)
                	//.output('MaTK', sql.VarChar(10))
                    .execute("sp_signUp")
                
                //console.log(result)
				if (!result.recordsets[0]) {
                    const userToQuery = await pool.request().query(`select * from NguoiDung where tendn like '${username}'`)
					req.session.user = userToQuery.recordset[0]
					res.redirect("/")
				}
                else {
					res.render("signup", {
						error: result.recordset[0].ErrorMessage
					})
				}
                
                pool.close()
                return
            } catch (error) {
                console.log(error.message)
                return error.message
            }
        }
    )
})

app.get("/test", async (req, res) => {
    try {
        const pool = await sql.connect(config)
        const result = await pool.request().query("select * from NguoiDung where TenDN = 'asda'")

        // console.log(result)
        res.send(result.recordset[0])
        await pool.close()
    } catch (error) {
        console.log(error.message)
        return error.message
    }
})



app.post("/change-info",function(req,res){
	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('MaTK', sql.VARCHAR(10),'001')
					.input('HoTen', sql.NVarChar(50), `${req.body.name}`)
					.input('NgaySinh', sql.Date, `${req.body.birth}`)
					.input('Email', sql.VARCHAR(50), `${req.body.email}`)
					.input('SDT', sql.VARCHAR(20), `${req.body.SDT}`)
					//.output('output_parameter', sql.VarChar(50))
					.execute('sp_ND_CapNhatTT')
				pool.close()
				res.sendFile(__dirname+'/index.html');
				console.log(result)

				return
			} catch (error) {
				console.log(error.message);
				return error.message
			}
		}
	)
});

app.post("/become-teacher",function(req,res){
	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('MaTK', sql.VARCHAR(10),'001')
					.input('TenBang', sql.VarChar(10), `${req.body.cert_name}`)
					.input('NgayCapBang', sql.Date, `${req.body.cert_recv_date}`)
					.input('NoiCapBang', sql.NVARCHAR(50), `${req.body.cert_provider}`)
					//.output('MaGV',sql.VARCHAR(10))
					.execute('sp_TK_DangKyGV')
				pool.close()
				res.sendFile(__dirname+'/index.html');
				console.log(result)
				return
			} catch (error) {
				console.log(error.message);
				return error.message
			}
		}
	)
});

app.post("/update-cert",function(req,res){
	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('MaGV', sql.VARCHAR(10),'GV00000001')
					.input('TenBang', sql.VarChar(10), `${req.body.cert_name_more}`)
					.input('NgayCapBang', sql.Date, `${req.body.cert_recv_date_more}`)
					.input('NoiCapBang', sql.NVARCHAR(50), `${req.body.cert_provider_more}`)
					//.output('MaGV',sql.VARCHAR(10))
					.execute('sp_GV_CapNhatBC')
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
});
	
app.post("/insert-course",function(req,res){
	//console.log(req.body)
	
	Promise.resolve('success').then(
		async function () {
			try {
				let pool = await sql.connect(config);
				let result = await pool.request()
					.input('MaGV', sql.VARCHAR(10), 'GV00000001')
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
