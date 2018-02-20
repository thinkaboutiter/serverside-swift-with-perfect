import SimpleLogger
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

#if DEBUG
    Logger.enableLogging(true)
#endif


let server: HTTPServer = HTTPServer()
server.serverPort = 8181
server.documentRoot = "webRoot"


do {
    try server.start()
}
catch PerfectError.networkError(let err, let msg) {
    Logger.error.message("Network error: \(err) \(msg)")
}
