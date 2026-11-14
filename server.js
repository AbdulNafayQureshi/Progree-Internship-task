require('dotenv').config();
const express = require('express');
const app = express();

const PORT = process.env.PORT || 3000;
const APP_ENV = process.env.APP_ENV || 'development';

app.get('/', (req, res) => {
  res.json({ 
    message: 'Containerized App Running Successfully!',
    environment: APP_ENV 
  });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});