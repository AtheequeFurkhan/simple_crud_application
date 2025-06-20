import ballerina/sql;
import ballerina/log;

# Fetches all users from the database.
#
# + return - An array of `User` records or an `sql:Error` if the operation fails.
public isolated function getUsers() returns User[]|sql:Error {
    // Log the start of the user fetch operation
    log:printInfo("Fetching users from database");
    
    // Execute the query to retrieve all users
    stream<User, sql:Error?> resultStream = dbClient->query(getUsersQuery());
    
    // Initialize an empty array to store users
    User[] users = [];
    
    // Iterate through the result stream and collect users
    error? err = from User user in resultStream
        do {
            users.push(user);
        };
    
    // Handle any errors that occurred during streaming
    if err is sql:Error {
        log:printError("Error fetching users: ", err);
        return err;
    }
    
    // Log successful completion of the operation
    log:printInfo("Successfully fetched users");
    return users;
}

# Inserts a new user into the database.
#
# + payload - The `UserCreate` object containing user data to be inserted.
# + return - An `sql:ExecutionResult` on success or an `sql:Error` on failure.
public isolated function insertUser(UserCreate payload) returns sql:ExecutionResult|sql:Error {
    // Execute the insert query with the provided payload
    return dbClient->execute(insertUserQuery(payload));
}

# Deletes a user from the database by their ID.
#
# + userId - The ID of the user to be deleted.
# + return - An `sql:ExecutionResult` on success or an `sql:Error` on failure.
public isolated function deleteUser(int userId) returns sql:ExecutionResult|sql:Error {
    // Execute the delete query for the specified user ID
    return dbClient->execute(deleteUserQuery(userId));
}

# Updates a user's information in the database by their ID.
#
# + userId - The ID of the user to be updated.
# + payload - The `UserUpdate` object containing updated user data.
# + return - An `sql:ExecutionResult` on success or an `sql:Error` on failure.
public isolated function updateUser(int userId, UserUpdate payload) returns sql:ExecutionResult|sql:Error {
    // Execute the update query with the provided user ID and payload
    return dbClient->execute(updateUserQuery(userId, payload));
}

# Fetches a single user by their ID.
#
# + userId - The ID of the user to retrieve.
# + return - A `User` record if found, `null` if no user is found, or an `sql:Error` on failure.
public isolated function getUserById(int userId) returns User|sql:Error? {
    // Log the start of the user fetch operation
    log:printInfo("Fetching user with ID: " + userId.toString());
    
    // Execute the query to retrieve the user by ID
    stream<User, sql:Error?> resultStream = dbClient->query(getUserByIdQuery(userId));
    
    // Get the first record from the result stream
    record {| User value; |}|sql:Error? result = resultStream.next();
    
    // Close the result stream to free resources
    check resultStream.close();
    
    // Return the user if found, otherwise return null
    if result is record {| User value; |} {
        return result.value;
    }
    
    return null;
}

# Fetches users by their name (search).
#
# + name - The name or partial name to search for.
# + return - An array of `User` records matching the name or an `sql:Error` on failure.
public isolated function getUsersByName(string name) returns User[]|sql:Error {
    // Execute the query to search users by name
    stream<User, sql:Error?> resultStream = dbClient->query(getUsersByNameQuery(name));
    
    // Initialize an empty array to store matching users
    User[] users = [];
    
    // Collect users from the result stream into the array
    error? e = from User user in resultStream
        do {
            users.push(user);
        };
    
    // Handle any errors that occurred during streaming
    if e is error {
        return error("Error fetching users by name from the database");
    }
    
    // Return the array of matching users
    return users;
}