import {Request, Response} from "express"
import {prisma} from '../prisma/client';

export const produtosController = async (request: Request, response: Response) => {
  const produtos = await prisma.produto.findMany();
  return response.status(201).json(produtos);
}

export const criarProdutos = async (request: Request, response: Response) => {
  const {nome, marca, modelo, price, imageURL} = request.body;
  await prisma.produto.create({
    data: {
      nome: nome,
      marca: marca,
      modelo: modelo,
      price: price,
      imageURL: imageURL,
      idEstoque:  1
    }
  });
  return response.status(201).send('Sucesso');
}

export const deletarProdutos = async (request: Request, response: Response) => {
  const {id} = request.params;
  await prisma.produto.delete({
    where: {
      id: Number(id)
    }
  });
  return response.status(201).send('Deletado');
}