import { Request, Response} from 'express';
import { RegisterCategoriesService } from '../../Services/Categorias/RegisterCategoryesService';


class RegisterCategoriesController{
   async handleCategories(req: Request, res: Response){
      const {nome} = req.body;

      const registerCategoriesService = new RegisterCategoriesService();

      const categoria = await registerCategoriesService.execute({
         nome: nome
      });

      return res.json(categoria);
   }
}

export { RegisterCategoriesController };