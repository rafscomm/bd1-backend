import {Request, Response} from "express"
import {prisma} from '../prisma/client';

export const vendasController = async (request: Request, response: Response) => {
  const vendas = await prisma.venda.findMany();
  return response.status(201).json(vendas);
}