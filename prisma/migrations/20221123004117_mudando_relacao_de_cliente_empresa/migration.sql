/*
  Warnings:

  - Added the required column `idEmpresa` to the `cliente` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "idEmpresa" TEXT NOT NULL,
    CONSTRAINT "cliente_idEmpresa_fkey" FOREIGN KEY ("idEmpresa") REFERENCES "empresa" ("cnpj") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_cliente" ("id") SELECT "id" FROM "cliente";
DROP TABLE "cliente";
ALTER TABLE "new_cliente" RENAME TO "cliente";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
