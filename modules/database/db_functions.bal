import ballerina/sql;
import ballerina/log;

/**
 * Fetches all users from the database.
 * 
 * @param dbClient The database client to execute queries.
 * @return An array of `User` records or `sql:Error` if the query fails.
 */
public isolated function getUsers() returns User[]|sql:Error {
    log:printInfo("Fetching users from database"); // Log the start of the fetch operation
    stream<User, sql:Error?> resultStream = dbClient->query(getUsersQuery()); // Execute the query and retrieve a stream of User records
    User[] users = []; // Initialize an array to store the fetched users
    error? err = from User user in resultStream
        do {
            users.push(user); // Add each user from the stream to the array
        };
    if err is sql:Error {
        log:printError("Error fetching users: ", err); // Log any errors encountered during the fetch
        return err; // Return the error if the query fails
    }
    log:printInfo("Successfully fetched users"); // Log successful completion of the fetch
    return users; // Return the array of users
}

/**
 * Inserts a new user into the database.
 * 
 * @param payload The `UserCreate` record containing user details to insert.
 * @return `sql:ExecutionResult` on success or `sql:Error` if the operation fails.
 */
public isolated function insertUser(UserCreate payload) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(insertUserQuery(payload)); // Execute the parameterized insert query
}

/**
 * Deletes a user from the database by their ID.
 * 
 * @param userId The ID of the user to delete.
 * @return `sql:ExecutionResult` on success or `sql:Error` if the operation fails.
 */
public isolated function deleteUser(int userId) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(deleteUserQuery(userId)); // Execute the parameterized delete query
}

/**
 * Updates a user's information in the database by their ID.
 * 
 * @param userId The ID of the user to update.
 * @param payload The `UserUpdate` record containing updated user details.
 * @return `sql:ExecutionResult` on success or `sql:Error` if the operation fails.
 */
public isolated function updateUser(int userId, UserUpdate payload) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(updateUserQuery(userId, payload)); // Execute the parameterized update query
}

/**
 * Fetches a single user from the database by their ID.
 * 
 * @param userId The ID of the user to fetch.
 * @return A `User` record if found, `null` if not found, or `sql:Error?` if the query fails.
 */
public isolated function getUserById(int userId) returns User|sql:Error? {
    // Execute the query and get a stream of user records
    log:printInfo("Successfully fetching user by ID: ", userId); // Log the start of the fetch operation with the user ID
    stream<User, sql:Error?> resultStream = dbClient->query(getUserByIdQuery(userId)); // Execute the query and retrieve a stream of User records
    
    // Get the first record from the stream
    record {| User value; |}|sql:Error? result = resultStream.next();
    
    // Close the stream
    check resultStream.close(); // Ensure the stream is closed to free resources
    
    // If a record is found, return the User
    if result is record {| User value; |} {
        return result.value; // Return the fetched user
    }

    return null; // Return null if no user is found
}

/**
 * Fetches users from the database by searching their name.
 * 
 * @param name The name or partial name to search for (case-insensitive with LIKE).
 * @return An array of `User` records matching the search or `sql:Error` if the query fails.
 */
public isolated function getUsersByName(string name) returns User[]|sql:Error {
    // Execute the query to search users by name.
    log:printInfo("Successfully fetching users by name: ", name); // Log the start of the search operation with the name
    stream<User, sql:Error?> resultStream = dbClient->query(getUsersByNameQuery(name)); // Execute the query and retrieve a stream of User records
    User[] users = []; // Initialize an array to store the matching users
    // Collect users from the stream into an array.
    error? e = from User user in resultStream
        do {
            users.push(user); // Add each matching user from the stream to the array
        };
    // If there was an error during streaming, return an error.
    if e is error {
        return error("Error fetching users by name from the database"); // Return an error if the streaming fails
    }
    return users; // Return the array of matching users
}