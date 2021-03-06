﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "DepartmentID" varchar   NOT NULL,
    "Name" varchar   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "DepartmentID"
     )
);

CREATE TABLE "EmployeeID" (
    "EmployeeID" varchar   NOT NULL,
    "DepartmentID" varchar   NOT NULL,
    CONSTRAINT "pk_EmployeeID" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Managers" (
    "DepartmentID" varchar   NOT NULL,
    "EmployeeID" varchar   NOT NULL,
    CONSTRAINT "pk_Managers" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Employees" (
    "EmployeeID" varchar   NOT NULL,
    "TitleID" varchar   NOT NULL,
    "BirthDate" date   NOT NULL,
    "FirstName" varchar   NOT NULL,
    "LastName" varchar   NOT NULL,
    "Sex" varchar   NOT NULL,
    "HireDate" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Salaries" (
    "EmployeeID" varchar   NOT NULL,
    "Salary" varchar   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "EmployeeID"
     )
);

CREATE TABLE "Titles" (
    "TitleID" varchar   NOT NULL,
    "Title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "TitleID"
     )
);

ALTER TABLE "EmployeeID" ADD CONSTRAINT "fk_EmployeeID_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_DepartmentID" FOREIGN KEY("DepartmentID")
REFERENCES "Departments" ("DepartmentID");

ALTER TABLE "Managers" ADD CONSTRAINT "fk_Managers_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employees" ("EmployeeID");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "EmployeeID" ("EmployeeID");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_EmployeeID" FOREIGN KEY("EmployeeID")
REFERENCES "Employees" ("EmployeeID");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Titles_TitleID" FOREIGN KEY("TitleID")
REFERENCES "Titles" ("TitleID");

CREATE INDEX "idx_Departments_Name"
ON "Departments" ("Name");