import { Router } from "express";
import {
  getAllGuardians,
  getGuardianByName,
} from "../controllers/guardians.controller";

const authorRouter = Router();

authorRouter.get("/", getAllGuardians);
authorRouter.get("/:name", getGuardianByName);

export default authorRouter;