import { Router } from "express";
import { produtosController } from '../controllers/ProdutosController';

const produtoRoutes = Router();

produtoRoutes.get("/", produtosController);

export { produtoRoutes }