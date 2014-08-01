//
//  Tags.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/31/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class Tags: NSObject {
    
    var count: Int?
    var name: String?
    
    init(itemDict: NSDictionary) {
        self.name = itemDict.objectForKey("name") as? String
        self.count = itemDict.objectForKey("count") as? Int
    }
   
}
