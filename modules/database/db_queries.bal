import ballerina/sql;

# Constructs a parameterized query to fetch all users from the database.
#
# + return - A `sql:ParameterizedQuery` to select all columns from the users table.
isolated function getUsersQuery() returns sql:ParameterizedQuery => `
    SELECT 
        id,          -- Unique identifier for the user
        name,        -- User's full name
        email,       -- User's email address
        mobile,      -- User's mobile number
        address      -- User's address
    FROM 
        users;       -- Table containing user data
`;

# Constructs a parameterized query to insert a new user into the database.
#
# + payload - The `UserCreate` object containing user data to be inserted.
# + return - A `sql:ParameterizedQuery` for inserting a new user record.
isolated function insertUserQuery(UserCreate payload) returns sql:ParameterizedQuery => `
    INSERT INTO users
        (
            name,        -- User's full name
            email,       -- User's email address
            mobile,      -- User's mobile number
            address      -- User's address
        )
    VALUES
        (
            ${payload.name},    -- Parameterized name value
            ${payload.email},   -- Parameterized email value
            ${payload.mobile},  -- Parameterized mobile value
            ${payload.address}  -- Parameterized address value
        )
`;

# Constructs a parameterized query to delete a user by their ID.
#
# + userId - The ID of the user to be deleted.
# + return - A `sql:ParameterizedQuery` for deleting a user record.
isolated function deleteUserQuery(int userId) returns sql:ParameterizedQuery => `
    DELETE FROM users WHERE id = ${userId}  -- Delete user with the specified ID
`;

# Constructs a parameterized query to update a user's information by their ID.
#
# + userId - The ID of the user to be updated.
# + payload - The `UserUpdate` object containing updated user data.
# + return - A `sql:ParameterizedQuery` for updating a user record.
isolated function updateUserQuery(int userId, UserUpdate payload) returns sql:ParameterizedQuery => `
    UPDATE users
        SET 
            name = COALESCE(${payload.name}, name),      -- Update name if provided, else retain existing
            email = COALESCE(${payload.email}, email),   -- Update email if provided, else retain existing
            mobile = COALESCE(${payload.mobile}, mobile),-- Update mobile if provided, else retain existing
            address = COALESCE(${payload.address}, address) -- Update address if provided, else retain existing
        WHERE id = ${userId}  -- Update user with the specified ID
`;

# Constructs a parameterized query to fetch a user by their ID.
#
# + userId - The ID of the user to retrieve.
# + return - A `sql:ParameterizedQuery` to select a user by ID.
isolated function getUserByIdQuery(int userId) returns sql:ParameterizedQuery => `
    SELECT 
        id,          -- Unique identifier for the user
        name,        -- User's full name
        email,       -- User's email address
        mobile,      -- User's mobile number
        address      -- User's address
    FROM 
        users        -- Table containing user data
    WHERE 
        id = ${userId};  -- Filter by the specified user ID
`;

# Constructs a parameterized query to fetch users by a partial name match.
#
# + name - The name or partial name to search for.
# + return - A `sql:ParameterizedQuery` to select users with matching names.
isolated function getUsersByNameQuery(string name) returns sql:ParameterizedQuery => `
    SELECT 
        id,          -- Unique identifier for the user
        name,        -- User's full name
        email,       -- User's email address
        mobile,      -- User's mobile number
        address      -- User's address
    FROM 
        users        -- Table containing user data
    WHERE 
        name LIKE ${"%" + name + "%"};  -- Match names containing the search term
`;