//
//  AddNewTime.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 11/11/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit
import CoreData

class AddNewTime: UIViewController, UITextFieldDelegate {

    var timerDuration = NSString()

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
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
        
        // To add width constraint for content view
        
       // contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(rightConstraint)
        
        //------------------------------
        
        //  To make the page scroll
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 1000)
        //----------------------------
        
        descField.becomeFirstResponder()
        duration.text = timerDuration
        
        // Calculate current date & time
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
    
    //To hide keyboard when return key is pressed or screen is tapped (also added protocol UITextFieldDelegate)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        descField.resignFirstResponder()
        return true
    }
   
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    //----------------------------------------------------------------------
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
