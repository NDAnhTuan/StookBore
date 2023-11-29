import connection from "#~/config/mySql.js"

async function getCategories({

}){

    let query = 'SELECT * FROM Category'
    const [result, fields] = await connection.query(query)

    return result
}

export default getCategories