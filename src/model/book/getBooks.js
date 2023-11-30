import connection from "#~/config/mySql.js";

async function getBooks({
    category_id,
    sortByPrice,
    searchTitle
}) {
    sortByPrice = sortByPrice === -1 ? 'DESC' : 'ASC';

    let query = 'SELECT * FROM Books';
    let conditions = [];

    if (category_id) {
        conditions.push(`category_id = ${category_id}`);
    }
    
    if (searchTitle) {
        searchTitle = searchTitle.trim()
        conditions.push(`title LIKE '%${searchTitle}%'`);
    }

    //Join conditions
    if (conditions.length > 0) {
        query += ` WHERE ${conditions.join(' AND ')}`;
    }

    //sort
    if (sortByPrice) {
        query += ` ORDER BY current_price ${sortByPrice}`;
    }

    const [result, fields] = await connection.query(query);
    return result;
}

export default getBooks;
