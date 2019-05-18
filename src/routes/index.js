import express from "express";

const router = express.Router();

router.get("/", function(req, res, next) {
  res.render('index', { title: 'Demo ES6 Babel Node VSCode' });
});

export default router;
