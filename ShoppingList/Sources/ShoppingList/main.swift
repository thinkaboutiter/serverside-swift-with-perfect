import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
// import StORM
// import MongoDBStORM

// MARK: - Setup DB connection
// MongoDBConnection.host = "127.0.0.1"
// MongoDBConnection.database = "ShoppingList"

// MARK: - Setup server
let server = HTTPServer()
server.serverPort = 8080

// MARK: - Routes
let basic = BasicController()
server.addRoutes(Routes(basic.routes))

// MARK: - Start server
do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
