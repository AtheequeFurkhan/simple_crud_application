# CRUD Application with Ballerina

This project is a simple CRUD (Create, Read, Update, Delete) application built using [Ballerina](https://ballerina.io/). It demonstrates how to build a RESTful API for managing user data, backed by a MySQL database.

## Features

- Create new users
- Retrieve all users or a single user by ID
- Update user details (partial updates supported)
- Delete users
- Search users by name

## Getting Started

### Prerequisites

- [Ballerina](https://ballerina.io/downloads/) (version 2201.12.7 or compatible)
- MySQL server

### Setup

1. **Clone the repository**

   ```sh
   git clone <your-repo-url>
   cd crud_application
   ```

2. **Configure the database**

   - Update the `Config.toml` file with your MySQL credentials and database details.
   - Run the SQL script in `resources/database.sql` to create the schema and populate sample data.

3. **Build and run the service**

   ```sh
   bal build
   bal run
   ```

   The service will start on port `9090`.

## File Structure

```
crud_application/
├── Ballerina.toml
├── Config.toml
├── Dependencies.toml
├── ReadMe.md
├── resources/
│   └── database.sql
├── service.bal
└── modules/
    └── database/
        ├── client.bal
        ├── db_functions.bal
        ├── db_queries.bal
        └── types.bal
```

## Main Code Entry Points

- **service.bal**: Main HTTP service.
- **modules/database/client.bal**: Database client configuration.
- **modules/database/db_functions.bal**: Database CRUD logic.
- **modules/database/db_queries.bal**: SQL queries.
- **modules/database/types.bal**: Data types.

## Example: Running the Application

```sh
bal run
```

## API Endpoints

- `GET /users` - List all users
- `POST /users` - Create a new user
- `GET /users/{id}` - Get user by ID
- `PATCH /users/{id}` - Update user by ID (partial update)
- `DELETE /users/{id}` - Delete user by ID
- `GET /users/search?name={name}` - Search users by name

## Project Structure

- `service.bal` - Main HTTP service
- `modules/database/` - Database client, types, queries, and functions
- `resources/database.sql` - SQL schema and sample data
- `Config.toml` - Database configuration

## License

This project is for demonstration purposes.

