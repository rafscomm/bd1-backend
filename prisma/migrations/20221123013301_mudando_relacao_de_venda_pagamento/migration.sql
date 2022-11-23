/*
  Warnings:

  - Added the required column `idVenda` to the `pagamento` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_pagamento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "valor_pagamento" DECIMAL NOT NULL,
    "tipo" TEXT NOT NULL,
    "idCliente" INTEGER NOT NULL,
    "idCaixa" INTEGER NOT NULL,
    "idVenda" INTEGER NOT NULL,
    CONSTRAINT "pagamento_idCliente_fkey" FOREIGN KEY ("idCliente") REFERENCES "cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pagamento_idCaixa_fkey" FOREIGN KEY ("idCaixa") REFERENCES "caixa" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "pagamento_idVenda_fkey" FOREIGN KEY ("idVenda") REFERENCES "Venda" ("numero") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_pagamento" ("id", "idCaixa", "idCliente", "tipo", "valor_pagamento") SELECT "id", "idCaixa", "idCliente", "tipo", "valor_pagamento" FROM "pagamento";
DROP TABLE "pagamento";
ALTER TABLE "new_pagamento" RENAME TO "pagamento";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
