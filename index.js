const process = require('process');
const express = require('express');
const app = express();
process.title = 'app1';
 
app.get('/', (req, res) => {
            res.send('Hello World');
});
 
const PORT = process.env.PORT || 8000;
app.listen(PORT, () => {
            console.log(`Server listening on port ${PORT}...`);
});
