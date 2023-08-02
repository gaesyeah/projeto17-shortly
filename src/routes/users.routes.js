import { Router } from 'express';
import { getAllUserData, signIn, signUp } from '../controllers/users.controllers.js';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { userAuth } from '../middlewares/userAuth.middleware.js';
import { signInSchema, signUpSchema } from '../schemas/auth.schemas.js';

const userRouter = Router();

userRouter.post('/signup', schemaValidation(signUpSchema), signUp);
userRouter.post('/signin', schemaValidation(signInSchema), signIn);
userRouter.get('/users/me', userAuth, getAllUserData);

export default userRouter;
