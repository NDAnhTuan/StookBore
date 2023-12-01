import connection from "#~/config/mySql.js"

async function updateBook({
    book_id,
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
        CALL update_Books(${book_id} ,'${title}', '${descriptions}', '${publisher}', 
                            '${author}', ${stock}, ${current_price}, 
                            ${edition_version}, ${category_id})
    `

    let [result, fields] = await connection.query(query)
    return result[0]
}

export default updateBook