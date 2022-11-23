import { Router } from "express";
import { produtosController, criarProdutos, deletarProdutos } from '../controllers/ProdutosController';

const produtoRoutes = Router();

produtoRoutes.get("/", produtosController);
produtoRoutes.post("/criar", criarProdutos);
produtoRoutes.post("/deletar", deletarProdutos);

export { produtoRoutes }