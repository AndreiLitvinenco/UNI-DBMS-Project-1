# DBMS Class Project: Social events company DB

## Overview
This repository contains the project developed by me for the Database Management Systems (DBMS) class. The project focuses on the design, implementation and normalization of a database model for a social events company. The database used in this project is MySQL.

## Table of Contents
- [Overview](#overview)
- [Installation](#installation)
- [Database Schema](#database-schema)
- [Technologies Used](#technologies-used)


## Installation
### I. Installation for linux
1. Clone the repository:

   ```bash
   git clone https://github.com/AndreiLitvinenco/UNI-DBMS-Project-1
   ```
2. Navigate to the project directory:

    ```bash
    cd UNI-DBMS-Project-1
    ```

4. If not installed already, install mysql-server on your machine:
    ```
    sudo apt install mysql-server -y
    ```

5. Make sure you have the mysql daemon working:
    ```
    sudo systemctl start mysql.service
    ```
6. Connect to the database:
    ```
    sudo mysql -u root -p 
    ```
7. Use the sql script to create the database on your machine:
    ```sql
    SOURCE EventCompanyDB.sql;
    ```

### II. Installation for Windows
1. Clone the repository as an archive or using the git command:
   ```bash
   git clone https://github.com/AndreiLitvinenco/UNI-DBMS-Project-1
   ```
2. Navigate to the project on your machine.

3. Make sure you have a mysql daemon running.
   
4. Connect to the database:
    ```
    sudo mysql -u root -p 
    ```
5. Use the sql script to create the database on your machine:
    ```sql
    SOURCE EventCompanyDB.sql;
    ```

## Database Schema
The database schema for this project is designed to meet the requirements of the class project. The schema includes the following tables:

* Staff
* Clients
* Events
* Suppliers
* EventSuppliers
* EventStaff
* Payments
* EventExpenses
  
Database Schema
![ALT TEXT](DatabaseER%20copy.png)


## Technologies Used
* MySQL
* MySQL Workbench
