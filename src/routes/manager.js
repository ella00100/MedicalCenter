// manager.js

import express from 'express';
import { selectSql, insertSql, updateSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (!req.session.user || req.session.user.role !== 'Manager') {
        return res.redirect('/');
    }

    try {
        const doctor = await selectSql.getDoctor();
        const nurse = await selectSql.getNurse();

        res.render('manager', {
            title: 'Medicalist',
            title1: 'Doctor',
            title2: 'Nurse',
            doctor,
            nurse,
        });
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

router.post('/addDoctor', async (req, res) => {
    try {
        const data = req.body;
        await insertSql.setDoctor(data);
        res.redirect('/manager');
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

router.post('/addNurse', async (req, res) => {
    try {
        const data = req.body;
        await insertSql.setNurse(data);
        res.redirect('/manager');
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

router.post('/updateDoctor', async (req, res) => {
    try {
        const data = req.body;
        await updateSql.updateDoctor(data);
        res.redirect('/manager');
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

router.post('/updateNurse', async (req, res) => {
    try {
        const data = req.body;
        await updateSql.updateNurse(data);
        res.redirect('/manager');
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

router.post('/deleteDoctor', async (req, res) => {
    try {
        const data = req.body;
        await deleteSql.deleteDoctor(data);
        res.redirect('/manager');
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

router.post('/deleteNurse', async (req, res) => {
    try {
        const data = req.body;
        await deleteSql.deleteNurse(data);
        res.redirect('/manager');
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
});

export default router;
