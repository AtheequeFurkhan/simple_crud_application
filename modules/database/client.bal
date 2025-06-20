import ballerinax/mysql;
import ballerinax/mysql.driver as _;

# Database configuration record to hold connection details.
#
# + user - Username for database authentication.
# + password - Password for database authentication.
# + database - Name of the database to connect to.
# + host - Hostname or IP address of the database server.
# + port - Port number for the database connection.
type DatabaseConfig record {|
    string user;       // Username for database authentication
    string password;   // Password for database authentication
    string database;   // Name of the database to connect to
    string host;       // Hostname or IP address of the database server
    int port;          // Port number for the database connection
|};

# Configurable variable for database connection settings.
#
# The configuration is expected to be provided externally via a jar file

# MySQL database client for executing queries.
#
# Initializes a MySQL client using the provided database configuration.
# The client is marked as `final` to prevent reassignment after initialization.
final mysql:Client dbClient = check new (
    user = dbConfig.user,       // Set the database username from config
    password = dbConfig.password, // Set the database password from config
    database = dbConfig.database, // Set the database name from config
    host = dbConfig.host,       // Set the database host from config
    port = dbConfig.port        // Set the database port from config
);