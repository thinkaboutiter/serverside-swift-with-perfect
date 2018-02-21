//
//  BasicController.swift
//  til_tut
//
//  Created by boyankov on W08 21/Feb/2018 Wed.
//

import Foundation
import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// Responsibility: call appropriate func, deal with request/response, exception handling
final class BasicController {
    
    var routes: [Route] {
        return [
            Route(method: .get, uri: "/test", handler: test),
            Route(method: .post, uri: "/new", handler: new),
            Route(method: .get, uri: "/all", handler: all),
            Route(method: .get, uri: "/first", handler: first),
            Route(method: .get, uri: "/afks", handler: afks),
            Route(method: .get, uri: "/non-afks", handler: nonAfks),
            Route(method: .post, uri: "/update", handler: update),
            Route(method: .get, uri: "/delete-first", handler: deleteFirst)
        ]
    }
    
    func test(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.testAFK()
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        }
        catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func new(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.newAcronym(withJSONRequest: request.postBodyString)
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func all(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.all()
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func first(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.first()
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func afks(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.matchingShort("AFK")
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func nonAfks(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.notMatchingShort("AFK")
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func update(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.updateAcronym(withJSONRequest: request.postBodyString)
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
    
    func deleteFirst(request: HTTPRequest, response: HTTPResponse) {
        do {
            let json = try AcronymConverter.deleteFirst()
            response.setBody(string: json)
                .setHeader(.contentType, value: "application/json")
                .completed()
        } catch {
            response.setBody(string: "Error handling request: \(error)")
                .completed(status: .internalServerError)
        }
    }
}
