/*
  Warnings:

  - You are about to drop the `cliente` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `pessoa_juridica` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `ClienteFuncionario` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `idCliente` on the `ClienteFuncionario` table. All the data in the column will be lost.
  - You are about to drop the column `idCliente` on the `pagamento` table. All the data in the column will be lost.
  - You are about to drop the column `idClient` on the `pessoa_fisica` table. All the data in the column will be lost.
  - Added the required column `idPessoaFisica` to the `ClienteFuncionario` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idPessoaFisica` to the `pagamento` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idEmpresa` to the `pessoa_fisica` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "cliente";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "pessoa_juridica";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ClienteFuncionario" (
    "idFuncionario" TEXT NOT NULL,
    "idPessoaFisica" TEXT NOT NULL,
    "assignedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assignedBy" TEXT NOT NULL,

    PRIMARY KEY ("idFuncionario", "idPessoaFisica"),
    CONSTRAINT "ClienteFuncionario_idFuncionario_fkey" FOREIGN KEY ("idFuncionario") REFERENCES "funcionario" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "ClienteFuncionario_idPessoaFisica_fkey" FOREIGN KEY ("idPessoaFisica") REFERENCES "pessoa_fisica" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ClienteFuncionario" ("assignedAt", "assignedBy", "idFuncionario") SELECT "assignedAt", "assignedBy", "idFuncionario" FROM "ClienteFuncionario";
DROP TABLE "ClienteFuncionario";
ALTER TABLE "new_ClienteFuncionario" RENAME TO "ClienteFuncionario";
CREATE TABLE "new_pagamento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "valor_pagamento" DECIMAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "idPessoaFisica" TEXT NOT NULL,
    "idCaixa" INTEGER NOT NULL,
    "idVenda" INTEGER NOT NULL,
    CONSTRAINT "pagamento_idPessoaFisica_fkey" FOREIGN KEY ("idPessoaFisica") REFERENCES "pessoa_fisica" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pagamento_idCaixa_fkey" FOREIGN KEY ("idCaixa") REFERENCES "caixa" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pagamento_idVenda_fkey" FOREIGN KEY ("idVenda") REFERENCES "Venda" ("numero") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_pagamento" ("id", "idCaixa", "idVenda", "tipo", "valor_pagamento") SELECT "id", "idCaixa", "idVenda", "tipo", "valor_pagamento" FROM "pagamento";
DROP TABLE "pagamento";
ALTER TABLE "new_pagamento" RENAME TO "pagamento";
CREATE TABLE "new_pessoa_fisica" (
    "cpf" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "contato" TEXT NOT NULL,
    "idEmpresa" TEXT NOT NULL,
    CONSTRAINT "pessoa_fisica_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_pessoa_fisica" ("contato", "cpf", "endereco", "nome") SELECT "contato", "cpf", "endereco", "nome" FROM "pessoa_fisica";
DROP TABLE "pessoa_fisica";
ALTER TABLE "new_pessoa_fisica" RENAME TO "pessoa_fisica";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
