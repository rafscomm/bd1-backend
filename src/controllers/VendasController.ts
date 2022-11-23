import {Request, Response} from "express"
import {prisma} from '../prisma/client';

export const vendasController = async (request: Request, response: Response) => {
  const vendas = await prisma.venda.findMany();
  return response.status(201).json(vendas);
}

export const criarVenda = async (request: Request, response: Response) => {
  const {nome_cliente, valor, idProduto, status, idFuncionario } = request.body;
  await prisma.venda.create({
    data: {
      nome_cliente: nome_cliente,
      valor: valor,
      idProduto: Number(idProduto),
      status: status,
      idFuncionario
    }
  })
  return response.status(201).send('Sucesso');
}