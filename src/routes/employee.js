import express from "express";
import { selectSql, insertSql, updateSql, deleteSql } from "../database/sql";

const router = express.Router();

router.get("/", async (req, res) => {
  if (
    !req.session.user ||
    (req.session.user.role !== "Doctor" && req.session.user.role !== "Nurse")
  ) {
    return res.redirect("/");
  } else if (req.session.user.role == "Doctor") {
    const doctor = await selectSql.getDoctor();
    const examination = await selectSql.getExamination({
      DoctorId: req.session.userId,
    });
    const patient = await selectSql.getPatientForDoctor({
      DoctorId: req.session.userId,
    });

    console.log(req.session.userId);

    res.render("employee", {
      title: "Doctor",
      title1: "Examination",
      title2: "Patient",
      doctor,
      examination,
      patient,
    });
  } else if (req.session.user.role == "Nurse") {
    const nurse = await selectSql.getNurse();
    const treatment = await selectSql.getTreatment({
      NurseId: req.session.userId,
    });
    const patient = await selectSql.getPatientForNurse({
      NurseId: req.session.userId,
    });

    console.log(req.session.userId);

    res.render("employee", {
      title: "Nurse",
      title1: "Treatment",
      title2: "Patient",
      nurse,
      treatment,
      patient,
    });
  }
});

router.post("/addExamination", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      DoctorId: req.session.userId,
      PatientId: vars.PatientId,
      ExamDate: vars.ExamDate,
      Details: vars.Details,
    };
    await insertSql.setExamination(data);
    res.redirect("/employee");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/addTreatment", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      NurseId: req.session.userId,
      PatientId: vars.PatientId,
      TreatTime: vars.TreatTime,
      Details: vars.Details,
    };
    await insertSql.setTreatment(data);
    res.redirect("/employee");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/updateExamination", async (req, res) => {
  try {
    const data = req.body;
    await updateSql.updateExamination(data);
    res.redirect("/employee");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/updateTreatment", async (req, res) => {
  try {
    const data = req.body;
    await updateSql.updateTreatment(data);
    res.redirect("/employee");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/deleteExamination", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      ExaminationId: vars.ExaminationId,
    };
    await deleteSql.deleteExamination(data);
    res.redirect("/employee");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/deleteTreatment", async (req, res) => {
  try {
    const data = req.body;
    await deleteSql.deleteTreatment(data);
    res.redirect("/employee");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

module.exports = router;
