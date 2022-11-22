import { Router } from "express";
import { loginRoutes } from './login.routes';
import {  produtoRoutes } from './produto.routes';

const routes = Router();

routes.use("/login", loginRoutes);

routes.use("/produtos", produtoRoutes);

export { routes };
