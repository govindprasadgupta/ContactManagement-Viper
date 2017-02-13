/**
 *  RootContact+Helper.swift
 *  ContactManagement
 *  Purpose: This contact category is used to provide help for performing write operation on root contact object.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import Foundation
import CoreData
 

extension RootContact {

    /**
     * Summary: parseAndSaveContactList
     * This method is used to set root contact properties from dictionary
     *
     * @param $contactList: contact info list.
     *
     * @return: contact object list
     */
    func parseAndSaveContactList(_ contactList:NSArray) -> [NSManagedObject] {
        
        var contactModelList : Array = [NSManagedObject]();
        
        for contactInfo in contactList {
            
           
            let contactModelInfo = CoreDataManager.createModelObject("Contact") as! Contact;
            contactModelInfo.setModelProperties(contactInfo as! NSDictionary);
            contactModelList.append(contactModelInfo);
        }
        
        self.contactList = NSSet(array: contactModelList);
        return contactModelList;
        
    }
}
