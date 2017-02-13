/**
 *  CMContactTableCell.swift
 *  ContactManagement
 *  Purpose: This table cell class is used to show contact info in table.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

let CM_CONTACT_CELL_IDENTIFIER      =   "ContactCellIdentifier"

class CMContactTableCell: CMBaseTableCell {


    @IBOutlet weak var imgContactPersion: UIImageView!
    @IBOutlet weak var lblContactName: UILabel!
    
    /**
     * Summary: loadCellWithContactInfo
     * This method is used to load cell with contact info
     *
     * @param $contactInfo: contact info.
     *
     * @return:
     */
    func loadCellWithContactInfo(_ contactInfo: Contact) {
        
        lblContactName?.text = contactInfo.firstName! + " " + contactInfo.lastName!;
        if contactInfo.profilePic != nil {
            
            imgContactPersion.setImageFor(contactInfo.profilePic, with: "ContactPlaceHolder");
        }
    }
}
