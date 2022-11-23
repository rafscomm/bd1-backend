import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const clienteController = async (request: Request, response: Response) => {
  const clientes = await prisma.cliente.findMany({
    include: {
      pessoa_fisica: true,
      pessoa_juridica: true
    }
  });
  return response.status(201).json(clientes);
}

export const criarCliente = async (request: Request, response: Response) => {
  const {cpf, nome, contato, endereco, idEmpresa} = request.body;

  await prisma.cliente.create({
    data: {
      idEmpresa: idEmpresa,
      pessoa_fisica: {
        create: {
          cpf: cpf,
          nome: nome,
          contato: contato,
          endereco: endereco,
        }
      }

    }
  });
  return response.status(201).send('Cliente criado com sucesso');
}