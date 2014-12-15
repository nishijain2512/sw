//
//  MainPage.swift
//  Simply StopWatch
//
//  Created by Nishi Jain on 11/10/14.
//  Copyright (c) 2014 Nishi Jain. All rights reserved.
//

import UIKit
import CoreData

class MainPage: UIViewController {
    
    var timeCounter: Int = 0
    var milliseconds: Int = 0
    var seconds: Int = 0
    var minutes: Int = 0
    var hours: Int = 0
    var timerDisplayValue = NSString()
    
    var timer = NSTimer()

    //@IBOutlet var timerDisplay: UILabel!
    @IBOutlet var hourLabel: UILabel!
    @IBOutlet var minuteLabel: UILabel!
    @IBOutlet var secondsLabel: UILabel!
    @IBOutlet var millisecLabel: UILabel!
    @IBOutlet var resetButton: UIBarButtonItem!
    @IBOutlet var playButton: UIBarButtonItem!
    @IBOutlet var stopButton: UIBarButtonItem!
    @IBOutlet var saveButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopButton.enabled = false
        playButton.enabled = true
        resetButton.enabled = true
        saveButton.enabled = false
    }
    
    @IBAction func startPressed(sender: UIBarButtonItem) {
        playButton.enabled = false
        resetButton.enabled = false
        stopButton.enabled = true
        saveButton.enabled = false
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1/100, target: self, selector: Selector("timeCalculator"), userInfo: nil, repeats: true)
        
    }
    
    func timeCalculator(){
        
        timeCounter++
        
        milliseconds = timeCounter
        seconds = Int(milliseconds/100)
        minutes = Int(seconds/60)
        hours = Int(minutes/60)
        
        var minutesCalculation = minutes - (hours * 60)
        var secondsCalculation = seconds - (minutes * 60)
        var millisecondsCalculation = milliseconds - (seconds * 100)
        
        if(hours > 0){
            hourLabel.text = "\(doubleDigitFormatter(hours)):"
        }
        if(minutes > 0){
            minuteLabel.text = "\(doubleDigitFormatter(minutesCalculation)):"
        }
        if(seconds > 0){
            secondsLabel.text = "\(doubleDigitFormatter(secondsCalculation))."
        }
        if(milliseconds > 0){
            millisecLabel.text = "\(doubleDigitFormatter(millisecondsCalculation))"
        }
        
        timerDisplayValue = "\(doubleDigitFormatter(hours)):\(doubleDigitFormatter(minutesCalculation)):\(doubleDigitFormatter(secondsCalculation)).\(doubleDigitFormatter(millisecondsCalculation))"
        
    }
    
    func doubleDigitFormatter(input:Int) -> String {
        if input < 10 {
            return("0\(input)")
        } else {
            return("\(input)")
        }
        
    }

    
    @IBAction func resetPressed(sender: UIBarButtonItem) {
        
        //timerDisplay.text = "00:00:00.00"
        hourLabel.text = "00:"
        minuteLabel.text = "00:"
        secondsLabel.text = "00."
        millisecLabel.text = "00"
        timeCounter = 0
        playButton.enabled = true
        resetButton.enabled = false
        stopButton.enabled = false
        saveButton.enabled = false

    }
    
    @IBAction func stopPressed(sender: UIBarButtonItem) {
        playButton.enabled = true
        resetButton.enabled = true
        stopButton.enabled = false
        saveButton.enabled = true
        timer.invalidate()
    }
    
    @IBAction func savePressed(sender: UIBarButtonItem) {
        println("Save is Pressed")
    }
    
    @IBAction func recordsPressed(sender: UIBarButtonItem) {
        println("Records is Pressed")

    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "toAddNewTimePage"){
            let destination: AddNewTime = segue.destinationViewController as AddNewTime
            destination.timerDuration = timerDisplayValue
        
        }else if(segue.identifier == "toDataPage"){
            let destination: DataPage = segue.destinationViewController as DataPage
        }
    }


}
