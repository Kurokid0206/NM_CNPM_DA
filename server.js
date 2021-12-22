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
