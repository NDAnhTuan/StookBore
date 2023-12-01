import connection from "#~/config/mySql.js"

async function deleteBook({
    book_id
}) {
    let query = `CALL delete_Book(${book_id})`
    const [result, fields] = await connection.query(query)

    return result[0]
}

export default deleteBook