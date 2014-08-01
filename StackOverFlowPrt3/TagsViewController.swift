//
//  TagsViewController.swift
//  StackOverFlowPrt3
//
//  Created by Victor  Adu on 7/31/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class TagsViewController: UIViewController {

    
    @IBOutlet weak var tableTagView: UITableView!
    
    var tags = [Tags]?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.tableTagView.reloadData()
    }
    
//MARK: UITableViewDataSource
    
   func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        if self.tags {
            return tags!.count
        }
        return 0
    }
      
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Tags", forIndexPath: indexPath) as UITableViewCell
        
        let tag = tags![indexPath.row]
        
        cell.textLabel.text = tag.name
        
        return cell
        
    }
    
    /*
    networkController.downloadListOfTags(
    {(tags: [Tags]?, errorDescription: String?) -> Void in
    
    tagsVC.tags = tags
    
    NSOperationQueue.mainQueue().addOperationWithBlock(
    {() -> Void in
    
    //                        tagsVC.tableView.reloadData()
    self.navigationController.pushViewController(tagsVC, animated: true)
    
    })
    })  */
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
