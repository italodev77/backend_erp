import { Router } from 'express'
import { CreateUserController } from '../Controllers/user/CreateUserController';

const router = Router();

router.post('/createUser', new CreateUserController().handleUserInfo);


export { router };

