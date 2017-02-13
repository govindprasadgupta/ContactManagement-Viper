/**
 *  CMAddContactViewController.swift
 *  ContactManagement
 *  Purpose: This controller screen is used to add new contact.
 *
 *  Created by Govind Gupta on 12/30/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit

class CMAddContactViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldPhone: UITextField!
    @IBOutlet weak var txtFieldEmailName: UITextField!
    @IBOutlet weak var btnProfilePic: UIButton!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    weak var addContactdelgate: CMCommonContactInterface!;
    
    /**
     * Summary: viewDidLoad
     * This method is called after the view is set
     *
     * @return:
     */
    override func viewDidLoad() {
        
        super.viewDidLoad();
        txtFieldFirstName.becomeFirstResponder();
        self.navigationItem.title = NEW_CONTACT_NAV_TITLE;
    }
    
    /**
     * Summary: btnProfilePicPressed
     * This method is called on user tapping profile pic
     *
     * @param $sender: profile btn.
     *
     * @return:
     */
    @IBAction func btnProfilePicPressed(_ sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self;
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil);
    }
    
    /**
     * Summary: btnCancelPressed
     * This method is called on user tapping cancel button
     *
     * @param $sender: cancel button.
     *
     * @return:
     */
    @IBAction func btnCancelPressed(_ sender: AnyObject) {
        
        self.view.endEditing(true);
        self.dismiss(animated: true, completion: nil);
    }
    
    /**
     * Summary: btnSavePressed
     * This method is called on user tapping save button
     *
     * @param $sender: save button.
     *
     * @return:
     */
    @IBAction func btnSavePressed(_ sender: AnyObject) {
        
        self.view.endEditing(true);
        let addContactPresenter : CMAddContactPresenter = CMAddContactPresenter.sharedInstance;
        let errorList = addContactPresenter.validate(txtFieldFirstName.text,
                                                     txtFieldPhone.text,
                                                     txtFieldEmailName.text);
        if errorList.count != 0 {
            
            self.showAlertMessageWithoutHandler(" ",errorList.joined(separator: "\n"));
        } else {
            
            self.addNewContact();
        }
        
    }
    
    /**
     * Summary: addNewContact
     * This method is used to add new contact using web services
     *
     * @return:
     */
    func addNewContact() {
        
        activityLoader.startAnimating();
        let addContactPresenter : CMAddContactPresenter = CMAddContactPresenter.sharedInstance;
        var contactInfo  = [CM_CONTACT_FIRST_NAME_KEY: NSString(string: txtFieldFirstName.text!),
                            CM_CONTACT_PHONE_KEY: NSString (string: txtFieldPhone.text!),
                            CM_CONTACT_PROFILE_PIC_KEY: "https://contacts-app.s3-ap-southeast-1.amazonaws.com/contacts/profile_pics/000/000/007/original/ab.jpg?1464516610",
                            CM_CONTACT_FAVOURITE_KEY: NSNumber(booleanLiteral: false)] as [String : Any]
        
        
        if (txtFieldLastName.text?.characters.count)! > 0 {
            contactInfo[CM_CONTACT_LAST_NAME_KEY] = NSString(string: txtFieldLastName.text!);
        }
        if (txtFieldEmailName.text?.characters.count)! > 0 {
            contactInfo[CM_CONTACT_EMAIL_KEY] = NSString(string: txtFieldEmailName.text!);
        }
        addContactPresenter.addContactInfo(contactInfo,completion:{
            (responseObject: Any?, error : Error?) in
            
            self.activityLoader.stopAnimating();
            if(error == nil &&
                self.addContactdelgate != nil) {
                
                self.addContactdelgate?.coreDataRefreshed();
                self.dismiss(animated: true, completion: nil);
            } else {
                
                self.showAlertMessageWithoutHandler(" ",error?.localizedDescription);
            }
            
        })
        
    }
    
    /**
     * Summary: textFieldShouldReturn
     * This method is textfield delegate method and call on tapping return key
     *
     * @return: tappable action
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtFieldFirstName {
            
            txtFieldLastName.becomeFirstResponder();
        } else if textField == txtFieldLastName {
            
            txtFieldPhone.becomeFirstResponder();
        } else if textField == txtFieldPhone {
            
            txtFieldEmailName.becomeFirstResponder();
        } else {
            
            self.btnSavePressed(self);
        }
        return true;
    }
    
    
}
