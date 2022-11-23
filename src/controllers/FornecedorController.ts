import {Request, Response} from "express"
import {prisma} from '../prisma/client';

export const fornecedoreController = async (request: Request, response: Response) => {
  const fornecedores = await prisma.fornecedor.findMany();
  return response.status(201).json(fornecedores);
}

export const criarFornecedor = async (request: Request, response: Response) => {
  const {cnpj, endereco, nome_fantasia, razao_social, empresa, idEmpresa} = request.body;

  await prisma.fornecedor.create({
    data: {
      cnpj: cnpj,
      endereco: endereco,
      nome_fantasia: nome_fantasia,
      razao_social: razao_social,
      empresa: empresa,
      idEmpresa:  idEmpresa
    }
  });
  return response.status(201).send('Criado');
}