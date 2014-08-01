//
//  NetworkController.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import Foundation


class NetworkController {
    
    let apiDomain = "http://api.stackexchange.com/2.2"
    let searchEndpoint = "/search?order=desc&sort=activity&site=stackoverflow"
    let answerEndpoint = "/answers?order=desc&sort=activity&site=stackoverflow"
    let tagsEndpoint = "/tags?order=desc&sort=popular&site=stackoverflow"
    
    func parseSuccessfulResponse(responseData : NSData) -> [Question]{
        var questions = [Question]()
        if let responseDict = NSJSONSerialization.JSONObjectWithData(responseData, options: nil, error: nil) as? NSDictionary {
            
            if let items = responseDict["items"] as? NSArray {
                for item in items {
                    if let itemDictI = item as? NSDictionary {
                        let question = Question(itemDict: itemDictI)
                        questions += question
                    }
                }
            }
        }
        return questions
    }
    


    /*
    func fetchQuestionsFromSampleData(callback : (questions : [Question]?, errorDescription : String?) -> Void) {
        let sampleData = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource("SampleResponse", ofType: "json"))
        var questions = self.parseSuccessfulResponse(sampleData)
        callback(questions: questions, errorDescription: nil)
    }      */
    
    func fetchQuestionsForSearchTerm(searchTerm : String, callback : (questions : [Question]?, errorDescription : String?) -> Void) {
        
        var url = NSURL(string: apiDomain + searchEndpoint + "&tagged=\(searchTerm)")
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let task = session.dataTaskWithURL(url, completionHandler: { (data : NSData!,response : NSURLResponse!, error :  NSError!) -> Void in
            
            if error {
                //checking for a general error
                //execute callback, passing an error description and no questions
                callback(questions: nil, errorDescription: "Hey sorry! try again next time")
                return
            }
            else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                      var successfulQuestionResponse =  self.parseSuccessfulResponse(data)
                        callback(questions: successfulQuestionResponse, errorDescription: nil)
                        
                    case 400:
                        println("not found")
                        callback(questions: nil, errorDescription: "Bad Parameters: Error in fetching data")
                    case 401:
                        callback(questions: nil, errorDescription: "Unauthorized: Authentication is required")
                    case 403:
                        callback(questions: nil, errorDescription: "Forbidden: Request was valid, but server refuses to respond")
                    case 404:
                        callback(questions: nil, errorDescription: "Not found: Requested resource not found")
                    case 500:
                        callback(questions: nil, errorDescription: "Error in fetching data. Try again next time")
                    default:
                        callback(questions: nil, errorDescription: "Request Error. Try again next time")
                        
                        
                    }
                }
                
            }
            
            })
        task.resume()
    }
    
    
    //Fetching JSON Answer Data
    
    //function to iterate through Answers API
    
    func parseSuccessfulResponseAns(responseData : NSData) -> [Answer]{
        var answers = [Answer]()
        if let responseDictAns = NSJSONSerialization.JSONObjectWithData(responseData, options: nil, error: nil) as? NSDictionary {
            
            if let items = responseDictAns["items"] as? NSArray {
                for item in items {
                    if let itemDictAnsI = item as? NSDictionary {
                        let answer = Answer(itemDictAns: itemDictAnsI)
                        answers += answer
                    }
                }
            }
        }
        return answers
    }
    
    func fetchAnswersForSearchTerm(searchTerm : String, callback : (answers : [Answer]?, errorDescription : String?) -> Void) {
        
        var urlAns = NSURL(string: apiDomain + searchEndpoint + "&tagged=\(searchTerm)")
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let taskAnswer = session.dataTaskWithURL(urlAns, completionHandler: { (data : NSData!,response : NSURLResponse!, error :  NSError!) -> Void in
            
            if error {
                //checking for a general error
                //execute callback, passing an error description and no questions
                callback(answers: nil, errorDescription: "Hey sorry! try again next time")
                return
            }
            else {
                if let httpResponse = response as? NSHTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                
                        var successfulAnswerResponse =  self.parseSuccessfulResponseAns(data)
                        callback(answers: successfulAnswerResponse, errorDescription: nil)
                        
                    case 400:
                        println("not found")
                        callback(answers: nil, errorDescription: "Bad Parameters: Error in fetching data")
                    case 401:
                        callback(answers: nil, errorDescription: "Unauthorized: Authentication is required")
                    case 403:
                        callback(answers: nil, errorDescription: "Forbidden: Request was valid, but server refuses to respond")
                    case 404:
                        callback(answers: nil, errorDescription: "Not found: Requested resource not found")
                    case 500:
                        callback(answers: nil, errorDescription: "Error in fetching data. Try again next time")
                    default:
                        callback(answers: nil, errorDescription: "Request Error. Try again next time")
                        
                        
                    }
                }
                
            }
            
            })
        taskAnswer.resume()
    } 
   
    // Fetch Tags Data
    
    func parseResponseTags(tagsData: NSData) -> [Tags] {
        var tags = [Tags]()
        
        if let tagsDict = NSJSONSerialization.JSONObjectWithData(tagsData, options: nil, error: nil) as? NSDictionary {
            
            if let items = tagsDict["items"] as? NSArray {
                for item in items {
                    if let itemDict = item as? NSDictionary {
                        let tag = Tags(itemDict: itemDict)
                        tags += tag
                    }
                }
            }
            
        }
        return tags
    }
    
    
    func fetchListOfTags(callback: (tags: [Tags]?, errorDescription: String?) -> Void) {
        
        //Calling the Tags url on a single line.
            let urlTags = NSURL(string: "http://api.stackexchange.com//2.2/tags?order=desc&sort=popular&site=stackoverflow")
        
        let request = NSURLRequest(URL: urlTags)
        
        let session = NSURLSession.sharedSession()
      
        /* A variation below. Same like we've been using to fetch 'Question' and 'Answer' data.
         var urlTags = NSURL(string: apiDomain + tagsEndpoint + "&tagged=\(searchTerm)")
        
        let request = NSURLRequest(URL: urlTags)
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    */

        
        let tagsData = session.dataTaskWithRequest(request, completionHandler: {(data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            
            if let httpResponse = response as? NSHTTPURLResponse {
                switch httpResponse.statusCode {
                case 200:
                    
                    var successfulTagsResponse =  self.parseResponseTags(data)
                    callback(tags: successfulTagsResponse, errorDescription: nil)
                    
                case 400:
                    println("not found")
                    callback(tags: nil, errorDescription: "Bad Parameters: Error in fetching data")
                case 401:
                    callback(tags: nil, errorDescription: "Unauthorized: Authentication is required")
                case 403:
                    callback(tags: nil, errorDescription: "Forbidden: Request was valid, but server refuses to respond")
                case 404:
                    callback(tags: nil, errorDescription: "Not found: Requested resource not found")
                case 500:
                    callback(tags: nil, errorDescription: "Error in fetching data. Try again next time")
                default:
                    callback(tags: nil, errorDescription: "Request Error. Try again next time")
                    
                    
                }
            }
            
        })
        
        tagsData.resume()
    }


}
