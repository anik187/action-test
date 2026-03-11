import express from "express";

const app: express.Application = express();


app.use(express.json())

app.get('/', (req: express.Request, res: express.Response) => {
	return res.status(200).json({ msg: "hello world" })
})

app.get('/healthcheck', async (req: express.Request, res: express.Response) => {
	return res.status(200).json({ msg: "health check is good!!!" })
})

app.listen(8000, () => console.log("server started at port 8000"))


