//
//  ViewController.swift
//  justtestdelete
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
    
    
    @IBOutlet weak var setCounterLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButtonLabel: UIButton!
    @IBOutlet weak var resetButtonLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func startButtonPressed(sender: AnyObject)
    {
        
    }

    @IBAction func resetButtonPressed(sender: AnyObject)
    {
        
    }
}

