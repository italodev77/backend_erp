import prismaClient from "../../prisma";
import { hash } from "bcryptjs";
import { iUserRequest } from "../../interfaces/User";

class CreateUserService{
   async execute({name,cpf,email,password}: iUserRequest){

      if(!(cpf || email || password || name)){
         throw new Error('Campo vazio, preencha por favor!')
      }

      const userAlredyExist = await prismaClient.users.findFirst({
         where:{
            cpf:cpf
         }
      })

      if(userAlredyExist){
         throw new Error('CPF já cadastrado!')
      }
      const userCategoryDefaultValue = '1';

      const passwordHash = await hash(password, 6);

      const userCreated = await prismaClient.users.create({
         data:{
            name: name,
            cpf: cpf,
            email: email,
            password: passwordHash,
            user_category: userCategoryDefaultValue
         },
         select:{
            id: true,
            name: true,
            email: true,
            cpf: true
         }
      })

      return userCreated;
   }
}

export {CreateUserService};