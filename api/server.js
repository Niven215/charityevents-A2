const express = require('express');

const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('Charity Events API is running. Try /api/events');
});

app.listen(PORT, () => {
    console.log(`Charity Events API listening on http://localhost:${PORT}`);
});
