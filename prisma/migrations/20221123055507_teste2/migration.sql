/*
  Warnings:

  - You are about to drop the `ClienteFuncionario` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ClienteFuncionario";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "PessoafisicaFuncionario" (
    "idFuncionario" TEXT NOT NULL,
    "idPessoaFisica" TEXT NOT NULL,
    "assignedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "assignedBy" TEXT NOT NULL,

    PRIMARY KEY ("idFuncionario", "idPessoaFisica"),
    CONSTRAINT "PessoafisicaFuncionario_idFuncionario_fkey" FOREIGN KEY ("idFuncionario") REFERENCES "funcionario" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "PessoafisicaFuncionario_idPessoaFisica_fkey" FOREIGN KEY ("idPessoaFisica") REFERENCES "pessoa_fisica" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE
);
