//
//  ViewController.swift
//  EggTimer
//
//  Created by Osagie Omonzokpia on 7/13/17.
//  Copyright © 2017 Dreammesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    var counter:Int = 210
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func playButton(_ sender: Any) {
        /*
         timeInterval = Delay interval
         target = Current/this UIViewController
         selector = function to run at time interval
         userInfo = send any info with the timer
         repeats = run forever or run once
         */
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pauseBtn(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func addToCounter(_ sender: Any) {
        // Increase timer counter by 10
        if counter <= 200 {
            counter = counter + 10
            
            setLabelText()
        }
    }
    
    @IBAction func minusFromCounter(_ sender: Any) {
        // Decrease timer counter by 10
        if counter >= 10 {
            counter = counter - 10
            
            setLabelText()
        }
    }
    
    @IBAction func resetCounter(_ sender: Any) {
        // Reset timer counter to 210
        
        counter = 210
        
        setLabelText()
    }
    
    
    func processTimer() {
        if counter > 0 {
            counter -= 1
        
            setLabelText()
        } else {
            timer.invalidate()
        }
    }
    
    func setLabelText() {
        counterLabel.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setLabelText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

