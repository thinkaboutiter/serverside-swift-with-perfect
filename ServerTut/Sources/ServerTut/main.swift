import SimpleLogger
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

#if DEBUG
    Logger.enableLogging(true)
#endif

// MARK: - Setup server
let server: HTTPServer = HTTPServer()
server.serverPort = AppConstants.ServerParameters.port
server.documentRoot = AppConstants.ServerParameters.rootDirectory

// MARK: - Routes
var routes: Routes = Routes()

// plain text route
routes.add(method: .get, uri: "/") { (request, response) in
    response.setBody(string: "Plain text response")
        .completed()
}

/// JSON helper function
/// - parameter message: a simple message to put in json response
/// - parameter response: the response object which we will configure
func returnJSONMessage(message: String, response: HTTPResponse) {
    do {
        try response.setBody(json: ["message": message])
            .setHeader(HTTPResponseHeader.Name.contentType, value: AppConstants.HeaderValues.applicationJSON)
            .completed()
    }
    catch {
        response.setBody(string: "Error handling request: \(error)")
            .completed(status: .internalServerError)
    }
}

// json route
routes.add(method: .get, uri: "/json") { (request, response) in
    returnJSONMessage(message: "Hello, JSON!", response: response)
}

// nested path (json)
routes.add(method: .get, uri: "/json/nested") { (request, response) in
    returnJSONMessage(message: "Hello, nested JSON!", response: response)
}

// parameterized requests
routes.add(method: .get, uri: "/beers/{beer_name}") { (request, response) in
    guard let valid_beerName: String = request.urlVariables["beer_name"] else {
        response.completed(status: .badRequest)
        return
    }
    
    returnJSONMessage(message: "Info for \(valid_beerName) beer!", response: response)
}

server.addRoutes(routes)

// MARK: - Start server
do {
    try server.start()
}
catch PerfectError.networkError(let err, let msg) {
    Logger.error.message("Network error: \(err) \(msg)")
}
