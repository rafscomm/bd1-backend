import { Router } from "express";
import { pfRoutes } from './pf.routes';
import { estoqueRoutes } from './estoque.routes';
import { loginRoutes } from './login.routes';
import {  produtoRoutes } from './produto.routes';
import {vendasRoutes} from './vendas.routes'
import { pagamentoRoutes } from './pagamento.routes';
import { fornecedorRoutes } from './fornecedor.routes';
const routes = Router();

routes.use("/login", loginRoutes);

routes.use("/produtos", produtoRoutes);

routes.use("/vendas", vendasRoutes)

routes.use("/clientes", pfRoutes)

routes.use("/estoques", estoqueRoutes)

routes.use('/pagamentos', pagamentoRoutes)

routes.use('/fornecedores', fornecedorRoutes)

export { routes };
