//
//  AnswersViewController.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//


import UIKit

class AnswersViewController: UIViewController {
    
    var answers : [Answer]?
    
 
    @IBOutlet weak var tableView1: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
       // self.tableView.dataSource = self
           let networkController = NetworkController()
        
//        self.tableView1.rowHeight = UITableViewAutomaticDimension
//        self.tableView1.estimatedRowHeight = 44            //'estimatedRowHeight' is recommended but not required
      
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
         self.tableView1.reloadData()
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

     func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if self.answers {
            return self.answers!.count }
        return 0
    }


      func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cell2 = tableView.dequeueReusableCellWithIdentifier("AnswerCell", forIndexPath: indexPath) as CellForAnswer
        
        let answer = self.answers![indexPath.row] as Answer
        
        cell2.textView1.scrollEnabled = true
        cell2.textView1.text = answer.user_type
        
        return cell2
        
    }

    //MARK: SearchBar
    
 /*   func searchBarSearchButtonClicked(searchBar: UISearchBar!) {
        println("Answer Searchbar Clicked")
        
        let searchTerm = searchBar.text
        searchBar.resignFirstResponder()
        
        let networkController = NetworkController()
        networkController.fetchAnswersForSearchTerm(searchTerm, callback: {(answers: [Answer]?, errorDescription: String?) -> Void in
        
            self.answers = answers
            errorDescription == nil
            
            NSOperationQueue.mainQueue().addOperationWithBlock (
                {() -> Void in
                    self.tableView1.reloadData()
                })
            })
        
    } */


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
} 

