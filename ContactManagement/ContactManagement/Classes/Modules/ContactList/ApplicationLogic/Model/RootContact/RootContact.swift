/**
 *  RootContact.swift
 *  ContactManagement
 *  Purpose: This domain object is used to store root contact information.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import Foundation
import CoreData


public class RootContact: NSManagedObject {

        @NSManaged public var contactList: NSSet?
}
