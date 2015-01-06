//
//  DataDetails.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 12/14/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit

class DataDetails: UIViewController, DescriptionDelegate {

    var data: Data? = nil
    
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var DescData: UILabel!
    @IBOutlet var durationData: UILabel!
    @IBOutlet var dateData: UILabel!
    @IBOutlet var timeData: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  To make the page scroll
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width, 1000)
        //----------------------------
        DescData.text = data?.details
        durationData.text = data?.duration
        dateData.text = data?.date
        timeData.text = data?.time
        
        // To add width constraint for content view
        
        //contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(rightConstraint)
        
        //------------------------------
        
        println(scrollView)
    }
    
    func updatedDescription(description: NSString){
        DescData.text = description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "editData"){
            let destination: AddNewTime = segue.destinationViewController as AddNewTime
            destination.data = data
            
            //Store reference to this view controller to the delegate of destination view controller
            destination.delegate = self
            
        }
    }


}
