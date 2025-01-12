const express = require("express");
const multer = require("multer");
const path = require("path");
const app = express();
const port = 3001;

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, "uploads/"); // Thư mục lưu file
  },
  filename: (req, file, cb) => {
    cb(null, (Date.now() + '-' + Math.round(Math.random() * 1E9)) + path.extname(file.originalname));
  },
});
// Khởi tạo multer với cấu hình storage
const upload = multer({ storage: storage });
app.use(express.urlencoded({ extended: true }));

// Middleware cho static files (CSS, JS, hình ảnh)
app.use("/", express.static(path.join(__dirname, "public")));
// Cấu hình view engine là Pug
app.set("view engine", "pug");
app.set("views", path.join(__dirname, "views"));
app.get("/", (req, res) => {
  res.render("index", {
    title: "Hey",
    message: "Xin chao cac bạn Truong Dai hoc Gia Dinh",
  });
});

app.get("/login", (req, res) => {
  res.render("login", {
    title: "Login",
  });
});

app.post("/login", (req, res) => {
  console.log(req.body);
  res.send("POST request to the homepage");
});

app.get("/register", (req, res) => {
  res.render("register", {
    title: "Register",
  });
});

app.get("/users", (req, res) => {
  console.log("req", req);
  res.render("users", {
    title: "Users",
  });
});

app.get("/upload", (req, res) => {
  res.render("upload");
});

const todo = require("./todo");
const qrcode = require("./qrcode");
app.use("/data", todo);
app.use('/qrcode', qrcode);

// Route xử lý upload
app.post("/upload", upload.single("file"), (req, res) => {
  const { username, password } = req.body;
  const file = req.file;
  res.send(`
  <h1>Upload Success!</h1>
  <p>Username: ${username}</p>
  <p>Password: ${password}</p>
  <p>Uploaded File: ${file.originalname}</p>
  <p>Saved at: ${file.path}</p>
  `);
});

// Tạo thư mục lưu trữ nếu chưa tồn tại
const fs = require("fs");
const uploadDir = path.join(__dirname, "uploads");
if (!fs.existsSync(uploadDir)) {
  fs.mkdirSync(uploadDir);
}

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
