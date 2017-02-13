/**
 *  CMContactListPresenter.swift
 *  ContactManagement
 *  Purpose: This is a presenter class for contact detail module and perform operation which is used to render contact detail screen.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactDetailPresenter {

    static let sharedInstance = CMContactDetailPresenter()
    
    /**
     * Summary: fetchContactInfo
     * This method is used to sent request to server for fetching contact information
     *
     * @param $contactInfo: contact info.
     * @param $completion: call back method.
     *
     * @return:
     */
    func fetchContactInfo(_ contactInfo:Contact, completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        contactInfo.fetchContactInfo(completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        });
    }
    
    /**
     * Summary: updateContactInfo
     * This method is used to sent request to server for updating contact information
     *
     * @param $contactInfo: contact info.
     * @param $favourite: contact favorite.
     * @param $completion: call back method.
     *
     * @return:
     */
    func updateContactInfo(_ contactInfo:Contact, _ favourite: Bool, completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        contactInfo.updateContactInfo(favourite, completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        });
    }
 
}
