//
//  ChatManager.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 23/Feb/2018 Fri.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import Foundation

class ChatManager {
    
    // MARK: - Properties
    static let shared: ChatManager = ChatManager()
    fileprivate var username: String = "unknown user"
    
    // MARK: - Initialize
    fileprivate init() {
        
    }
}
