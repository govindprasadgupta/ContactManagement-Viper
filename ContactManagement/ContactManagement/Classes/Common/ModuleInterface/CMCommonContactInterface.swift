/**
 *  CMCommonContactInterface.swift
 *  ContactManagement
 *  Purpose: This interface class is used to communicate between two module.
 *
 *  Created by Govind Gupta on 1/1/17.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

protocol CMCommonContactInterface :class   {

    /**
     * Summary: coreDataRefreshed
     * This method is used to inform target class about DB updation
     *
     * @param $objectName: Domain object name.
     *
     * @return:
     */
    func coreDataRefreshed();
}
