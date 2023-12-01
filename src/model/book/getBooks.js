import connection from "#~/config/mySql.js";

async function getBooks({
    category_id,
    sortByPrice,
    searchTitle,
    per_page,
    current_page
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

    // // Add LIMIT and OFFSET for pagination
    const offset = (current_page - 1) * per_page;
    query += ` LIMIT ${per_page} OFFSET ${offset}`;

    const [result, fields] = await connection.query(query);
    return result;
}

export default getBooks;
