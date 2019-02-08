//
//  InitialViewController.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import UIKit
import SimpleLogger

class InitialViewController: BaseViewController {
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    deinit {
        Logger.debug.message("\(String(describing: InitialViewController.self)) deinitialized")
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.continueApplicationFlow()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - Application flow
extension InitialViewController {
    
    fileprivate func continueApplicationFlow() {
        guard let valid_appDelegate: AppDelegate = UIApplication.shared.delegate as? AppDelegate else {
            Logger.error.message("Unable to obtain \(String(describing: AppDelegate.self)) shared instance")
            return
        }
        
        guard let valid_vc: LoginViewController = UIViewController.fromStoryboard(withName: AppConstants.StoryboardName.login) else {
            Logger.error.message("Unable to obtain \(String(describing: LoginViewController.self))")
            return
        }
        
        let vm: LoginViewModel = LoginViewModel()
        valid_vc.updateViewModel(vm)
        let navController: BaseNavigationController = BaseNavigationController(rootViewController: valid_vc)
        
        executeAsyncOnMainQueue(afterDelay: 0.5) {
            valid_appDelegate.switchRootViewController(to: navController)
        }
    }
}
