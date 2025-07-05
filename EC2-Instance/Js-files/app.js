const express = require('express');
const path = require('path');

const app = express();
const PORT = 8000;

app.get('/', (req, res) => {
  const filePath = path.join(__dirname, '..', 'static-website', 'index.html');
  res.sendFile(filePath);
});

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`);
});