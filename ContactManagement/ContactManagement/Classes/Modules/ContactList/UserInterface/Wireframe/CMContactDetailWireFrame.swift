/**
 *  CMContactDetailWireFrame.swift
 *  ContactManagement
 *  Purpose: This wireframe is used to prepare contact detail screen.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactDetailWireFrame: NSObject {

    /**
     * Summary: prepareContactDetailScreen
     * This method is used to prepare segue from contact detail screen
     *
     * @param $segue: segue information.
     * @param $sender: sender information.
     *
     * @return:
     */
    class func prepareContactDetailScreen(for segue: UIStoryboardSegue, and sender :  Any?)  {
        
        let contactController : CMContactDetailViewController = segue.destination as! CMContactDetailViewController;
        contactController.contactInfo = sender as? Contact;
        contactController.contactInfoDelgate = segue.source as? CMCommonContactInterface;
    }
}
