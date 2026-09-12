Create table organization (
	organization_id serial primary key,
	name varchar(150) not null,
	description text not null,
	contact_email varchar(255) not null,
	logo_filename varchar(255) not null
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE organization (
	organization_id serial primary key,
	name varchar(150) not null,
	description text not null,
	contact_email varchar(255) not null,
	logo_filename varchar(255) not null
);

INSERT INTO organization (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

CREATE TABLE projects (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES organization(organization_id)
);

INSERT INTO projects (organization_id, title, description, location, project_date) VALUES
(1, 'Community Center Renovation', 'Renovate and expand the local community center to serve more families.', '123 Main St, Springfield', '2024-06-15'),
(1, 'Safe Playground Construction', 'Build a safe, accessible playground for children in the neighborhood.', '456 Park Ave, Springfield', '2024-07-20'),
(1, 'Bridge Repair Initiative', 'Repair critical infrastructure bridge in rural area.', '789 County Rd, Springfield', '2024-08-10'),
(1, 'School Infrastructure Upgrade', 'Upgrade water and sanitation facilities in local schools.', '321 School Ln, Springfield', '2024-09-05'),
(1, 'Affordable Housing Project', 'Construct affordable housing units for low-income families.', '654 Development Dr, Springfield', '2024-10-12'),
(2, 'Urban Garden Initiative', 'Create community gardens in urban neighborhoods for fresh produce.', '111 Garden St, Greenville', '2024-05-20'),
(2, 'School Nutrition Program', 'Establish nutrition gardens at local schools for educational purposes.', '222 Education Ave, Greenville', '2024-06-30'),
(2, 'Rooftop Farm Development', 'Transform rooftops into productive farming spaces in the city.', '333 Rooftop Rd, Greenville', '2024-07-15'),
(2, 'Community Composting Hub', 'Build a composting center to reduce food waste and create soil amendments.', '444 Eco Ln, Greenville', '2024-08-08'),
(2, 'Seed Bank Preservation', 'Preserve local seed varieties and provide seeds to community members.', '555 Heritage Way, Greenville', '2024-09-22'),
(3, 'Disaster Relief Effort', 'Provide immediate assistance to families affected by recent flooding.', '666 Relief St, Harmony', '2024-04-10'),
(3, 'Homeless Support Network', 'Coordinate support services for homeless individuals in the community.', '777 Care Blvd, Harmony', '2024-05-15'),
(3, 'Youth Mentorship Program', 'Match at-risk youth with mentors for guidance and support.', '888 Youth Center, Harmony', '2024-06-01'),
(3, 'Food Bank Operation', 'Run and restock local food bank to serve hungry families.', '999 Food St, Harmony', '2024-07-08'),
(3, 'Senior Care Initiative', 'Provide companionship and assistance to elderly residents.', '101 Elder Ave, Harmony', '2024-08-20');

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE project_category (
    project_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories (category_name) VALUES
('Community Development'),
('Environmental Conservation'),
('Education & Youth');

INSERT INTO project_category (project_id, category_id) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 1),
(6, 2),
(7, 3),
(8, 2),
(9, 2),
(10, 2),
(11, 1),
(12, 1),
(13, 3),
(14, 1),
(15, 1);