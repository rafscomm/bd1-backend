import {Request, Response} from "express"
import {prisma} from '../prisma/client';

export const produtosController = async (request: Request, response: Response) => {
  const produtos = await prisma.produto.findMany();
  return response.status(201).json(produtos);
}

export const criarProdutos = async (request: Request, response: Response) => {
  const {nome, marca, modelo, price, imageURL} = request.body;

  const produto = await prisma.produto.create({
    data: {
      nome:nome,
      marca: marca,
      modelo: modelo,
      price: price,
      imageURL: imageURL,
    }
  });
  return response.status(201).send('Produto criado com sucesso');
}