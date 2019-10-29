//
//  ViewController.swift
//  FlashLight
//
//  Created by Raksha.Singh on 10/29/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn {
            toggleTorch(on: true)
            print("On")
            self.view.backgroundColor = UIColor.white
        }
        else {
            toggleTorch(on: false)
            print("Off")
            self.view.backgroundColor = UIColor.black
        }

    }
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

