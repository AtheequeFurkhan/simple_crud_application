import ballerinax/mysql;
import ballerinax/mysql.driver as _;

/**
 * Represents the configuration for the database connection.
 * 
 * @type DatabaseConfig A record containing database connection details.
 */
type DatabaseConfig record {|
    # User of the database used for authentication.
    string user;
    # Password of the database used for authentication.
    string password;
    # Name of the database to connect to.
    string database;
    # Host of the database server.
    string host;
    # Port number for the database connection.
    int port;
|};

/**
 * Database Client Configuration.
 * 
 * This configurable variable holds the database connection settings loaded from the configuration file (e.g., Config.toml).
 * 
 * @return A `DatabaseConfig` record or `null` if not configured.
 */
configurable DatabaseConfig dbConfig = ?;

/**
 * Initializes the MySQL database client for performing database operations.
 * 
 * The client is created using the configurable `dbConfig` and is set as a final variable to ensure a single instance throughout the application.
 * 
 * @return A `mysql:Client` instance on success or panics with an error if the connection fails.
 */
final mysql:Client dbClient = check new (
    user = dbConfig.user,           // Set the database user from the configuration
    password = dbConfig.password,   // Set the database password from the configuration
    database = dbConfig.database,   // Set the database name from the configuration
    host = dbConfig.host,           // Set the database host from the configuration
    port = dbConfig.port            // Set the database port from the configuration
