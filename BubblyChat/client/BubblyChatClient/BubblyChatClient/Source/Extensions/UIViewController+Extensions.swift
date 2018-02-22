//
//  UIViewController+Extensions.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import UIKit
import SimpleLogger

// MARK: - Storyboard initialization
extension UIViewController {
    
    /**
     Instantiate initial `ViewController` from given `Storyboard`
     - parameter storyboardName: Name of the storyboard
     - parameter bundle: Bundle for the storyboard
     - returns: Optional `ViewController`
     */
    class func initialFromStoryboard(withName storyboardName: String, bundle: Bundle? = nil) -> UIViewController? {
        guard let valid_initial_vc: UIViewController = UIStoryboard(name: storyboardName, bundle: bundle).instantiateInitialViewController() else {
            Logger.error.message("Unable to instantiate initial view controller")
            return nil
        }
        return valid_initial_vc
    }
    
    /**
     Instantiate `ViewController` from given `Storyboard` inferring the `ViewController`'s `Type`
     - parameter storyboardName: Name of the storyboard
     - parameter bundle: Bundle for the storyboard
     - returns: Optional inferred `ViewController`
     */
    class func fromStoryboard<VCType>(withName storyboardName: String, bundle: Bundle? = nil) -> VCType? {
        guard let valid_vc: VCType = UIStoryboard(name: storyboardName, bundle: bundle).instantiateViewController(withIdentifier: String(describing: VCType.self)) as? VCType else {
            Logger.error.message("Unable to instantiate \(String(describing: VCType.self))")
            return nil
        }
        return valid_vc
    }
}

