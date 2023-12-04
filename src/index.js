import express from 'express';
import logger from 'morgan';
import path from 'path';
import expressSession from "express-session";

import homeRouter from './routes/home';
import loginRouter from './routes/login';
import managerRouter from './routes/manager';
import employeeRouter from './routes/employee';
import patientRouter from './routes/patient';

const PORT = 8000;

const app = express(); 

app.use(express.static(path.join(__dirname, '/src')));
app.use(express.urlencoded({ extended: false })) 
app.use(express.json()); 
app.use(
    expressSession({
        secret: "my key",
        resave: true,
        saveUninitialized: true,
    })
);


app.set('views', path.join(__dirname, './views')); 
app.set('view engine', 'hbs');
app.use(express.static(path.join(__dirname, 'public')));

app.use(logger('dev'));

app.use('/', homeRouter);
app.use('/login', loginRouter);
app.use('/manager', managerRouter);
app.use('/employee', employeeRouter);
app.use('/patient', patientRouter);

app.listen(PORT, () => {
    console.log(`Server is running at http://localhost:${PORT}`)
});