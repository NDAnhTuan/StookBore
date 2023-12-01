import connection from "#~/config/mySql.js";

async function addBook({
    title,
    descriptions,
    publisher,
    author,
    stock,
    current_price,
    edition_version,
    category_id
}) {
    let query = `
        CALL insert_Books('${title}', '${descriptions}', '${publisher}', 
                            '${author}', ${stock}, ${current_price}, 
                            ${edition_version}, ${category_id})
    `

    let [result, fields] = await connection.query(query)
    return result[0]
}

export default addBook