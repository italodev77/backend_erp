-- CreateTable
CREATE TABLE "Produto" (
    "cod_produto" SERIAL NOT NULL,
    "cod_barras" TEXT,
    "descricao" TEXT NOT NULL,
    "marca" TEXT,
    "categoriaId" TEXT,
    "unidade_medida" TEXT NOT NULL,
    "preco_compra" DECIMAL(65,30) NOT NULL,
    "preco_custo" DECIMAL(65,30),
    "custo_medio" DECIMAL(65,30),
    "preco_venda" DECIMAL(65,30) NOT NULL,
    "preco_venda2" DECIMAL(65,30),
    "preco_venda_atacado" DECIMAL(65,30),
    "preco_venda_atacado2" DECIMAL(65,30),
    "qtd_atacado" DECIMAL(65,30),
    "qtd_atacado2" DECIMAL(65,30),
    "estoque_real" DECIMAL(65,30) NOT NULL,
    "estoque_fiscal" DECIMAL(65,30) NOT NULL,
    "estoque_armazem" DECIMAL(65,30) NOT NULL,
    "localizacaoId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Produto_pkey" PRIMARY KEY ("cod_produto")
);

-- CreateTable
CREATE TABLE "Categoria" (
    "id" TEXT NOT NULL,
    "nome" TEXT NOT NULL,

    CONSTRAINT "Categoria_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Localizacao" (
    "id" SERIAL NOT NULL,
    "rua" TEXT NOT NULL,
    "predio" TEXT NOT NULL,
    "lado" TEXT NOT NULL,
    "andar" TEXT NOT NULL,
    "apartamento" TEXT NOT NULL,
    "cod_produto" INTEGER NOT NULL,

    CONSTRAINT "Localizacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CestaBasica" (
    "id" SERIAL NOT NULL,
    "descricao" TEXT NOT NULL,
    "total_preco_custo" DECIMAL(65,30) NOT NULL,
    "total_preco_venda" DECIMAL(65,30) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CestaBasica_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_CestaBasicaToProduto" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Localizacao_cod_produto_key" ON "Localizacao"("cod_produto");

-- CreateIndex
CREATE UNIQUE INDEX "_CestaBasicaToProduto_AB_unique" ON "_CestaBasicaToProduto"("A", "B");

-- CreateIndex
CREATE INDEX "_CestaBasicaToProduto_B_index" ON "_CestaBasicaToProduto"("B");

-- AddForeignKey
ALTER TABLE "Produto" ADD CONSTRAINT "Produto_categoriaId_fkey" FOREIGN KEY ("categoriaId") REFERENCES "Categoria"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Localizacao" ADD CONSTRAINT "Localizacao_cod_produto_fkey" FOREIGN KEY ("cod_produto") REFERENCES "Produto"("cod_produto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CestaBasicaToProduto" ADD CONSTRAINT "_CestaBasicaToProduto_A_fkey" FOREIGN KEY ("A") REFERENCES "CestaBasica"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CestaBasicaToProduto" ADD CONSTRAINT "_CestaBasicaToProduto_B_fkey" FOREIGN KEY ("B") REFERENCES "Produto"("cod_produto") ON DELETE CASCADE ON UPDATE CASCADE;
