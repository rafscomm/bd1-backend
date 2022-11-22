import { Request, Response } from "express"
import { UserInterface } from '../interfaces/UserInterface';
import { prisma } from '../prisma/client';

export const loginController = async (request: Request, response: Response) => {
  const { cpf, senha }: UserInterface = request.body;
  const user = await prisma.funcionario.findUnique({
    where: {
      cpf: cpf,
    }
  })
  if(!user) {
    return response.status(401).json('Login ou senha inválidos')
  } else if(user.senha === senha){
    return response.status(201).json(user);
  } else {
    return response.status(401).json('Login ou senha inválidos')
  }
}