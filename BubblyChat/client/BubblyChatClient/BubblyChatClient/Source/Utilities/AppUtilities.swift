//
//  AppUtilities.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import Foundation

/**
 Execute closure on main queue *async* after delay (in seconds)
 - parameter delay: Time interval (in seconds) after which closure will be executed
 - parameter completion: Closure to be executed on `main` thread
 */
func executeAsyncOnMainQueue(afterDelay delay: Double, _ completion: @escaping (() -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        completion()
    }
}

func executeOnMainQueue(async: Bool, block: @escaping () -> Void) {
    if async {
        DispatchQueue.main.async {
            block()
        }
    }
    else {
        DispatchQueue.main.sync {
            block()
        }
    }
}
