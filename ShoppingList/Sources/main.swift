import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import StORM
import MongoDBStORM

// MARK: - Setup DB connection
MongoDBConnection.host = "localhost"
MongoDBConnection.database = "ShoppingList"

// MARK: - DB schema
let setupObj: ShoppingItem = ShoppingItem()
try? setupObj.setup()

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

