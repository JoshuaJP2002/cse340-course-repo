import db from './db.js'

const getAllCategories = async() => {
    const query = `
        SELECT category_id, category_name
        FROM categories
        ORDER BY category_name ASC;
    `;

    const result = await db.query(query);

    return result.rows;
}

export {getAllCategories}