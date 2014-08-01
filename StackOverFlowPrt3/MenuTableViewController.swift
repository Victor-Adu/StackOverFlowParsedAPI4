//
//  MenuTableViewController.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/30/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//



import UIKit

class MenuTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var options = ["Question Search","Answer Search", "Tags"]
    var detailViewControllers = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //The NSUserDefaults helps us interact with the default system
        NSUserDefaults.standardUserDefaults().synchronize()
        if let imNewUser = NSUserDefaults.standardUserDefaults().valueForKey("newUser") as? Bool {
            println("Not a new user")
        } else{
            println("This is a new user")
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "newUser")
            NSUserDefaults.standardUserDefaults().synchronize()
            println("Wrote to NSUserDefaults")
        }
        
    //Instantiate the VCs

        let answersVC = self.storyboard.instantiateViewControllerWithIdentifier("AnswerVC") as AnswersViewController
        let questionVC = self.storyboard.instantiateViewControllerWithIdentifier("QuestionVC") as ViewController
         let tagsVC = self.storyboard.instantiateViewControllerWithIdentifier("TagsVC") as TagsViewController
        
        detailViewControllers = [questionVC,answersVC, tagsVC]
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.options.count
    }

    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        
        cell.textLabel.text = self.options[indexPath.row]
        return cell
    }


    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        //in here you want tell your splitviewcontroller to show a different view controller
        
        
        //println(indexPath.row)
        
        self.splitViewController.showDetailViewController(self.detailViewControllers[indexPath.row] as UIViewController, sender: self)
     
        
        }


/*     func listOfTags() {

let tagsVC = self.storyboard.instantiateViewControllerWithIdentifier("Tags") as TagsViewController


let networkController = NetworkController()

networkController.fetchListOfTags(
{(tags: [Tags]?, errorDescription: String?) -> Void in

tagsVC.tags = tags

NSOperationQueue.mainQueue().addOperationWithBlock(
{() -> Void in

//                        tagsVC.tableView.reloadData()
self.navigationController.pushViewController(tagsVC, animated: true)

})
})
} */

/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}


