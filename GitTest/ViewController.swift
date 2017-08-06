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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var loadTimer: Timer!
    var disappearTimer: Timer!
    
    var prog: Float = 0.0 {
        didSet {
            progressBar.setProgress(prog, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prog = 0.0
    }

    @IBAction func buttonPressed(_ sender: Any) {
        loadTimer?.invalidate()
        prog = 0.0
        activityIndicator.isHidden = false
        
        loadTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(incrementProgress), userInfo: nil, repeats: true)
    }
    
    func incrementProgress() {
        prog += 0.1
        
        if prog >= 1.0 {
            loadTimer.invalidate()
            disappearTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideLoading), userInfo: nil, repeats: false)
        }
    }
    
    func hideLoading() {
        UIView.animate(withDuration: 0.2, animations: { [unowned self] in
                self.progressBar.alpha = CGFloat(0.0)
            }, completion: { [unowned self] _ in
                self.progressBar.progress = 0.0
                self.prog = 0.0
                self.progressBar.alpha = CGFloat(1.0)
                self.activityIndicator.isHidden = true
            })
    }

}

