import { db } from '../database/database.js';

export const getRanking = async (req, res) => {
  try {
    const { rows } = await db.query(`
      SELECT users.id, users.name,
        COALESCE(CAST(SUM(urls."visitCount") AS INTEGER), 0) AS "visitCount",
        CAST(COUNT(urls.id) AS INTEGER) AS "linksCount"
      FROM users
        LEFT JOIN urls 
        ON users.id = urls."userId"
      GROUP BY users.id
      ORDER BY "visitCount" DESC, "linksCount" DESC
      LIMIT 10
    ;`);
    /*LEFT JOIN é necessário porque podem estar inclusos usuarios sem links 
    encurtados, então não há colunas na tabela urls referente a eles*/

    res.status(200).send(rows);

  } catch ({ detail }) {
    res.status(500).send(detail);
  }
}