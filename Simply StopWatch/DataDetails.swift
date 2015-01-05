//
//  DataDetails.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 12/14/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit

class DataDetails: UIViewController {

    var desc = NSString()
    var duration = NSString()
    var date = NSString()
    var time = NSString()
    
    
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
        DescData.text = desc
        durationData.text = duration
        dateData.text = date
        timeData.text = time
        
        // To add width constraint for content view
        
        //contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var leftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(leftConstraint)
        
        var rightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(rightConstraint)
        
        //------------------------------
        
        println(scrollView)
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
