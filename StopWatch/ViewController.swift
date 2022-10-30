//
//  ViewController.swift
//  StopWatch
//
//  Created by saki on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var label2: UILabel!
    
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count >= 9.80 && 10.20 >= count{
            label2.text = "PARFECT!"
        }else if count >= 9.70 && 10.30 >= count{
            label2.text = "GREAT"
        }else if count >= 9.50 && 10.50 >= count{
            label2.text = "GOOD"
        }else {
            label2.text = "BAD"
        }
    } 

    
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
        label2.text = ""
    }
    
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if timer.isValid {
            timer.invalidate()
            count = 0
            label.text = String(format: "%.2f", count)
            
        }
    }


}

