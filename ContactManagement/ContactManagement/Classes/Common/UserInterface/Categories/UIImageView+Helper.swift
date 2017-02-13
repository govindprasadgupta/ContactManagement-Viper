/**
 *  UIImageView+Helper.swift
 *  ContactManagement
 *  Purpose: This category class is implemented for UIImageView.
 *
 *  Created by Govind Gupta on 12/27/16.
 *  Copyright (c) 2016 Govind Gupta. All rights reserved.
 */

import UIKit
import SDWebImage

extension UIImageView {

 
    /**
     * Summary: setImageFor
     * This method is used to set imgae using SDwebcache library
     *
     * @param $imageLink: image url.
     * @param $placeholder: place holder image name.
     *
     * @return:
     */
    func setImageFor(_ imageLink:String?, with placeholder:String?)  {
        
        if(imageLink != nil) {
            
            let imageURL : NSURL = NSURL(string: imageLink!)!;
            let placeholderImage  : UIImage = UIImage(named:placeholder!)!;
            self.sd_setImage(with: imageURL as URL, placeholderImage: placeholderImage)
        }
    }

}
