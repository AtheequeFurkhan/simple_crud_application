import ballerina/sql;

# User record type.
#
# + id - field description  
# + name - field description  
# + email - field description  
# + address - field description  
# + mobile - field description
public type User record {|
    # User ID
    @sql:Column {name: "id"}
    readonly int id;

    # User name
    @sql:Column {name: "name"}
    string name;

    # User email
    @sql:Column {name: "email"}
    string email;

    # User address
    @sql:Column {name: "address"}
    string address;

    @sql:Column {name: "mobile"}
    string mobile;
    
|};        

# User create record type.
#
# + name - field description  
# + email - field description  
# + address - field description  
# + mobile - field description
public type UserCreate record {|
    # User name
    string name;
    # User email
    string email;
    # User address
    string address;

    string mobile;
    
|};

# User update record type.
#
# + name - field description  
# + email - field description  
# + address - field description  
# + mobile - field description
public type UserUpdate record {|
    # User name
    string? name = ();
    # User email
    string? email = ();
    # User address
    string? address = ();
    # User mobile
    string?mobile = ();
|};