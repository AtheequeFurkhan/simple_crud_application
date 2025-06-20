import ballerina/sql;
import ballerina/log;

// Fetch all users from the database.
// Returns an array of User records or an sql:Error on failure.
public isolated function getUsers() returns User[]|sql:Error {
    log:printInfo("Fetching users from database");
    stream<User, sql:Error?> resultStream = dbClient->query(getUsersQuery());
    User[] users = [];
    error? err = from User user in resultStream
        do {
            users.push(user);
        };
    if err is sql:Error {
        log:printError("Error fetching users: ", err);
        return err;
    }
    log:printInfo("Successfully fetched users");
    return users;
}

// Insert a new user into the database.
public isolated function insertUser(UserCreate payload) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(insertUserQuery(payload));
}

// Delete a user from the database by user ID.
public isolated function deleteUser(int userId) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(deleteUserQuery(userId));
}

// Update a user's information in the database by user ID.
public isolated function updateUser(int userId, UserUpdate payload) returns sql:ExecutionResult|sql:Error {
    return dbClient->execute(updateUserQuery(userId, payload));
}

// Fetch a single user by their ID.
public isolated function getUserById(int userId) returns User|sql:Error? {
    // Execute the query and get a stream of user records
    stream<User, sql:Error?> resultStream = dbClient->query(getUserByIdQuery(userId));
    
    // Get the first record from the stream
    record {| User value; |}|sql:Error? result = resultStream.next();
    
    // Close the stream
    check resultStream.close();
    
    // If a record is found, return the User
    if result is record {| User value; |} {
        return result.value;
    }

    return null;
}

// Fetch users by their name (search).
public isolated function getUsersByName(string name) returns User[]|sql:Error {
    // Execute the query to search users by name.
    stream<User, sql:Error?> resultStream = dbClient->query(getUsersByNameQuery(name));
    User[] users = [];
    // Collect users from the stream into an array.
    error? e = from User user in resultStream
        do {
            users.push(user);
        };
    // If there was an error during streaming, return an error.
    if e is error {
        return error("Error fetching users by name from the database");
    }
    return users;
}






