//
//  ViewController.swift
//  SetCount
//
//  Created by Daniel Esposito on 3/11/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    var myTimer = NSTimer()
    var currentDate = NSDate()
    var startDate = NSDate()
    var stopDate = NSDate()
    
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    var currentSetCount : Int = 0
    
    
    
    
    @IBOutlet weak var setCounterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButtonLabel: UIButton!
    @IBOutlet weak var resetButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setCounterLabel.text = "0"
        resetButtonLabel.hidden = true
        
        timerLabel.textAlignment = NSTextAlignment.Justified
        
    }

    
    
    @IBAction func startButtonPressed(sender: AnyObject)
    {

//        let dateStringFormatter = NSDateFormatter()
//        dateStringFormatter.dateFormat = "HH:mm:ss.SSS"
//        
//        let stopString = dateStringFormatter.stringFromDate(stopDate)
//        
//        print("Stop \(stopString)")
        

        // Reduce fontsize if counter reaches 100 to fit in screen
        
        
        if startButtonLabel.titleLabel?.text == "START" {
            
            resetButtonLabel.hidden = false
            
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            
            startButtonLabel.setTitle("NEW SET", forState: UIControlState.Normal)
//            print("Change Button to NEW SET")
            currentSetCount += 1
            setCounterLabel.text = String(currentSetCount)
            
            
        }
        else if startButtonLabel.titleLabel?.text == "NEW SET" {
            
            if currentSetCount >= 99 {
                
                setCounterLabel.font = UIFont(name: setCounterLabel.font.fontName, size: 230)
            }
            
            timer.invalidate()
            
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            
//            startButtonLabel.setTitle("START", forState: UIControlState.Normal)
//            print("Started a New Set")
            currentSetCount += 1
            setCounterLabel.text = String(currentSetCount)
        }
}
    


    @IBAction func resetButtonPressed(sender: AnyObject)
    {
        setCounterLabel.text = "0"
        currentSetCount = 0
        timerLabel.text = "00:00:00"
        startButtonLabel.setTitle("START", forState: UIControlState.Normal)
        resetButtonLabel.hidden = true
        setCounterLabel.font = UIFont(name: setCounterLabel.font.fontName, size: 250)
        timer.invalidate()
        
    }
    
    func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        timerLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
        
    }
    

    
    
}

