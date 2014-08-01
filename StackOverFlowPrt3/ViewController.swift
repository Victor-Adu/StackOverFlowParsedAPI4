//
//  ViewController.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    var questions : [Question]?
    
    @IBOutlet weak var tableView: UITableView!
    
    let networkController = NetworkController()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44      //'estimatedRowHeight' is recommended but not required
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
     
    }
    
    //MARK: UITableViewDatasource
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.questions {
            return self.questions!.count }
        return 0
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("QuestionCell", forIndexPath: indexPath) as CellForQuestion
        let question = self.questions![indexPath.row] as Question
        cell.textView.scrollEnabled = false
        cell.textView.text = question.title
        return cell
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return false
    }
    
    
    
    //MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    //MARK: SearchBar
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        
        println("Question SearchBar Clicked")
        let searchTerm = searchBar.text
        searchBar.resignFirstResponder()
       
        self.networkController.fetchQuestionsForSearchTerm(searchTerm, callback: {(questions: [Question]?, errorDescription: String?) -> Void in
                
                self.questions = questions
                errorDescription == nil
                
                NSOperationQueue.mainQueue().addOperationWithBlock (
                    {() -> Void in
                        self.tableView.reloadData()
                    })
            })
        
        
    }
    
}

