import { Router } from "express";
import { clienteController } from '../controllers/ClienteController';

const clienteRoutes = Router();

clienteRoutes.get("/", clienteController);

export { clienteRoutes}