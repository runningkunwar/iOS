//
//  FileManager.swift
//  MovieKe
//
//  Created by Kunwar on 12/30/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import Foundation

class FileManager {
    
    class func writeData(data: NSData, withURL url: NSString) {
        var  paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var directory = paths[0] as String
        
        if let fileName = self.fileNameFromURL(url) {
            let filePath = directory + "/" + fileName
            data.writeToFile(filePath, atomically: true)
        }

    }
    
    class func readDataWithURL(url: String) -> NSData? {
        var data: NSData?
        var  paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var directory = paths[0] as String
        
        if let fileName = self.fileNameFromURL(url) {
            let filePath = directory + "/" + fileName
            data = NSData(contentsOfFile: filePath)
        }
        
        return data
    }
    
    class func fileNameFromURL(url: String) -> String? {
        
        var parts = url.componentsSeparatedByString("/")
        
        return parts.last
    }
    
}