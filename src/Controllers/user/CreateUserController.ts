import {Request, Response} from 'express';
import { CreateUserService } from '../../Services/user/CreateUserService';

class CreateUserController{
   async handleUserInfo(req: Request, res: Response){

      const { name, email, cpf, password} = req.body;

      const createUserService = new CreateUserService

      const user = await createUserService.execute({
         name,
         cpf,
         email,
         password
      });

      return res.json(user);
   }
   
}

export { CreateUserController }