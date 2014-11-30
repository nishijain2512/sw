//
//  AddNewTime.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 11/11/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit
//import CoreData

class AddNewTime: UIViewController {

    var timerDuration = NSString()

    @IBOutlet var descField: UITextField!
    @IBOutlet var duration: UILabel!
    @IBOutlet var dateTime: UILabel!
    
    @IBAction func savePressed(sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        duration.text = timerDuration
        
        // Calculate current date & time
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        
        let currentDate = NSDate()
        let formattedDateString = dateFormatter.stringFromDate(currentDate)
        dateTime.text = formattedDateString
        
        
        // Do any additional setup after loading the view.
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
