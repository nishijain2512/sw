//
//  AddNewTime.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 11/11/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit
import CoreData

class AddNewTime: UIViewController {

    var timerDuration = NSString()

    @IBOutlet var descField: UITextField!
    @IBOutlet var duration: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var time: UILabel!
    
    var managedObjectContext: NSManagedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    
    @IBAction func savePressed(sender: UIBarButtonItem) {
        
        if (descField.text.isEmpty){
            
            var alert = UIAlertController(title: "Alert", message: "Description field cannot be empty", preferredStyle: UIAlertControllerStyle.Alert)
            var OK = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler:{(action: UIAlertAction!) in println("OK") })
            alert.addAction(OK)
            presentViewController(alert, animated: true, completion: nil)
            
        }else{
            
            var newEntity = NSEntityDescription.insertNewObjectForEntityForName("Data", inManagedObjectContext: managedObjectContext) as Data
            newEntity.date = date.text!
            newEntity.details = descField.text
            newEntity.duration = duration.text!
            newEntity.time = time.text!
            
            managedObjectContext.save(nil)
            
            /*let fetchRequest = NSFetchRequest(entityName: "Data")
            var results = managedObjectContext.executeFetchRequest(fetchRequest, error: nil)
            for result in results!
            {
                println(result)
                println(result.valueForKey("duration"))
                println(result.valueForKey("details"))
                
            }*/
            
            self.navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        duration.text = timerDuration
        
        // Calculate current date & time
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        /*
        let currentDate = NSDate()
        let formattedDateString = dateFormatter.stringFromDate(currentDate)
        date.text = formattedDateString
        */
        
        let currentDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitSecond | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay, fromDate: currentDate)
        let hour = components.hour
        let minutes = components.minute
        let seconds = components.second
        let month = components.month
        let year = components.year
        let day = components.day
        
        time.text = "\(hour):\(minutes):\(seconds)"
        date.text = "\(month)/\(day)/\(year)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
