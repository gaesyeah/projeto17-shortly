import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import { db } from '../database/database.js';

export const signUp = async (req, res) => {
  const { name, email, password, confirmPassword } = req.body;

  if (password !== confirmPassword) return res.status(422).send({ message: 'The passwords do not match' });
  try{
    await db.query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3);', [name, email, bcrypt.hashSync(password, 10)]);
    res.sendStatus(201);

  } catch ({ code, detail }) {
    if (code === "23505") return res.status(409).send(detail)
    res.sendStatus(500);
  }
};

export const signIn = async (req, res) => {
  const { email, password } = req.body;
  try{
    const { rows, rowCount } = await db.query('SELECT id, password FROM users WHERE email = $1;', [email]);
    if (rowCount === 0) return res.status(401).send({ message: 'The email is not registered' });

    const rightPassword = bcrypt.compareSync(password, rows[0].password);
    if (!rightPassword) return res.status(401).send({ message: 'Incorrect password' });

    const token = uuid();
    await db.query('INSERT INTO sessions (token, "userId") VALUES ($1, $2);', [token, rows[0].id]);
    res.status(200).send({ token });

  } catch ({ detail }) {
    res.status(500).send(detail);
  }
}

export const getAllUserData = async (req, res) => {
  const { authorization } = req.headers;
  try {
    const token = authorization.replace('Bearer ','');
    const { rows } = await db.query(`
      SELECT 
        users.id, users.name,
        COALESCE(CAST(SUM(urls."visitCount") AS INTEGER), 0) AS "visitCount",
        CASE WHEN COUNT(urls.id) > 0 
          THEN
            JSON_AGG(JSON_BUILD_OBJECT(
              'id', urls.id,
              'shortUrl', urls."shortUrl",
              'url', urls.url,
              'visitCount', urls."visitCount"
            ) ORDER by urls."visitCount" DESC) 
          ELSE '[]'::json
        END AS "shortenedUrls"
      FROM sessions
        JOIN users
        ON sessions."userId" = users.id
        LEFT JOIN urls
        ON urls."userId" = users.id
      WHERE token = $1
      GROUP BY users.id
    ;`, [token]);
    /*LEFT JOIN é necessário porque o usuario pode não ter nenhum link 
    encurtado, então não há colunas na tabela urls referente a eles*/

    res.status(200).send(rows[0]);
    
  } catch ({ detail }) {
    res.status(500).send(detail);
  }
};
