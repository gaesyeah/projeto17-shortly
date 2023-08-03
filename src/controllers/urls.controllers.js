import { nanoid } from 'nanoid';
import { db } from '../database/database.js';

export const postShortenUrl = async (req, res) => {
  const { url } = req.body;
  const { authorization } = req.headers;

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
  res.send('getOpenShortUrl');
};

export const deleteUrlById = async (req, res) => {
  res.send('deleteUrlById');
}