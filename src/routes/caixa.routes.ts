import { Router } from "express";
import { caixaController  } from '../controllers/CaixaController';

const caixaRoutes = Router();

caixaRoutes.get("/", caixaController);

export { caixaRoutes}