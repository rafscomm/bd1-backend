import { Request, Response } from "express";
import { prisma } from '../prisma/client';

export const pagamentoController = async (request: Request, response: Response) => {
  const pagamentos = await prisma.pagamento.findMany();
  return response.status(201).json(pagamentos);
}

export const criarPagamento = async (request: Request, response: Response) => {
  const {valor_pagamento, idVenda, tipo, idCliente, idCaixa} = request.body;

  await prisma.pagamento.create({
    data: {
      valor_pagamento: valor_pagamento,
      idVenda: idVenda,
      tipo: tipo,
      idCliente: idCliente,
      idCaixa: idCaixa
    }
  });
  return response.status(201).send('Sucesso');
}