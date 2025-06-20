import ballerina/sql;

/**
 * Generates a parameterized SQL query to fetch all users from the database.
 * 
 * @return A `sql:ParameterizedQuery` representing the SELECT query for all users.
 */
isolated function getUsersQuery() returns sql:ParameterizedQuery => `
    SELECT 
        id,              // User ID
        name,            // User name
        email,           // User email
        mobile,          // User mobile number
        address          // User address
    FROM 
        users;           // The users table
`;

/**
 * Generates a parameterized SQL query to insert a new user into the database.
 * 
 * @param payload The `UserCreate` record containing the user details to insert.
 * @return A `sql:ParameterizedQuery` representing the INSERT query for a new user.
 */
isolated function insertUserQuery(UserCreate payload) returns sql:ParameterizedQuery => `
    INSERT INTO users
        (
            name,           // User name
            email,          // User email
            mobile,         // User mobile number
            address         // User address
        )
    VALUES
        (
            ${payload.name},    // Insert the name from the payload
            ${payload.email},   // Insert the email from the payload
            ${payload.address}  // Insert the address from the payload (note: mobile is missing in VALUES)
        )
`;

/**
 * Generates a parameterized SQL query to delete a user from the database by their ID.
 * 
 * @param userId The ID of the user to delete.
 * @return A `sql:ParameterizedQuery` representing the DELETE query for the specified user.
 */
isolated function deleteUserQuery(int userId) returns sql:ParameterizedQuery => `
    DELETE FROM users WHERE id = ${userId}  // Delete the user with the specified ID
`;

/**
 * Generates a parameterized SQL query to update a user's information in the database by their ID.
 * 
 * @param userId The ID of the user to update.
 * @param payload The `UserUpdate` record containing the updated user details.
 * @return A `sql:ParameterizedQuery` representing the UPDATE query for the specified user.
 */
isolated function updateUserQuery(int userId, UserUpdate payload) returns sql:ParameterizedQuery =>`
    UPDATE users
        SET 
            name = COALESCE(${payload.name}, name),    // Update name if provided, otherwise keep existing
            email = COALESCE(${payload.email}, email), // Update email if provided, otherwise keep existing
            mobile = COALESCE(${payload.mobile}, mobile), // Update mobile if provided, otherwise keep existing
            address = COALESCE(${payload.address}, address) // Update address if provided, otherwise keep existing
        WHERE id = ${userId}  // Apply updates to the user with the specified ID
`;

/**
 * Generates a parameterized SQL query to fetch a single user from the database by their ID.
 * 
 * @param userId The ID of the user to fetch.
 * @return A `sql:ParameterizedQuery` representing the SELECT query for the specified user.
 */
isolated function getUserByIdQuery(int userId) returns sql:ParameterizedQuery => `
    SELECT 
        id,              // User ID
        name,            // User name
        email,           // User email
        mobile,          // User mobile number
        address          // User address
    FROM 
        users            // The users table
    WHERE 
        id = ${userId};  // Filter by the specified user ID
`;

/**
 * Generates a parameterized SQL query to fetch users from the database by searching their name.
 * 
 * @param name The name or partial name to search for (case-insensitive with LIKE).
 * @return A `sql:ParameterizedQuery` representing the SELECT query for users matching the name.
 */
isolated function getUsersByNameQuery(string name) returns sql:ParameterizedQuery => `
    SELECT 
        id,              // User ID
        name,            // User name
        email,           // User email
        mobile,          // User mobile number
        address          // User address
    FROM 
        users            // The users table
    WHERE 
        name LIKE ${"%" + name + "%"};  // Search for names containing the specified string
`;