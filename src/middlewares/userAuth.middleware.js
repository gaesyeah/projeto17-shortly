import { db } from '../database/database.js';

export const userAuth = async (req, res, next) => {
  const { authorization } = req.headers;

  const token = authorization.replace('Bearer ', '');
  if (!authorization || token === 'Bearer') return res.status(401).send('Invalid token');

  try{
    const { rowCount } = await db.query('SELECT * FROM sessions WHERE token = $1', [token]);
    if (rowCount === 0) return res.status(401).send('Session not found');

    next();
    
  } catch ({ message }) {
    res.status(500).send(message);
  }

};
