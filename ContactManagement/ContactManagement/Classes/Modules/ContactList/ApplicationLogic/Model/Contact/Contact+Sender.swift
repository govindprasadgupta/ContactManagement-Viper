/**
 *  Contact+Sender.swift
 *  ContactManagement
 *  Purpose: This contact category is used to send request for content object.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

extension Contact {

    /**
     * Summary: fetchContactInfo
     * This method is used to send request to server to fetch contact information for contact object
     *
     * @param $completion: call back action.
     *
     * @return:
     */
    func fetchContactInfo(completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
    
            let contactInfoService : CMContactInfoService = CMContactInfoService();
        contactInfoService.requestBodyInfo = [CM_WEB_REQUEST_URL_INFO : [CM_CONTACT_ID_KEY: String(self.contactID)]]
            contactInfoService.executeRequest(completion:{
                (responseObject: Any?, error : Error?) in
              
                completion(responseObject,error);
                })
            ;
        }
    
    
    /**
     * Summary: updateContactInfo
     * This method is used to send request to server to update contact information
     *
     * @param $favourite: contact favourite.
     * @param $completion: call back action.
     *
     * @return:
     */
    func updateContactInfo(_ favourite: Bool, completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        let contactInfoService : CMUpdateContactWebService = CMUpdateContactWebService();
        contactInfoService.requestBodyInfo = [CM_WEB_REQUEST_URL_INFO : [CM_CONTACT_ID_KEY: String(self.contactID)],
                                              CM_WEB_REQUEST_BODY_INFO : [CM_CONTACT_FAVOURITE_KEY: NSNumber(booleanLiteral: favourite)]]
        contactInfoService.executeRequest(completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        })
        ;
    }
    
    /**
     * Summary: addContactWithInfo
     * This method is used sent request to server for adding contact
     *
     * @param $contactInfo: contact info.
     * @param $completion: call back method.
     *
     * @return:
     */
    class func addContactWithInfo(_ contactInfo : [String:Any], completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        let contactaddService : CMAddContactWebService = CMAddContactWebService();
        contactaddService.requestBodyInfo = ["BodyInfo" : contactInfo]
        contactaddService.executeRequest(completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        })
        ;
    }
    
}
