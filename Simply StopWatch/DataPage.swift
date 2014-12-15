//
//  DataPage.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 11/11/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit
import CoreData

class DataPage: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet var dataTable: UITableView!

    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    var fetchedResultsController: NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultsController = fetchData()
        fetchedResultsController.delegate = self
        fetchedResultsController.performFetch(nil)
        
        // To remove the extra scape above table cells
        self.automaticallyAdjustsScrollViewInsets = false


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchData() -> NSFetchedResultsController{
        
        let fetchRequest = NSFetchRequest(entityName: "Data")
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: "date", cacheName: nil)
        
        return fetchedResultsController
    }
    
    
    //------------------UITableViewDataSource---------------
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.fetchedResultsController.sections?.count ?? 0
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        return sectionInfo.numberOfObjects
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
                
        cell.textLabel?.text = fetchedResultsController.objectAtIndexPath(indexPath).valueForKey("details") as NSString
        cell.detailTextLabel?.text = fetchedResultsController.objectAtIndexPath(indexPath).valueForKey("duration") as NSString
        */
        
        let cell: DataPageTableCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as DataPageTableCellTableViewCell
        
        cell.descLabel.text = fetchedResultsController.objectAtIndexPath(indexPath).valueForKey("details") as NSString
        cell.timeLabel.text = fetchedResultsController.objectAtIndexPath(indexPath).valueForKey("time") as NSString
        cell.durationLabel.text = fetchedResultsController.objectAtIndexPath(indexPath).valueForKey("duration") as NSString
        
        return cell
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        
        if(fetchedResultsController.sections?.count > 0){
            var sectionInfo: NSFetchedResultsSectionInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
            return sectionInfo.name
            
        } else{
            return nil
        }
    }
    
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool{
        return true
    }
    
    
    // Delete row (while using NSFetchedResultsController, delete only managedObject)Deleting the managed object triggers the NSFetchResultController delegate methods, and they will update the tableView. All changes must come from there and your table only reflects them.
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!){
        if( editingStyle == UITableViewCellEditingStyle.Delete){
            let objectToBeDeleted: NSManagedObject = fetchedResultsController.objectAtIndexPath(indexPath) as NSManagedObject
            managedObjectContext.deleteObject(objectToBeDeleted)
            managedObjectContext.save(nil)
            
        }
    }
    
    //--------------------------------------------------------------------------------------------------------

    
    // -----------------------MARK: - NSFetchedResultsControllerDelegate--------------------------------------
    
    func controllerWillChangeContent(controller: NSFetchedResultsController!){
        dataTable.beginUpdates()
    }
    
    
    func controller(controller: NSFetchedResultsController!, didChangeObject anObject: AnyObject!, atIndexPath indexPath: NSIndexPath!, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath!){
        switch(type){
        case .Delete:
            dataTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        default:
            println("Inside didChangeObject")
        }
    }
    
    //To delete section, must implement this method
    func controller(controller: NSFetchedResultsController!, didChangeSection sectionInfo: NSFetchedResultsSectionInfo!, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch(type){
        case .Delete:
            dataTable.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
        default:
            println("Inside didChangeSection")
            
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        dataTable.endUpdates()
    }
    //--------------------------------------------------------------------------------------------------------



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

