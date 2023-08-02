import { db } from '../database/database.js';

export const userAuth = async (req, res, next) => {
  const { authorization } = req.headers;

  if (!authorization) return res.sendStatus(401);

  try{
    const token = authorization.replace('Bearer ', '');
    const { rows, rowCount } = await db.query('SELECT * FROM sessions WHERE token = $1', [token]);
    if (rowCount === 0) return res.sendStatus(401);

    res.locals.userId = rows[0].userId;
    next();
    
  } catch ({ message }) {
    res.status(500).send(message);
  }

};
