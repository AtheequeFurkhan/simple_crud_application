import ballerina/sql;

isolated function getUsersQuery() returns sql:ParameterizedQuery => `
    SELECT 
        id,
        name,
        email,
        mobile,
        address
    FROM 
        users;
`;

isolated function insertUserQuery(UserCreate payload) returns sql:ParameterizedQuery => `
    INSERT INTO users
        (
            name,
            email,
            mobile,
            address
        
        )
    VALUES
        (
            ${payload.name},
            ${payload.email},
            ${payload.address}
        
        )
`;

isolated function deleteUserQuery(int userId) returns sql:ParameterizedQuery => `
    DELETE FROM users WHERE id = ${userId}
`;

isolated function updateUserQuery(int userId, UserUpdate payload) returns sql:ParameterizedQuery =>`
    UPDATE users
        SET 
            name = COALESCE(${payload.name}, name),
            email = COALESCE(${payload.email}, email),
            mobile = COALESCE(${payload.mobile}, mobile)
            address = COALESCE(${payload.address}, address)
         
        WHERE id = ${userId}
`;

isolated function getUserByIdQuery(int userId) returns sql:ParameterizedQuery => `
    SELECT 
        id,
        name,
        email,
        mobile,
        address
    FROM 
        users
    WHERE 
        id = ${userId};
`;

isolated function getUsersByNameQuery(string name) returns sql:ParameterizedQuery => `
    SELECT 
        id,
        name,
        email,
        mobile,
        address
    FROM 
        users
    WHERE 
        name LIKE ${"%" + name + "%"};
`;
