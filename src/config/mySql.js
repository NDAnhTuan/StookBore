import mysql from "mysql"
import {} from "dotenv/config"

async function connect() {
    try {
        const connection = mysql.createConnection({
            host: process.env.DB_HOST,
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD,
            database: process.env.DB_NAME
        })

        connection.connect()
        console.log("connect successfuly");

    } catch (error) {
        console.log("connect failure!");
    }
}

export default {connect} 
