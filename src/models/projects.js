import db from './db.js'

const getAllProjects = async() => {
    const query = `
        SELECT 
            p.project_id, 
            p.organization_id, 
            p.title, 
            p.description, 
            p.location, 
            p.project_date,
            o.name as organization_name
        FROM projects p
        JOIN organization o ON p.organization_id = o.organization_id
        ORDER BY p.project_date DESC;
    `;

    const result = await db.query(query);

    return result.rows;
}

export {getAllProjects}