import { Router } from "express";

const pingRoutes = Router();

pingRoutes.get("/", (req, res) => {
  res.status(201).send('pong')
});

export { pingRoutes }