import express from "express";
import { selectSql, insertSql, updateSql, deleteSql } from "../database/sql";

const router = express.Router();

router.get("/", async (req, res) => {
  if (!req.session.user || req.session.user.role !== "Manager") {
    return res.redirect("/");
  }

  try {
    const doctor = await selectSql.getDoctor();
    const nurse = await selectSql.getNurse();

    res.render("manager", {
      title: "Management Medicalist",
      title1: "Doctor",
      title2: "Nurse",
      doctor,
      nurse,
    });
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('해당 페이지의 정보를 불러올 수 없습니다');
        location.href='/manager';
      </script>
    `);
  }
});

router.post("/addDoctor", async (req, res) => {
  try {
    const data = req.body;
    await insertSql.setDoctor(data);
    res.redirect("/manager");
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('데이터 입력 형식을 확인하세요');
        location.href='/manager';
      </script>
    `);
  }
});

router.post("/addNurse", async (req, res) => {
  try {
    const data = req.body;
    await insertSql.setNurse(data);
    res.redirect("/manager");
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('데이터 입력 형식을 확인하세요');
        location.href='/manager';
      </script>
    `);
  }
});

router.post("/updateDoctor", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      DoctorId: vars.DoctorId,
      DepartmentId: vars.DepartmentId,
      Name: vars.Name,
      Address: vars.Address,
      PhoneNumber: vars.PhoneNumber,
    };
    await updateSql.updateDoctor(data);
    res.redirect("/manager");
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('데이터 입력 형식을 확인하세요');
        location.href='/manager';
      </script>
    `);
  }
});

router.post("/updateNurse", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      NurseId: vars.NurseId,
      DepartmentId: vars.DepartmentId,
      Name: vars.Name,
      Address: vars.Address,
      PhoneNumber: vars.PhoneNumber,
    };
    await updateSql.updateNurse(data);
    res.redirect("/manager");
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('데이터 입력 형식을 확인하세요');
        location.href='/manager';
      </script>
    `);
  }
});

router.post("/deleteDoctor", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      DoctorId: vars.DoctorId,
    };
    await deleteSql.deleteDoctor(data);
    res.redirect("/manager");
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('외래키 제약으로 인해 해당 의사의 정보를 삭제 할 수 없습니다');
        location.href='/manager';
      </script>
    `);
  }
});

router.post("/deleteNurse", async (req, res) => {
  try {
    const data = req.body;
    await deleteSql.deleteNurse(data);
    res.redirect("/manager");
  } catch (error) {
    console.error(error);
    res.status(500).send(`
      <script>
        alert('외래키 제약으로 인해 해당 간호사의 정보를 삭제 할 수 없습니다');
        location.href='/manager';
      </script>
    `);
  }
});

export default router;
