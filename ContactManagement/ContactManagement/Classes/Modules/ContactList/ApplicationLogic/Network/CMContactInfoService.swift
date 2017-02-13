/**
 *  CMContactInfoService.swift
 *  ContactManagement
 *  Purpose: This web service is used to fetch contact info from server.
 *
 *  Created by Govind Gupta on 12/29/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactInfoService: CMWebService {

    /**
     * Summary: relativeURL
     * This method is used to return relative url for web service
     *
     * @return: relative url
     */
    override func relativeURL() -> String {
      
        let contactID : String = requestBodyInfo![CM_WEB_REQUEST_URL_INFO]![CM_CONTACT_ID_KEY]! as! String
        
        return CM_CONTACT_LIST_URL + "/" + contactID + CM_WEBSERVICE_RES_TYLE;
    }
    
    /**
     * Summary: performActionOnResponse
     * This method is used to update contact info in data store
     *
     * @param $responseObject: server response.
     *
     * @return: object to send on call back owner
     */
    override func performActionOnResponse(_ responseObject: Any?) -> Any? {
        
          let contactID : Int16 = Int16(requestBodyInfo![CM_WEB_REQUEST_URL_INFO]![CM_CONTACT_ID_KEY]! as! String)!

        let contactPredicate = NSPredicate(format: "contactID == \(contactID)");
        let contactInfo : Contact = CoreDataManager.getModelObjectList(NSStringFromClass(Contact.self), withPedicate: contactPredicate, andSortedBy: nil).first as! Contact;
        
        contactInfo.setModelProperties(responseObject as! NSDictionary)
        CoreDataManager.saveContext();
        return nil;
        
    }
    
}
