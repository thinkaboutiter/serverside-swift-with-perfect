import SimpleLogger
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

#if DEBUG
    Logger.enableLogging(true)
#endif

// MARK: - Setup server
let server: HTTPServer = HTTPServer()
server.serverPort = 8181
server.documentRoot = "webRoot"

// MARK: - Routes
var routes: Routes = Routes()
routes.add(method: .get, uri: "/") { (request, response) in
    response.setBody(string: "Plain text response").completed()
}
server.addRoutes(routes)

// MARK: - Start server
do {
    try server.start()
}
catch PerfectError.networkError(let err, let msg) {
    Logger.error.message("Network error: \(err) \(msg)")
}
