import express from "express";
import cors from "cors"
import { Request, Response } from "express";
import morgan from "morgan";
import { routes } from "./routes";
const port = process.env.PORT || 3000;

const app = express();

app.use(express.json());

app.use(cors())

app.use(morgan("dev"));

app.use(routes);

//@ts-ignore
app.use((err, req, res, next) => {
  return res.json({ errorMessage: err.message });
});

app.listen(port, () => {
  console.log(`Servidor rodando na porta: ${port}`);
});
