import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const clienteController = async (request: Request, response: Response) => {
  const clientes = await prisma.cliente.findMany();
  return response.status(201).json(clientes);
}