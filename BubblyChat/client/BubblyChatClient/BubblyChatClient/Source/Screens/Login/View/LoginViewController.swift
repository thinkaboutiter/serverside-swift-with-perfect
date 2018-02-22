//
//  LoginViewController.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import UIKit
import SimpleLogger

class LoginViewController: BaseViewController, LoginViewModelConsumable {
    
    // MARK: - LoginViewModelConsumable protocol
    fileprivate(set) var viewModel: LoginViewModelable?
    func updateViewModel(_ newValue: LoginViewModelable?) {
        self.viewModel = newValue
    }
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        Logger.debug.message("\(String(describing: LoginViewController.self)) deinitialized")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure_ui()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Configurations
extension LoginViewController {
    
    fileprivate func configure_ui() {
        self.title = self.viewModel?.title
    }
}
