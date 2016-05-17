//
//  MasterViewController.swift
//  Anaesthesia For Obstetrics
//
//  Created by Programming on 16/09/15.
//  Copyright © 2015 Programming. All rights reserved.
//

import Foundation
import UIKit

class MasterViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    //List all your sections there
    let headerTitles = ["Header 1", "Header 2"]
    
    //List all the parts of your sections there
    let firstPart = ["Introduction", "Chapter 2"]
    
    let secondPart = ["Chapter 3", "Chapter 4"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 68.0
        tableView.rowHeight = UITableViewAutomaticDimension
   
    }

    //how many sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headerTitles.count
    }
    
    //function for how many rows per sections
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount = 0
        if section == 0 {
        
            rowCount = firstPart.count
            
        }
        if section == 1 {
        
            rowCount =  secondPart.count
            
        }
        
        return rowCount
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ChapterCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ChapterCell

        //Enter the names of the sections here
        var chapters:[[String]] =  [firstPart, secondPart]
        
        cell.chapterName?.sizeToFit()
        cell.chapterName?.text = chapters[indexPath.section][indexPath.row]
        cell.chapterName?.numberOfLines = 0
        cell.chapterName?.font = UIFont(name:"Avenir", size:17)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var chapters:[[String]] =  [firstPart, secondPart]
        
        if segue.identifier == "showDetail" {
            let UInav:UINavigationController = segue.destinationViewController as! UINavigationController
            let detailVC:DetailViewController = UInav.topViewController as! DetailViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            let thisTitle = chapters[indexPath.section][indexPath.row]
            detailVC.titleFromSummary = thisTitle
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showDetail", sender: indexPath)
        
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    
    
}