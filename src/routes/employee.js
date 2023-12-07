import express from "express";
import { selectSql, insertSql, updateSql, deleteSql } from "../database/sql";

const router = express.Router();

router.get("/", async (req, res) => {
  if (req.session.user.role == "Doctor") {
    const doctor = await selectSql.getDoctor();
    const examination = await selectSql.getExamination({
      DoctorId: req.session.userId,
    });
    const patient = await selectSql.getPatientForDoctor({
      DoctorId: req.session.userId,
    });

    console.log(req.session.userId);
    console.log(examination);
    console.log(patient);

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

module.exports = router;
