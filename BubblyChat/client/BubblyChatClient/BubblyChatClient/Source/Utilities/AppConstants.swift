//
//  AppConstants.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import Foundation

struct AppConstants {
    
    // MARK: - Storyboard names
    struct StoryboardName {
        static let initial: String = "Initial"
        static let login: String = "Login"
        static let chat: String = "Chat"
    }
    
    // MARK: - Localized strings comments
    struct LocalizedStringComment {
        static let screenTitle: String = "Screen title"
        static let errorMessage: String = "Error message"
    }
    
    // MARK: - Error messages
    struct ErrorMessage {
        static let generic: String = NSLocalizedString("Something went wrong!", comment: AppConstants.LocalizedStringComment.errorMessage)
    }
}
