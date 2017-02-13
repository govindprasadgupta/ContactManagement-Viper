/**
 *  CMContactListWebService.swift
 *  ContactManagement
 *  Purpose: This web service is used to fetch contact list from server.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactListWebService: CMWebService {

    /**
     * Summary: relativeURL
     * This method is used to return relative url for web service
     *
     * @return: relative url
     */
    override func relativeURL() -> String {
        
        return CM_CONTACT_LIST_URL + CM_WEBSERVICE_RES_TYLE;
    }
    
    /**
     * Summary: performActionOnResponse
     * This method is used to insert contact list in data store
     *
     * @param $responseObject: server response.
     *
     * @return: object to send on call back owner
     */
    override func performActionOnResponse(_ responseObject: Any?) -> Any? {
        
        let rootContact : RootContact = RootContact.getRootContact();
        let contactList : Array = rootContact.parseAndSaveContactList(responseObject as! NSArray);
        CoreDataManager.saveContext();
        return contactList;
       
    }
}
