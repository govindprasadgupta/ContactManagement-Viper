/**
 *  UIViewController+Helper.swift
 *  ContactManagement
 *  Purpose: This category class is implemented for UIViewController to perform common operations.
 *
 *  Created by Govind Gupta on 1/1/17.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

extension UIViewController {
    
    /**
     * Summary: showAlertMessageWithoutHandler
     * This method is used to show alert without alert action handler
     *
     * @param $title: alert title.
     * @param $message: alert message.
     *
     * @return:
     */
    func showAlertMessageWithoutHandler(_ title:String?, _ message:String?) {
        
        let alertController  = UIAlertController(title: title,
                                                 message:message,
                                                 preferredStyle: .alert);
        let defaultAction = UIAlertAction(title: OK_BTN_TITLE, style: .default, handler: nil);
        
        alertController.addAction(defaultAction);
        self.present(alertController, animated: true, completion: nil);
    }
    
}
