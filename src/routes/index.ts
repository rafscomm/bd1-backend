import { Router } from "express";
import { loginRoutes } from './login.routes';
import { pingRoutes } from './ping.routes';

const routes = Router();

routes.use("/ping", pingRoutes)

routes.use("/login", loginRoutes);

export { routes };
