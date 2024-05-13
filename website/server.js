const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const app = express();
const port = 3000;

// Enable CORS for all routes (adjust as necessary for production)
app.use(cors());

// Serve static files from the 'public' directory
app.use(express.static('public'));

// Set up MySQL connection using connection pooling for better performance and reliability
const dbPool = mysql.createPool({
    connectionLimit: 10, // Max number of connections
    host: 'website-mysql-1', // Use the actual container name here
    port: '3306', // Standard MySQL port
    user: 'root', // MySQL username
    password: 'BedoWaell55//', // MySQL password
    database: 'cloud' // Database name
});

// Error listener for the connection pool
dbPool.on('error', function (err) {
    console.error('Unexpected error on idle database connection', err);
    dbPool.end(() => console.log('Closed all database connections'));
});

// Root URL to welcome users (this will now serve the static index.html automatically)
app.get('/', (req, res) => {
  res.send('Welcome to the API. Access /api/team to fetch team data.');
});

// API route to fetch team data
app.get('/api/team', (req, res) => {
    dbPool.query('SELECT * FROM TeamMembers', (err, results) => {
        if (err) {
            console.error('Error querying database:', err);
            res.status(500).send('Error fetching team data');
            return;
        }
        res.json(results);
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
