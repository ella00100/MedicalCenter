import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', (req, res) => {
    res.render('login');
})

router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getUser();

    users.map((user) => {
        console.log('User ID :', user.UserId);
        console.log('User Password: ', user.Password);
        console.log(' ');
        if (vars.id == user.UserId && vars.password == user.Password) {
            console.log('login success!');
            req.session.user = { id: user.UserId, role : 'user', checkLogin: true };
            req.session.userId = user.UserId;
        }
    });


    if (req.session.user == undefined) {
        console.log('login failed!');
        res.send(`<script>
                    alert('아이디 혹은 비밀번호를 확인하세요!');
                    location.href='/';
                </script>`)
    } else if (req.session.user.checkLogin ) {
        res.redirect('/userMain');
    } 
});

module.exports = router;
