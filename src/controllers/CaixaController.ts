import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const caixaController = async (request: Request, response: Response) => {
  const vendas = await prisma.caixa.findMany({
    include: {
      pagamentos: {
        include: {
          venda: true
        }
      }
    },
  });
  return response.status(201).json(vendas);
}