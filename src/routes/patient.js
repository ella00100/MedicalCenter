import express from "express";
import { selectSql, insertSql, updateSql, deleteSql } from "../database/sql";

const router = express.Router();

router.get("/", async (req, res) => {
  if (!req.session.user || req.session.user.role !== "Patient") {
    return res.redirect("/");
  }

  try {
    const reservation = await selectSql.getReservation({
      PatientId: req.session.userId,
    });

    res.render("patient", {
      title: "Patient",
      title1: "Reservation",
      reservation,
    });
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/addReservation", async (req, res) => {
  try {
    const vars = req.body;

    const data = {
      PatientId: req.session.userId,
      DepartmentId: vars.DepartmentId,
      ReserveDate: vars.ReserveDate,
      Details: vars.Details,
    };
    await insertSql.setReservation(data);
    res.redirect("/patient");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/updateReservation", async (req, res) => {
  try {
    const data = req.body;
    await updateSql.updateReservation(data);
    res.redirect("/patient");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

router.post("/deleteReservation", async (req, res) => {
  try {
    const data = req.body;
    await deleteSql.deleteReservation(data);
    res.redirect("/patient");
  } catch (error) {
    console.error(error);
    res.status(500).send("Internal Server Error");
  }
});

module.exports = router;
