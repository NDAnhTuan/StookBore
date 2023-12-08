import {} from 'dotenv/config'
import express from 'express'
import path from 'path'
import cors from 'cors'
import { dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));

const app = express();
const port = process.env.PORT || 3000;

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({extended: true}))
app.use(express.static(path.join(__dirname, 'Views/Font')));
app.use(express.static(path.join(__dirname, 'Views/mockup')));
app.use(express.static(path.join(__dirname, 'Views/src/css')));
app.use(express.static(path.join(__dirname, 'Views/src/img')));
app.use(express.static(path.join(__dirname, 'Views')));


app.use((error, req, res, next) => {
    console.log(error.message)
    const status = error.status || 500
    const message = error.message
    const data = error.data
    res.status(status).json({message: message, data: data})
})


//handle error middleware
app.get('/', async function (req, res) {
    try {
        res.sendFile('lamdep.html', { root: './Views' });
    } catch (err) {
        res.status(500).json({message: err.message})
    }
})


// Start the server
app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
