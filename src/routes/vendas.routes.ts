import { Router } from "express";
import { vendasController, criarVenda } from '../controllers/VendasController';

const vendasRoutes = Router();

vendasRoutes.get("/", vendasController);
vendasRoutes.post("/criar", criarVenda);

export { vendasRoutes}