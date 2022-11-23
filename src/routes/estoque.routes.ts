import { Router } from "express";
import { estoqueController } from '../controllers/EstoqueController';

const estoqueRoutes = Router();

estoqueRoutes.get("/", estoqueController);

export { estoqueRoutes}