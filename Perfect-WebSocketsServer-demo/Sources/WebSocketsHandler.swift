//
//  PerfectHandlers.swift
//  WebSockets Server
//
//  Created by Kyle Jessup on 2016-01-06.
//  Copyright PerfectlySoft 2016. All rights reserved.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectLib
import PerfectWebSockets
import PerfectHTTP

func makeRoutes() -> Routes {
	
	var routes = Routes()
    // Add a default route which lets us serve the static index.html file
	routes.add(method: .get, uri: "*", handler: { request, response in
		StaticFileHandler(documentRoot: request.documentRoot, allowResponseFilters: true).handleRequest(request: request, response: response)
	})
    
    // Add the endpoint for the WebSocket example system
	routes.add(method: .get, uri: "/echo", handler: {
        request, response in
        
        // To add a WebSocket service, set the handler to WebSocketHandler.
        // Provide your closure which will return your service handler.
        WebSocketHandler(handlerProducer: {
            (request: HTTPRequest, protocols: [String]) -> WebSocketSessionHandler? in
            
            // Check to make sure the client is requesting our "echo" service.
            guard protocols.contains("echo") else {
                return nil
            }
            
            // Return our service handler.
            return EchoHandler()
        }).handleRequest(request: request, response: response)
    })
	
	return routes
}

// A WebSocket service handler must impliment the `WebSocketSessionHandler` protocol.
// This protocol requires the function `handleSession(request: WebRequest, socket: WebSocket)`.
// This function will be called once the WebSocket connection has been established,
// at which point it is safe to begin reading and writing messages.
//
// The initial `WebRequest` object which instigated the session is provided for reference.
// Messages are transmitted through the provided `WebSocket` object.
// Call `WebSocket.sendStringMessage` or `WebSocket.sendBinaryMessage` to send data to the client.
// Call `WebSocket.readStringMessage` or `WebSocket.readBinaryMessage` to read data from the client.
// By default, reading will block indefinitely until a message arrives or a network error occurs.
// A read timeout can be set with `WebSocket.readTimeoutSeconds`.
// When the session is over call `WebSocket.close()`.
class EchoHandler: WebSocketSessionHandler {
	
	// The name of the super-protocol we implement.
	// This is optional, but it should match whatever the client-side WebSocket is initialized with.
	let socketProtocol: String? = "echo"
    
    // This function is called by the WebSocketHandler once the connection has been established.
    func handleSession(request: HTTPRequest, socket: WebSocket) {
        
        // Read a message from the client as a String.
        // Alternatively we could call `WebSocket.readBytesMessage` to get binary data from the client.
        socket.readBytesMessage { (bytes, op, isFinal) in
            guard let valid_bytes: [UInt8] = bytes else {
                socket.close()
                let message: String = "Unable to find valid binary object! Socket closed!"
                debugPrint("❌ \(#file) » \(#function) » \(#line)", message, separator: "\n")
                return
            }
            
            // log received data
            let message_readData: String = "read_data=\(valid_bytes)"
            debugPrint("🌎 \(#file) » \(#function) » \(#line)", message_readData, separator: "\n")
            let message_opCode: String = "op_code=\(op)"
            debugPrint("🌎 \(#file) » \(#function) » \(#line)", message_opCode, separator: "\n")
            let message_isFinal: String = "is_final=\(isFinal)"
            debugPrint("🌎 \(#file) » \(#function) » \(#line)", message_isFinal, separator: "\n")
            
            // send back received data
            socket.sendBinaryMessage(bytes: valid_bytes, final: true, completion: {
                self.handleSession(request: request, socket: socket)
            })
        }
    }
}


