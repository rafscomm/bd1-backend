/*
  Warnings:

  - A unique constraint covering the columns `[idClient]` on the table `pessoa_fisica` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "pessoa_fisica_idClient_key" ON "pessoa_fisica"("idClient");
