//
//  BasicController.swift
//  ShoppingList
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

final class BasicController {
    
    // MARK: - Properties
    var routes: [Route] {
        return [
            Route(method: .get, uri: "/all", handler: all),
            Route(method: .post, uri: "/shoppingItem", handler: create)
        ]
    }
    
    // MARK: - Life cycle
    func all(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json: String = try ShoppingItem.allAsString()
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func create(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try ShoppingItem.create(withJSONRequest: request.postBodyString)
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
}
