import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const caixaController = async (request: Request, response: Response) => {
  const caixas = await prisma.caixa.findMany();
  return response.status(201).json(caixas);
}