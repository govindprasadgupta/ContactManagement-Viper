/**
 *  CMContactListPresenter.swift
 *  ContactManagement
 *  Purpose: This is a presenter class for contact list module and perform operation which is used to render contact list screen.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMContactListPresenter {
    
    let contactSections = ["*","#","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    var contactInfoList : NSMutableArray = [];
    
    static let sharedInstance = CMContactListPresenter()
    
    /**
     * Summary: fetchContactList
     * This method is used to sent request to server for fetching contact list from server
     *
     * @param $completion: call back method.
     *
     * @return:
     */
    func fetchContactList(completion: @escaping (_ result: Any?, _ error : Error?) -> Void) {
        
        let rootContact = RootContact.getRootContact();
        rootContact.fetchContactList(completion:{
            (responseObject: Any?, error : Error?) in
            
            completion(responseObject,error);
        })
        ;
    }
    
    /**
     * Summary: createGroupSections
     * This method is used to create grouped contact list
     *
     * @return:
     */
    func createGroupSections() {
        
        contactInfoList.removeAllObjects();
        for _ in 1...contactSections.count  {
            
            contactInfoList.add(NSMutableArray());
            
        }
        
        self.createGroupedContactList(CoreDataManager.getModelObjectList(NSStringFromClass(Contact.self), withPedicate: nil, andSortedBy: "firstName") as NSArray);
        
    }
    
    /**
     * Summary: createGroupedContactList
     * This method is used to create grouped contact list
     *
     * @param $contactList: contact list.
     *
     * @return:
     */
    func createGroupedContactList(_ contactList: NSArray) {
        
        for contactInfo  in contactList {
            
            let contact  = contactInfo as? Contact
            let firstChar = contact?.firstName?.substring(to: (contact?.firstName?.index((contact?.firstName?.startIndex)!, offsetBy: 1))!);
            let  contactIndex = contactSections.index(of: firstChar!.uppercased());
            if contactIndex != nil {
                
                (contactInfoList.object(at: contactIndex!) as? NSMutableArray)?.add(contactInfo);
            } else {
                (contactInfoList.object(at: 1) as? NSMutableArray)?.add(contactInfo);
            }
            
            if (contact?.isFavorite)! {
                
                (contactInfoList.object(at: 0) as? NSMutableArray)?.add(contactInfo);
            }
            
            
            
        }
    }
    
    /**
     * Summary: prepareforSegueScreen
     * This method is used to prepare segue from contact list screen
     *
     * @param $segue: segue information.
     * @param $sender: sender source.
     *
     * @return:
     */
    func prepareforSegueScreen(for segue: UIStoryboardSegue, with sender :  Any?) {
        
        CMContactListWireFrame.prepareforSegueScreen(for: segue, with: sender);
    }
    
 
    
}
