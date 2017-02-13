/**
 *  Contact.swift
 *  ContactManagement
 *  Purpose: This domain object is used to store contact information.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import Foundation
import CoreData


public class Contact: NSManagedObject {

    @NSManaged public var contactID: Int16
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var email: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var profilePic: String?
    @NSManaged public var isFavorite: Bool
    @NSManaged public var createdAt: NSDate?
    @NSManaged public var updatedAt: NSDate?
    @NSManaged public var parentContact: RootContact?
}
