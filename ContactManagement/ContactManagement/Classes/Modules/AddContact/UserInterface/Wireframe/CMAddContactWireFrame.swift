/**
 *  CMAddContactWireFrame.swift
 *  ContactManagement
 *  Purpose: This wireframe is used to prepare add contact screen.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMAddContactWireFrame: NSObject {

    /**
     * Summary: prepareAddContactScreen
     * This method is used to prepare contact add screen
     *
     * @param $segue: segue information.
     *
     * @return:
     */
    class func prepareAddContactScreen(for segue: UIStoryboardSegue)  {
        
        let addcontactNavController : UINavigationController = segue.destination as! UINavigationController;
        let addContactController : CMAddContactViewController = addcontactNavController.viewControllers.first as! CMAddContactViewController;
        addContactController.addContactdelgate = segue.source as? CMCommonContactInterface;
    }
}
