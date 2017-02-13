/**
 *  CMBaseTableCell.swift
 *  ContactManagement
 *  Purpose: This base class is implemented for custom table view cell.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMBaseTableCell: UITableViewCell {

    /**
     * Summary: loadTableViewCellFromNib
     * This class method is used to create table cell object
     *
     * @return: table cell object
     */
    class func loadTableViewCellFromNib() -> UITableViewCell {
    
        let nibName: String       = String(describing: self)
        let nibContents: Array    = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)!
        let cell: UITableViewCell!      = nibContents[0] as! UITableViewCell;
        cell.isExclusiveTouch = true
        cell.contentView.clipsToBounds = true
    
        return cell;
    }

}
