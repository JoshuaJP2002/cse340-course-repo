import express from "express";

import { showHomePage } from "./controllers/index.js";
import { showCategoriesPage, showCategoryDetailsPage } from "./controllers/categories.js";
import { showProjectsPage, showProjectDetailsPage } from "./controllers/projects.js";
import { showOrganizationsPage, showOrganizationDetailsPage } from "./controllers/organizations.js";
import { testErrorPage } from "./controllers/errors.js";

const router = express.Router();

router.get("/", showHomePage);
router.get("/categories", showCategoriesPage);
router.get("/category/:id", showCategoryDetailsPage);
router.get("/projects", showProjectsPage);
router.get("/project/:id", showProjectDetailsPage);
router.get("/organizations", showOrganizationsPage);
router.get("/organization/:id", showOrganizationDetailsPage);

router.get("/errors", testErrorPage);

export default router;