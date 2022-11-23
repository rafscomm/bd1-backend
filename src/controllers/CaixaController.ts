import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const caixaController = async (request: Request, response: Response) => {
  const caixas = await prisma.caixa.findMany();
  return response.status(201).json(caixas);
}

export const buscaVendas = async (request: Request, response: Response) => {
  const {id} = request.params;
  const vendas = await prisma.pagamento.findMany({

  });
  return response.status(201).json(vendas);
}