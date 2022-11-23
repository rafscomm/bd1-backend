import { Router } from "express";
import { clienteController, criarCliente } from '../controllers/ClienteController';

const clienteRoutes = Router();

clienteRoutes.get("/", clienteController);
clienteRoutes.post("/criar", criarCliente);

export { clienteRoutes}