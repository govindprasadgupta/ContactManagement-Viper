/**
 *  CMAppDelegate.swift
 *  ContactManagement
 *  Purpose: This app delgate is used to perform application level methods.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

@UIApplicationMain
class CMAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        CMAppDelegateHelper.setupLaunchProperties();
        CMAppDelegateHelper.addRootViewControllerInWindow(window!);
        return true
    }
}

