import { Router } from "express";
import { pessoaFisicaController, criarPessoaFisica } from '../controllers/PessoaFisicaController';

const pfRoutes = Router();

pfRoutes.get("/", pessoaFisicaController);
pfRoutes.post("/criar", criarPessoaFisica);

export { pfRoutes}