//
//  UIImageExtension.swift
//  MovieKe
//
//  Created by Kunwar on 12/30/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImageFromURL(urlString: NSString) {
        
        //get image from local storage
        if let data = FileManager.readDataWithURL(urlString) {
            self.image = UIImage(data: data)
        }
        else {//get image from server
            let url = NSURL(string: urlString)!
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                
                if let data = NSData(contentsOfURL : url) {
                    dispatch_async(dispatch_get_main_queue()) {
                        FileManager.writeData(data, withURL: urlString)
                        let image = UIImage(data : data)
                        self.image = image
                    }
                }
            }

        }
        
    }
    
    
}