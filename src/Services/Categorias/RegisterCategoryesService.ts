import prismaClient from "../../prisma";
import { iCategories } from "../../interfaces/Categorias";
class RegisterCategoriesService{
   async execute({nome}:iCategories){
      const categoria = await prismaClient.categoria.create({
         data:{
            nome: nome
         },
         select:{
            id: true,
            nome: true
         }
      })

      return categoria;
   }
}

export { RegisterCategoriesService}