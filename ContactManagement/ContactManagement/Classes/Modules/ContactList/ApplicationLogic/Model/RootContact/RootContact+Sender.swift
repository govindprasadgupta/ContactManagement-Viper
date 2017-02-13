/**
 *  RootContact+Sender.swift
 *  ContactManagement
 *  Purpose: This contact category is used to send request for root content object.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */


import UIKit

extension RootContact {
    
    /**
     * Summary: fetchContactList
     * This method is used to send request to server to fetch contact list
     *
     * @param $completion: call back action.
     *
     * @return:
     */
    func fetchContactList(completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
    
            let contactListService : CMContactListWebService = CMContactListWebService();
            contactListService.executeRequest(completion:{
                (responseObject: Any?, error : Error?) in
              
                completion(responseObject,error);
                })
            ;
        }
    
}
