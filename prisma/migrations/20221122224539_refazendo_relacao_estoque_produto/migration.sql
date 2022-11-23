/*
  Warnings:

  - You are about to drop the `ProdutosEmEstoque` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `idEstoque` to the `produtos` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "ProdutosEmEstoque";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_produtos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "marca" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    "modelo" TEXT NOT NULL,
    "imageURL" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    "idEstoque" INTEGER NOT NULL,
    CONSTRAINT "produtos_idEstoque_fkey" FOREIGN KEY ("idEstoque") REFERENCES "Estoque" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_produtos" ("created_at", "id", "imageURL", "marca", "modelo", "nome", "price", "updated_at") SELECT "created_at", "id", "imageURL", "marca", "modelo", "nome", "price", "updated_at" FROM "produtos";
DROP TABLE "produtos";
ALTER TABLE "new_produtos" RENAME TO "produtos";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
