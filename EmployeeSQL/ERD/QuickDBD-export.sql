-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DepartmentID" int   NOT NULL,
    "Name" string   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DepartmentID"
     )
);

CREATE TABLE "EmployeeID" (
    "EmployeeID" int   NOT NULL,
    "DepartmentID" int   NOT NULL,
    CONSTRAINT "pk_EmployeeID" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Managers" (
    "DepartmentID" int   NOT NULL,
    "EmployeeID" int   NOT NULL,
    CONSTRAINT "pk_Managers" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Employees" (
    "EmployeeID" int   NOT NULL,
    "TitleID" string   NOT NULL,
    "BirthDate" date   NOT NULL,
    "FirstName" string   NOT NULL,
    "LastName" string   NOT NULL,
    "Sex" string   NOT NULL,
    "HireDate" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Salaries" (
    "EmployeeID" int   NOT NULL,
    "Salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Titles" (
    "TitleID" string   NOT NULL,
    "Title" string   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "TitleID"
     )
);

ALTER TABLE "EmployeeID" ADD CONSTRAINT "fk_EmployeeID_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "EmployeeID" ("EmployeeID");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "EmployeeID" ("EmployeeID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "EmployeeID" ("EmployeeID");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_TitleID" FOREIGN KEY("TitleID")
REFERENCES "Employees" ("TitleID");

CREATE INDEX "idx_Departments_Name"
ON "Departments" ("Name");

