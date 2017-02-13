/**
 *  CMContactListPresenter.swift
 *  ContactManagement
 *  Purpose: This is a presenter class for contact add module and perform operation which is used to render contact add screen.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMAddContactPresenter {
    
    static let sharedInstance = CMAddContactPresenter()
    
    /**
     * Summary: addContactInfo
     * This method is used to sent request to server for adding contact
     *
     * @param $contactInfo: contact info.
     * @param $completion: call back method.
     *
     * @return:
     */
    func addContactInfo(_ contactInfo:[String:Any], completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        Contact.addContactWithInfo(contactInfo,completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        })
        ;
    }
    
    /**
     * Summary: validate
     * This method is used validate first name, mobile number and email ID
     *
     * @param $firstName: first name.
     * @param $mobileNumber: mobile number.
     * @param $email: email ID.
     *
     * @return: error list
     */
    func validate(_ firstName: String?,_ mobileNumber: String?, _ email: String?) -> [String] {
        
        var errorList = [String]()
        if firstName == nil || firstName?.characters.count == 0 {
            
            errorList.append(ERROR_FIRST_NAME_EMPTY);
        } else if ((firstName?.characters.count)! < 3 ) {
            
            errorList.append(ERROR_FIRST_NAME_MIN_LENGTH);
        }
        
        if mobileNumber == nil || mobileNumber?.characters.count == 0 {
            
            errorList.append(ERROR_MOBILE_NUMBER_EMPTY);
        } else {
            
            var phoneNumber = mobileNumber;
            if (mobileNumber?.hasPrefix("+919"))! {
                
                let prefixIndex = mobileNumber?.index((mobileNumber?.startIndex)!, offsetBy: 3)
                phoneNumber?.remove(at: prefixIndex!);
            }
            
            let characterSet = NSCharacterSet.decimalDigits.inverted;
            
            if phoneNumber?.rangeOfCharacter(from:characterSet) != nil {
                
                errorList.append(ERROR_MOBILE_NUMBER_INVALID);
            }
        }
        
        if email != nil && (email?.characters.count)! > 0 {
            
            let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
            if(!emailPredicate.evaluate(with: email)) {
                
                errorList.append(ERROR_EMAIL_INVALID);
                
            }
            
        }
        
        return errorList;
    }
    
    
}
