/**
 *  CMContactListWireFrame.swift
 *  ContactManagement
 *  Purpose: This wireframe is used to prepare contact list screen.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactListWireFrame: NSObject {
    
    /**
     * Summary: showContactListAsRootControllerInWindow
     * This method is used to prepare contact list screen as root controller
     *
     * @param $window: application window.
     *
     * @return:
     */
    class func showContactListAsRootControllerInWindow(_ window : UIWindow)  {
        
        let mainStoryboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let contactListNavController : UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "CMContactListNavController") as! UINavigationController;
        window.rootViewController = contactListNavController;
    }
    
    /**
     * Summary: prepareforSegueScreen
     * This method is used to prepare segue from contact list screen
     *
     * @param $segue: segue information.
     * @param $sender: sender information.
     *
     * @return:
     */
    class func prepareforSegueScreen(for segue: UIStoryboardSegue,  with sender :  Any?) {
        
        if (segue.identifier == "displayContactInfoScreen")  {
            
            CMContactDetailWireFrame.prepareContactDetailScreen(for: segue, and: sender);
            
        } else if (segue.identifier == "displayAddContactScreen") {
            
            CMAddContactWireFrame.prepareAddContactScreen(for: segue);
        }
        
    }
}
