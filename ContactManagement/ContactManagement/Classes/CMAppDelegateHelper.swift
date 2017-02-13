/**
 *  CMAppDelegateHelper.swift
 *  ContactManagement
 *  Purpose: This helper class is used to provide help to setup properties for application level methods
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit
import Foundation

class CMAppDelegateHelper: NSObject {

    class func setupLaunchProperties() {
        
        CoreDataManager.startDataStore();
    }
    class func addRootViewControllerInWindow(_ window : UIWindow)  {
        
        CMContactListWireFrame.showContactListAsRootControllerInWindow(window);
    }
}
