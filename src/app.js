import cors from 'cors';
import dotenv from 'dotenv';
import express from 'express';
import './database/database.js';

const app = express();
app.use(express.json(), cors());

dotenv.config();
const { PORT } = process.env;

const port = PORT || 5000;
app.listen(port, () => console.log(`Rodando em http://localhost:${port}`));