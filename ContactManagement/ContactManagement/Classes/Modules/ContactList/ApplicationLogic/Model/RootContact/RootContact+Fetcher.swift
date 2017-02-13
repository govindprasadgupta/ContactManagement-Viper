/**
 *  RootContact+Fetcher.swift
 *  ContactManagement
 *  Purpose: This contact category is used to fetch root contact object from DB.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import Foundation
import CoreData
 

extension RootContact {

    /**
     * Summary: getRootContact
     * This method is used to fetch root contact from data store
     *
     * @return: root contact
     */
    class func getRootContact() -> RootContact {
        
        var rootContact : RootContact? = CoreDataManager.getModelObjectList(NSStringFromClass(RootContact.self), withPedicate:nil, andSortedBy: nil).first as? RootContact;
        if rootContact == nil {
            
            rootContact = (CoreDataManager.createModelObject("RootContact") as! RootContact);
        }
        
        return rootContact!;
    }
    
    

  
}
