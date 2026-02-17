const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

// Health check route
app.get("/", (req, res) => {
  res.status(200).json({ status: "running" });
});

// Graceful shutdown handling (production-ready practice)
process.on("SIGTERM", () => {
  console.log("SIGTERM received. Shutting down gracefully...");
  process.exit(0);
});

process.on("SIGINT", () => {
  console.log("SIGINT received. Shutting down...");
  process.exit(0);
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
