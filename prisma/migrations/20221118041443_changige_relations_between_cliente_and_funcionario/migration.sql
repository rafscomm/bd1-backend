/*
  Warnings:

  - You are about to drop the column `idFuncion` on the `cliente` table. All the data in the column will be lost.
  - You are about to drop the column `idClient` on the `funcionario` table. All the data in the column will be lost.

*/
-- CreateTable
CREATE TABLE "ClienteFuncionario" (
    "idFuncionario" TEXT NOT NULL,
    "idCliente" INTEGER NOT NULL,
    "assignedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assignedBy" TEXT NOT NULL,

    PRIMARY KEY ("idFuncionario", "idCliente"),
    CONSTRAINT "ClienteFuncionario_idFuncionario_fkey" FOREIGN KEY ("idFuncionario") REFERENCES "funcionario" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ClienteFuncionario_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES "cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);
INSERT INTO "new_cliente" ("id") SELECT "id" FROM "cliente";
DROP TABLE "cliente";
ALTER TABLE "new_cliente" RENAME TO "cliente";
CREATE TABLE "new_funcionario" (
    "cpf" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "salario" DECIMAL NOT NULL,
    "senha" TEXT NOT NULL,
    "idEmpresa" TEXT NOT NULL,
    CONSTRAINT "funcionario_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_funcionario" ("cpf", "endereco", "idEmpresa", "nome", "salario", "senha") SELECT "cpf", "endereco", "idEmpresa", "nome", "salario", "senha" FROM "funcionario";
DROP TABLE "funcionario";
ALTER TABLE "new_funcionario" RENAME TO "funcionario";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
