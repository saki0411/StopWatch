//
//  ViewController.swift
//  StopWatch
//
//  Created by saki on 2022/10/30.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//aaaaaaaa
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
        }
    }


}

