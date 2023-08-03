import { nanoid } from 'nanoid';
import { db } from '../database/database.js';
import { isURL } from '../functions/urlValidation.js';

export const postShortenUrl = async (req, res) => {
  const { url } = req.body;
  const { authorization } = req.headers;

  if (!isURL(req.body.imgUrl)) return res.status(422).send('\"url\" must be a valid url');

  try {
    const token = authorization.replace('Bearer ','');
    const { rows } = await db.query('SELECT "userId" FROM sessions WHERE token = $1;', [token]);

    const shortUrl = nanoid(8);
    await db.query('INSERT INTO urls ("userId", url, "shortUrl") VALUES ($1, $2, $3);', [rows[0].userId, url, shortUrl]);

    const selectedShortUrl = await db.query('SELECT id, "shortUrl" FROM urls WHERE "shortUrl" = $1;', [shortUrl]);
    res.status(201).send(selectedShortUrl.rows[0]);
    
  } catch ({ detail }) {
    res.status(500).send(detail);
  }
};

export const getUrlById = async (req, res) => {
  const { id } = req.params;
  try {
    const { rows, rowCount } = await db.query('SELECT id, "shortUrl", url FROM urls WHERE id = $1;', [id]);
    if (rowCount === 0) return res.status(404).send({ message: 'Url not Found' });
    
    res.status(200).send(rows[0]);
    } catch ({ detail }) {
    res.status(500).send(detail);
  }
};

export const getOpenShortUrl = async (req, res) => {
  const { shortUrl } = req.params;
  try {
    const { rows, rowCount } = await db.query('SELECT url FROM urls WHERE "shortUrl" = $1;', [shortUrl]);
    if (rowCount === 0) return res.status(404).send({ message: 'Url not Found' });

    await db.query('UPDATE urls SET "visitCount" = "visitCount"+1 WHERE "shortUrl" = $1;', [shortUrl]);

    res.redirect(rows[0].url);

  } catch ({ detail }) {
    res.status(500).send(detail);
  }
};

export const deleteUrlById = async (req, res) => {
  const { id } = req.params;
  const { authorization } = req.headers;
  try {
    const { rows, rowCount } = await db.query('SELECT "userId" FROM urls WHERE id = $1;', [id]);
    if (rowCount === 0) return res.status(404).send('Url not Found');

    const token = authorization.replace('Bearer ','');
    const sessions = await db.query('SELECT "userId" FROM sessions WHERE token = $1;', [token]);
    if (sessions.rows[0].userId !== rows[0].userId) return res.status(401).send('You can only delete a url shortened by you'); 

    await db.query('DELETE FROM urls WHERE id = $1;', [id]);

    res.sendStatus(204);

  } catch ({ detail }) {
    res.status(500).send(detail);
  }
}