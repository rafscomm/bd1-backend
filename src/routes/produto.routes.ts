import { Router } from "express";
import { produtosController, criarProdutos } from '../controllers/ProdutosController';

const produtoRoutes = Router();

produtoRoutes.get("/", produtosController);
produtoRoutes.post("/criar", criarProdutos);

export { produtoRoutes }