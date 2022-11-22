import {Request, Response} from "express"
import {prisma} from '../prisma/client';

export const produtosController = async (request: Request, response: Response) => {
  const produtos = await prisma.produto.findMany();
  return response.status(201).json(produtos);
}