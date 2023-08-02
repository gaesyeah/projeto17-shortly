import { Router } from 'express';
import rankingRouter from './ranking.routes.js';
import urlsRouter from './urls.routes.js';
import userRouter from './users.routes.js';

const indexRouter = Router();

indexRouter.use(userRouter, urlsRouter, rankingRouter);

export default indexRouter;