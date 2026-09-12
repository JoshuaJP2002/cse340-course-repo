import express from "express";
import { fileURLToPath } from "url";
import path from "path";
import {testConnection} from "./src/models/db.js";
import { getAllOrganizations } from './src/models/organizations.js'; 

// Define the application environment
const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || "production";

// Define the port number the server will listen on
const PORT = Number.parseInt(process.env.PORT, 10) || 3000;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();

// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Tell Express where to find your templates
app.set('views', path.join(__dirname, 'src/views'));

// Serve static files from the public directory
app.use(express.static(path.join(__dirname, "public")));

const getCategories = () => {
  const categories = [
    { name: "Environmental", description: "Projects that protect natural spaces." },
    { name: "Educational", description: "Projects that support learning and mentorship." },
    { name: "Community Service", description: "Projects that strengthen local communities." },
    { name: "Health and Wellness", description: "Projects that promote healthy living." }
  ];

  return categories.map((category, index) => ({
    ...category,
    id: index + 1,
    slug: category.name.toLowerCase().replaceAll(" ", "-")
  }));
};

app.get("/", (req, res) => {
  const title = "Home";
  res.render("home", { title });
});

app.get("/organizations", async (req, res) => {
  const organizations = await getAllOrganizations();
  

  const title = "Organizations";
  res.render("organizations", { title, organizations });
});

app.get("/projects", (req, res) => {
  const title = "Service Projects";
  res.render("projects", { title });
});

app.get("/categories", (req, res) => {
  const title = "Service Project Categories";
  const categories = getCategories();
  res.render("categories", { title, categories });
});

app.listen(PORT, async () => {

  try {
    await testConnection();
    console.log(`Server is running at http://127.0.0.1:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
  } catch (error) {
    console.error('Failed to start server:', error);
    process.exit(1); // Exit the process with an error code
  }

});
