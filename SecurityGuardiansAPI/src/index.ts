import express from "express";


import guardiansRouter from "./routes/guardians.router";

const app = express();
const port = process.env.PORT || 8080;

app.use(express.json());
app.use("/guardians", guardiansRouter);

app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});