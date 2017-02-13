/**
 *  CMContactDetailViewController.swift
 *  ContactManagement
 *  Purpose: This controller screen is used to show contact detailed information.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit
import MessageUI

class CMContactDetailViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var contactInfo : Contact!
    
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var imgPhone: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var activityLoader: UIActivityIndicatorView!
    @IBOutlet weak var imgFavourite: UIImageView!
    @IBOutlet weak var imgProfilePic: UIImageView!
    
    weak var contactInfoDelgate: CMCommonContactInterface!;
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationItem.title = CONTACT_INFO_NAV_TITLE;
        self.lblName.text = contactInfo.firstName! + " " + contactInfo.lastName!;
        self.lblPhone.text = (contactInfo.phoneNumber != nil) ? contactInfo.phoneNumber! : CONTACT_INFO_LOADING_TEXT
        self.lblMail.text = (contactInfo.email != nil) ? contactInfo.email! : CONTACT_INFO_LOADING_TEXT
        self.imgFavourite.image = self.contactInfo.isFavorite ? UIImage(named: FAVOURITE_FILL_ICON) : UIImage(named: FAVOURITE_ICON)
        if contactInfo.profilePic != nil {
            
            imgProfilePic.setImageFor(contactInfo.profilePic, with: IMAGE_PLACE_HOLDER_ICON);
        }
        self.fetchContentInfo();
    }
    
    /**
     * Summary: fetchContentInfo
     * This method is used to fetch info from server
     *
     * @return:
     */
    func fetchContentInfo()  {
        
        let contactAddPresenter : CMContactDetailPresenter = CMContactDetailPresenter.sharedInstance;
        contactAddPresenter.fetchContactInfo(contactInfo,completion:{
            (responseObject: Any?, error : Error?) in
            
            if(error == nil) {
                self.lblName.text = self.contactInfo.firstName! + " " + self.contactInfo.lastName!;
                self.lblPhone.text = (self.contactInfo.phoneNumber != nil) ? self.contactInfo.phoneNumber! : ""
                self.lblMail.text = (self.contactInfo.email != nil) ? self.contactInfo.email! : ""
                self.imgFavourite.image = self.contactInfo.isFavorite ? UIImage(named: FAVOURITE_FILL_ICON) : UIImage(named:FAVOURITE_ICON)
            } else {
                
                self.showAlertMessageWithoutHandler(" ",error?.localizedDescription);
            }
        })
    }
    
    /**
     * Summary: btnFavouritePressed
     * This method is called on user tapping favourite button
     *
     * @param $sender: favourite button.
     *
     * @return:
     */
    @IBAction func btnFavouritePressed(_ sender: UIButton) {
        
        activityLoader.startAnimating();
        let contactAddPresenter : CMContactDetailPresenter = CMContactDetailPresenter.sharedInstance;
        contactAddPresenter.updateContactInfo(contactInfo, !contactInfo.isFavorite ,completion:{
            (responseObject: Any?, error : Error?) in
            
            self.activityLoader.stopAnimating();
            self.imgFavourite.image = self.contactInfo.isFavorite ? UIImage(named: FAVOURITE_FILL_ICON) : UIImage(named:FAVOURITE_ICON)
            
            if(error == nil &&
                self.contactInfoDelgate != nil) {
                
                self.contactInfoDelgate?.coreDataRefreshed();
            } else {
                
                self.showAlertMessageWithoutHandler(" ",error?.localizedDescription);
            }
            
        })
    }
    
    /**
     * Summary: btnPhonePressed
     * This method is called on user tapping phone button
     *
     * @param $sender: phone button.
     *
     * @return:
     */
    @IBAction func btnPhonePressed(_ sender: UIButton) {
        
        if (contactInfo.phoneNumber != nil &&
            (contactInfo.phoneNumber?.characters.count)! > 0) {
            let phone = "tel://" + contactInfo.phoneNumber!;
            let url:NSURL = NSURL(string:phone)!;
            if(!UIApplication.shared.openURL(url as URL)) {
                
                self.showAlertMessageWithoutHandler(" ",ERROR_CALL_NOT_SUPPORTED);
            }
        }
    }
    
    /**
     * Summary: btnSharePressed
     * This method is called on user tapping share button
     *
     * @param $sender: share button.
     *
     * @return:
     */
    @IBAction func btnSharePressed(_ sender: AnyObject) {
        
        let name = "Name : " + (contactInfo?.firstName)! + " " + (contactInfo?.lastName)!;
        let phone = "\nPhone Number : " + (contactInfo?.phoneNumber)!
        let email  = "\nEmail : " + (contactInfo?.email)!
        let contactInformation = [name + phone + email]
        let activityController = UIActivityViewController(activityItems: contactInformation, applicationActivities: nil)
        
        activityController.popoverPresentationController?.sourceView = self.view
        self.present(activityController, animated: true, completion: nil)
    }
    
    /**
     * Summary: btnEmailPressed
     * This method is called on user tapping email button
     *
     * @param $sender: email button.
     *
     * @return:
     */
    @IBAction func btnEmailPressed(_ sender: UIButton) {
        
        if (contactInfo.email != nil &&
            (contactInfo.email?.characters.count)! > 0) {
            
            let mailComposeViewController = MFMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                
                mailComposeViewController.setToRecipients([contactInfo.email!])
                
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                
                self.showAlertMessageWithoutHandler(" ",ERROR_EMAIL_NOT_SUPPORTED);
            }
        }
    }
    
    
}
