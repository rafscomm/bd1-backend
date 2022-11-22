import { Router } from "express";
import { loginRoutes } from './login.routes';
import {  produtoRoutes } from './produto.routes';
import {vendasRoutes} from './vendas.routes'
const routes = Router();

routes.use("/login", loginRoutes);

routes.use("/produtos", produtoRoutes);
routes.use("/vendas", vendasRoutes)

export { routes };
