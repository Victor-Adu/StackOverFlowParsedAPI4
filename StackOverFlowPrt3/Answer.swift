//
//  Answer.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class Answer: NSObject {
    
    var user_type: String?
    var answerCount: Int?
    var questionID: Int?
    var isAnswered: Bool?
    var link : NSURL?
    
    init(itemDictAns : NSDictionary) {
        self.user_type = itemDictAns["user_type"] as? String
        self.questionID = itemDictAns["question_id"] as? Int
        self.answerCount = itemDictAns["answer_count"] as? Int
        self.isAnswered = itemDictAns["is_accepted"] as? Bool
        self.link = itemDictAns["link"] as? NSURL
        
        }
   
}
