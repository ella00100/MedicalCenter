import express from 'express';
import { insertSql } from '../database/sql';

const router = express.Router();

router.get('/', (req, res) => {
    res.render('home', { data: " " });
})

module.exports = router;
