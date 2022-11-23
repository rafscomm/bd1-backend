import { Router } from "express";
import { clienteRoutes } from './cliente.routes';
import { estoqueRoutes } from './estoque.routes';
import { loginRoutes } from './login.routes';
import {  produtoRoutes } from './produto.routes';
import {vendasRoutes} from './vendas.routes'
const routes = Router();

routes.use("/login", loginRoutes);

routes.use("/produtos", produtoRoutes);

routes.use("/vendas", vendasRoutes)

routes.use("/clientes", clienteRoutes)

routes.use("/estoques", estoqueRoutes)

export { routes };
