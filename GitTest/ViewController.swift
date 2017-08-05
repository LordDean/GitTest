//
//  ViewController.swift
//  GitTest
//
//  Created by Dean Mollica on 5/8/17.
//  Copyright © 2017 Dean Mollica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer: Timer!
    
    var prog: Float = 0.0 {
        didSet {
            progressBar.setProgress(prog, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        prog = 0.0
        
    }

    @IBAction func buttonPressed(_ sender: Any) {
        
        prog = 0.0
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(incrementProgress), userInfo: nil, repeats: true)
        
    }
    
    func incrementProgress() {
        
        prog += 0.1
        
        if prog >= 1.0 {
            timer.invalidate()
        }
        
    }

}

