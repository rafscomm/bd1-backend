/*
  Warnings:

  - Added the required column `idFuncionario` to the `Venda` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Venda" (
    "numero" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "valor" DECIMAL NOT NULL,
    "nome_cliente" TEXT NOT NULL,
    "idFuncionario" TEXT NOT NULL,
    "idProduto" INTEGER NOT NULL,
    "status" TEXT NOT NULL,
    CONSTRAINT "Venda_idFuncionario_fkey" FOREIGN KEY ("idFuncionario") REFERENCES "funcionario" ("cpf") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Venda_idProduto_fkey" FOREIGN KEY ("idProduto") REFERENCES "produtos" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Venda" ("idProduto", "nome_cliente", "numero", "status", "valor") SELECT "idProduto", "nome_cliente", "numero", "status", "valor" FROM "Venda";
DROP TABLE "Venda";
ALTER TABLE "new_Venda" RENAME TO "Venda";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
