/**
 *  CMContactInfoService.swift
 *  ContactManagement
 *  Purpose: This web service is used to add contact onto server.
 *
 *  Created by Govind Gupta on 12/31/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMAddContactWebService: CMWebService {

    /**
     * Summary: relativeURL
     * This method is used to return relative url for web service
     *
     * @return: relative url
     */
    override func relativeURL() -> String {
        
        return   CM_ADD_CONTACT_URL + CM_WEBSERVICE_RES_TYLE;
    }
    
    /**
     * Summary: getMethodName
     * This method is used to return web service method name
     *
     * @return: complete url
     */
    override func getMethodName() -> String {
        
        return CM_POST_METHOD_TYPE;
        
    }
    
    /**
     * Summary: performActionOnResponse
     * This method is used to add contact in data store
     *
     * @param $responseObject: server response.
     *
     * @return: object to send on call back owner
     */
    override func performActionOnResponse(_ responseObject: Any?) -> Any? {
        
            
            let contactModelInfo = CoreDataManager.createModelObject("Contact") as! Contact;
            contactModelInfo.setModelProperties(responseObject as! NSDictionary);
        let rootContact : RootContact = RootContact.getRootContact();
        var contactList : Array = (rootContact.contactList?.allObjects)!;
        contactList.append(contactModelInfo);
        rootContact.contactList = NSSet(array: contactList);
        
        CoreDataManager.saveContext();
        return contactModelInfo;
        
    }
    
}
