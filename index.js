import express from "express";

const app = express();

app.get('/', (req, res) => {
  return res.status(200).json({ msg: "hello world" })
})
app.listen(8000, (req, res) => console.log("server started at port 8000"))


