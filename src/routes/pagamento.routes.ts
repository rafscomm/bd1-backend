import { Router } from "express";
import { criarPagamento  } from '../controllers/PagamentosController';

const pagamentoRoutes = Router();

pagamentoRoutes.post("/criar", criarPagamento);

export { pagamentoRoutes}