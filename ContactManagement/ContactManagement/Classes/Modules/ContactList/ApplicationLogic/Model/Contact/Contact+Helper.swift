/**
 *  Contact+Helper.swift
 *  ContactManagement
 *  Purpose: This contact category is used to provide help for performing write operation on contact object.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import Foundation
import CoreData


extension Contact {
    
    /**
     * Summary: setModelProperties
     * This method is used to set contact properties from dictionary
     *
     * @param $contactInfo: contact info.
     *
     * @return:
     */
    func setModelProperties(_ contactInfo:NSDictionary) {
        
        if ((contactInfo.value(forKey:CM_CONTACT_ID_KEY)) != nil) {
            
            self.contactID  = Int16((contactInfo.value(forKey:CM_CONTACT_ID_KEY) as! NSNumber).intValue);
        }
        if ((contactInfo.value(forKey: CM_CONTACT_PROFILE_PIC_KEY)) != nil &&
            !(contactInfo.value(forKey: CM_CONTACT_PROFILE_PIC_KEY) is NSNull)) {
            
            var profilePicLink : String = (contactInfo.value(forKey: CM_CONTACT_PROFILE_PIC_KEY) as! String);
            
            if (!profilePicLink.hasPrefix("https://")) {
                
                profilePicLink  = CM_WEBSERVICE_BASE_URL + profilePicLink;
            }
            self.profilePic = profilePicLink;
        }
        if ((contactInfo.value(forKey: CM_CONTACT_FIRST_NAME_KEY)) != nil &&
            !(contactInfo.value(forKey: CM_CONTACT_FIRST_NAME_KEY) is NSNull)) {
            
            self.firstName = (contactInfo.value(forKey: CM_CONTACT_FIRST_NAME_KEY) as! String).replacingOccurrences(of: "\n", with: "");
        }
        if ((contactInfo.value(forKey: CM_CONTACT_LAST_NAME_KEY)) != nil &&
            !(contactInfo.value(forKey: CM_CONTACT_LAST_NAME_KEY) is NSNull)) {
            
            self.lastName = (contactInfo.value(forKey: CM_CONTACT_LAST_NAME_KEY) as! String);
        }
        if ((contactInfo.value(forKey: CM_CONTACT_PHONE_KEY)) != nil &&
            !(contactInfo.value(forKey: CM_CONTACT_PHONE_KEY) is NSNull)) {
            
            self.phoneNumber = (contactInfo.value(forKey: CM_CONTACT_PHONE_KEY) as! String);
        }
        if ((contactInfo.value(forKey: CM_CONTACT_EMAIL_KEY)) != nil &&
            !(contactInfo.value(forKey: CM_CONTACT_EMAIL_KEY) is NSNull)) {
            
            self.email = (contactInfo.value(forKey: CM_CONTACT_EMAIL_KEY) as! String);
        }
        if ((contactInfo.value(forKey: CM_CONTACT_FAVOURITE_KEY)) != nil &&
            !(contactInfo.value(forKey: CM_CONTACT_FAVOURITE_KEY) is NSNull)) {
            
            self.isFavorite = (contactInfo.value(forKey: CM_CONTACT_FAVOURITE_KEY) as! NSNumber).boolValue;
        }
        
    }
    
}
