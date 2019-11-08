//
//  GameStartViewController.swift
//  ColourGame
//
//  Created by Raksha Singh on 05/11/19.
//  Copyright © 2019 Raksha Singh. All rights reserved.
//

import UIKit

class GameStartViewController: UIViewController {
    @IBOutlet weak var purpleOutlet: UIButton!
    @IBOutlet weak var blackOutlet: UIButton!
    @IBOutlet weak var blueOutlet: UIButton!
    @IBOutlet weak var orangeOutlet: UIButton!
    @IBOutlet weak var yellowOutlet: UIButton!
    @IBOutlet weak var redOutlet: UIButton!
    @IBOutlet weak var brownOutlet: UIButton!
    @IBOutlet weak var greenOutlet: UIButton!
    @IBOutlet weak var lbTimerOutlet: UILabel!
    @IBOutlet weak var lbScoreOutlet: UILabel!
    @IBOutlet weak var viewOutlet: UIView!
    
    let colors = [UIColor.green, UIColor.red, UIColor.orange, UIColor.black, UIColor.blue, UIColor.yellow, UIColor.brown, UIColor.purple]
    var isPressed:Bool = false
    var timer = Timer()
    var score = 0
    var countdownTimer: Timer?
    var totalTime = 60
    
    @IBAction func btPurpleButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.purple == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btBlackButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.black == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btBlueButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.blue == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btYellowButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.yellow == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btGreenButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.green == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btOrangeButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.orange == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btBrownButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.brown == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        }
    }
    @IBAction func btRedButton(_ sender: Any) {
        if viewOutlet.backgroundColor == UIColor.white {
            
        }
        else {
        if UIColor.red == viewOutlet.backgroundColor {
            score += 1
            lbScoreOutlet.text = "\(score)"
            isPressed = true
        }
        else {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
    }
    }
    func buttonNotPressed() {
        if isPressed == false {
            score -= 1
            lbScoreOutlet.text = "\(score)"
        }
        else {
            isPressed = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOutlet.layer.cornerRadius = viewOutlet.frame.size.width / 2
        blueOutlet.layer.cornerRadius = blueOutlet.frame.size.width / 2
        blackOutlet.layer.cornerRadius = blackOutlet.frame.size.width / 2
        orangeOutlet.layer.cornerRadius = orangeOutlet.frame.size.width / 2
        redOutlet.layer.cornerRadius = redOutlet.frame.size.width / 2
        greenOutlet.layer.cornerRadius = greenOutlet.frame.size.width / 2
        brownOutlet.layer.cornerRadius = brownOutlet.frame.size.width / 2
        yellowOutlet.layer.cornerRadius = yellowOutlet.frame.size.width / 2
        purpleOutlet.layer.cornerRadius = purpleOutlet.frame.size.width / 2
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { timer in
            let randomNumber = Int.random(in: 1...60)
            if randomNumber == 60 {
                self.viewOutlet.backgroundColor = UIColor.white
                timer.invalidate()
//                DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
//                    self.viewOutlet.backgroundColor = UIColor.white
//                })
            }
            else {
                self.updateTime()
                self.buttonNotPressed()
            }
            self.viewOutlet.backgroundColor = self.randomColor()
        }
        self.updateTime()
    }
    
    
    func updateTime() {
        lbTimerOutlet.text = "\(timeFormatted(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    func endTimer() {
        timer.invalidate()
        self.viewOutlet.backgroundColor = UIColor.white
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d:%02d", minutes, seconds)
    }
    func randomCGFloat() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
    func randomColor() -> UIColor {
        let randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        return colors[randomColor]
    }
}
