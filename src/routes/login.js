import express from "express";
import { selectSql } from "../database/sql";

const router = express.Router();

router.get("/", (req, res) => {
  res.render("login");
});

router.post("/", async (req, res) => {
  const vars = req.body;
  let users;
  console.log(req.body);

  // 각 역할에 따라 다른 로그인 처리를 수행
  if (vars.role == "Manager") {
    users = await selectSql.getManager();
  } else if (vars.role == "Doctor") {
    users = await selectSql.getDoctor();
  } else if (vars.role == "Nurse") {
    users = await selectSql.getNurse();
  } else if (vars.role == "Patient") {
    users = await selectSql.getPatient();
  } else {
    // 유효하지 않은 역할에 대한 처리
    return res.send("Invalid role");
  }

  // 사용자 정보와 입력받은 정보를 비교하여 로그인 여부 확인
  const user = users.find(
    (u) => u[`${vars.role}Id`] === vars.id && u.Password === vars.password
  );
  console.log(user);

  if (user) {
    console.log("Login success!");
    req.session.user = {
      id: user[`${vars.role}Id`],
      role: vars.role,
      checkLogin: true,
    };
    req.session.userId = user[`${vars.role}Id`];

    if (vars.role === "Manager") {
      res.redirect("/manager");
    } else if (vars.role === "Doctor" || vars.role === "Nurse") {
      res.redirect("/employee");
    } else if (vars.role === "Patient") {
      res.redirect("/patient");
    }
  } else {
    console.log("Login failed!");
    res.send(`<script>
                    alert('아이디 혹은 비밀번호를 확인하세요!');
                    location.href='/';
                </script>`);
  }
});

module.exports = router;
