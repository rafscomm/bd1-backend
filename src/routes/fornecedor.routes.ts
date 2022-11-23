import { Router } from "express";
import { fornecedoreController, criarFornecedor } from '../controllers/FornecedorController';

const fornecedorRoutes = Router();

fornecedorRoutes.get("/", fornecedoreController);
fornecedorRoutes.post("/criar", criarFornecedor);

export { fornecedorRoutes}