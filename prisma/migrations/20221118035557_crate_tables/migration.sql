/*
  Warnings:

  - The primary key for the `produtos` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `id` on the `produtos` table. The data in that column could be lost. The data in that column will be cast from `String` to `Int`.

*/
-- CreateTable
CREATE TABLE "funcionario" (
    "cpf" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "salario" DECIMAL NOT NULL,
    "senha" TEXT NOT NULL,
    "idClient" INTEGER NOT NULL,
    "idEmpresa" TEXT NOT NULL,
    CONSTRAINT "funcionario_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "idFuncion" TEXT NOT NULL,
    CONSTRAINT "cliente_idFuncion_fkey" FOREIGN KEY ("idFuncion") REFERENCES "funcionario" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "pessoa_fisica" (
    "cpf" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "contato" TEXT NOT NULL,
    "idClient" INTEGER NOT NULL,
    CONSTRAINT "pessoa_fisica_idClient_fkey" FOREIGN KEY ("idClient") REFERENCES "cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "pessoa_juridica" (
    "cnpj" TEXT NOT NULL PRIMARY KEY,
    "nome_fantasia" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "razao_social" TEXT NOT NULL,
    "idClient" INTEGER NOT NULL,
    CONSTRAINT "pessoa_juridica_idClient_fkey" FOREIGN KEY ("idClient") REFERENCES "cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "empresa" (
    "cnpj" TEXT NOT NULL PRIMARY KEY,
    "nome_fantasia" TEXT NOT NULL,
    "insc_social" TEXT NOT NULL,
    "razao_social" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "caixa" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "data" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "idEmpresa" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "caixa_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Fornecedor" (
    "cnpj" TEXT NOT NULL PRIMARY KEY,
    "razao_social" TEXT NOT NULL,
    "nome_fantasia" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "idEmpresa" TEXT NOT NULL,
    CONSTRAINT "Fornecedor_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Estoque" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "idEmpresa" TEXT NOT NULL,
    CONSTRAINT "Estoque_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProdutosEmEstoque" (
    "idProduto" INTEGER NOT NULL,
    "idEstoque" INTEGER NOT NULL,
    "assignedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assignedBy" TEXT NOT NULL,

    PRIMARY KEY ("idProduto", "idEstoque"),
    CONSTRAINT "ProdutosEmEstoque_idProduto_fkey" FOREIGN KEY ("idProduto") REFERENCES "produtos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ProdutosEmEstoque_idEstoque_fkey" FOREIGN KEY ("idEstoque") REFERENCES "Estoque" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Venda" (
    "numero" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "valor" DECIMAL NOT NULL,
    "nome_cliente" TEXT NOT NULL,
    "idProduto" INTEGER NOT NULL,
    CONSTRAINT "Venda_idProduto_fkey" FOREIGN KEY ("idProduto") REFERENCES "produtos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "pagamento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "valor_pagamento" DECIMAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "idCliente" INTEGER NOT NULL,
    "idCaixa" INTEGER NOT NULL,
    CONSTRAINT "pagamento_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES "cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pagamento_idCaixa_fkey" FOREIGN KEY ("idCaixa") REFERENCES "caixa" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "modelo" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);
INSERT INTO "new_produtos" ("created_at", "id", "marca", "modelo", "nome", "updated_at") SELECT "created_at", "id", "marca", "modelo", "nome", "updated_at" FROM "produtos";
DROP TABLE "produtos";
ALTER TABLE "new_produtos" RENAME TO "produtos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

-- CreateIndex
CREATE UNIQUE INDEX "empresa_insc_social_key" ON "empresa"("insc_social");
