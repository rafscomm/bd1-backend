import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const estoqueController = async (request: Request, response: Response) => {
  const estoques = await prisma.estoque.findMany();
  return response.status(201).json(estoques);
}