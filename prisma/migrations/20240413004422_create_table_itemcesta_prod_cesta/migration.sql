/*
  Warnings:

  - You are about to drop the column `total_preco_custo` on the `CestaBasica` table. All the data in the column will be lost.
  - You are about to drop the column `total_preco_venda` on the `CestaBasica` table. All the data in the column will be lost.
  - You are about to drop the `_CestaBasicaToProduto` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `preco_custo` to the `CestaBasica` table without a default value. This is not possible if the table is not empty.
  - Added the required column `preco_venda` to the `CestaBasica` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "_CestaBasicaToProduto" DROP CONSTRAINT "_CestaBasicaToProduto_A_fkey";

-- DropForeignKey
ALTER TABLE "_CestaBasicaToProduto" DROP CONSTRAINT "_CestaBasicaToProduto_B_fkey";

-- AlterTable
ALTER TABLE "CestaBasica" DROP COLUMN "total_preco_custo",
DROP COLUMN "total_preco_venda",
ADD COLUMN     "preco_custo" DECIMAL(65,30) NOT NULL,
ADD COLUMN     "preco_venda" DECIMAL(65,30) NOT NULL;

-- DropTable
DROP TABLE "_CestaBasicaToProduto";

-- CreateTable
CREATE TABLE "ItemCesta" (
    "id" SERIAL NOT NULL,
    "cestaBasicaId" INTEGER NOT NULL,
    "produtoId" INTEGER NOT NULL,
    "codigoItem" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ItemCesta_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ItemCesta" ADD CONSTRAINT "ItemCesta_cestaBasicaId_fkey" FOREIGN KEY ("cestaBasicaId") REFERENCES "CestaBasica"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemCesta" ADD CONSTRAINT "ItemCesta_produtoId_fkey" FOREIGN KEY ("produtoId") REFERENCES "Produto"("cod_produto") ON DELETE RESTRICT ON UPDATE CASCADE;
