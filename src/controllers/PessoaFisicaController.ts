import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const pessoaFisicaController = async (request: Request, response: Response) => {
  const clientes = await prisma.pessoaFisica.findMany();
  return response.status(201).json(clientes);
}

export const criarPessoaFisica = async (request: Request, response: Response) => {
  const {cpf, nome, contato, endereco, idEmpresa} = request.body;
  await prisma.pessoaFisica.create({
    data: {
      cpf,
      nome,
      contato,
      endereco,
      idEmpresa
    }
  });
  return response.status(201).send('Sucesso');
}