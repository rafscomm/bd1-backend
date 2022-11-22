import { Router } from "express";
import { vendasController } from '../controllers/VendasController';

const vendasRoutes = Router();

vendasRoutes.get("/", vendasController);

export { vendasRoutes}