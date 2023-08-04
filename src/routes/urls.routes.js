import { Router } from 'express';
import { deleteUrlById, getOpenShortUrl, getUrlById, postShortenUrl } from '../controllers/urls.controllers.js';
import { schemaValidation } from '../middlewares/schemaValidation.middleware.js';
import { isURL } from '../middlewares/urlValidation.middleware.js';
import { userAuth } from '../middlewares/userAuth.middleware.js';
import { urlSchema } from '../schemas/urls.schemas.js';

const urlsRouter = Router();

urlsRouter.post('/urls/shorten', schemaValidation(urlSchema), isURL, userAuth, postShortenUrl);
urlsRouter.get('/urls/:id', getUrlById);
urlsRouter.get('/urls/open/:shortUrl', getOpenShortUrl);
urlsRouter.delete('/urls/:id', userAuth, deleteUrlById);

export default urlsRouter;
