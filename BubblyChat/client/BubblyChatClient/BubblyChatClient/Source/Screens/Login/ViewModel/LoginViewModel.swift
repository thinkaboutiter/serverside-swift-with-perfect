//
//  LoginViewModel.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import Foundation
import SimpleLogger

/// Functionality for `View` object to implement
protocol LoginViewModelConsumable {
    var viewModel: LoginViewModelable? { get }
    func updateViewModel(_ newValue: LoginViewModelable?)
}

/// Functionality for `ViewModel` object to implement and expose to `View` object
protocol LoginViewModelable {
    var title: String? { get }
}

class LoginViewModel: LoginViewModelable {
    
    // MARK: - Properties
    var title: String? {
        return "Login"
    }
    
    // MARK: - Initialization
    init() {
        
    }
    
    deinit {
        Logger.debug.message("\(String(describing: LoginViewModel.self)) deinitialized")
    }
}

