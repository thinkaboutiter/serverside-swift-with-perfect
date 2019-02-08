import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import StORM
import PostgresStORM

PostgresConnector.host = "localhost"
PostgresConnector.username = "pguser1"
PostgresConnector.password = "p@ssword"
PostgresConnector.database = "til_db_1"
PostgresConnector.port = 5432

let setupObj = Acronym()
try? setupObj.setup()

let server = HTTPServer()
server.serverPort = 8080

let basic = BasicController()
server.addRoutes(Routes(basic.routes))

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error thrown: \(err) \(msg)")
}
