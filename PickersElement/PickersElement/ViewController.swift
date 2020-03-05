//
//  ViewController.swift
//  PickersElement
//
//  Created by Raksha Singh on 03/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    var activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView()
    var BatteryLevel: Float = 0.0
    var brightnessLevel = UIScreen.main.brightness
    
    let colorArray = [UIColor.red, UIColor.green, UIColor.blue, UIColor.orange, UIColor.yellow, UIColor.purple, UIColor.gray, UIColor.systemPink]
    
    let Foods = ["Apples", "Bananas", "Corn", "Beans", "Tomatoes","Apricot","Blackberry","Blackcurrant","Blueberry","Mandarin","Pineapple","Pomegranate","Raspberry"]
    
    let WeekDays = ["", "Sunday", "Monday", "Tuesday", "Wensday", "Thrustday","Friday", "Suterday"]
    
    @IBOutlet weak var stepperOutlet: UIStepper!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var pickerViewOutlet: UIPickerView!
    @IBOutlet weak var dateOutlet: UILabel!
    @IBOutlet weak var foodListOutlet: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var progressOutlet: UIProgressView!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    @IBOutlet weak var pickerOutlet: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Slider Showing Device Brightness Level
        sliderOutlet.value = Float(brightnessLevel)
        
        // Stepper Showing Count on + and - with some colour
        stepperOutlet.maximumValue = Double(Int(colorArray.count))
        
        // Progress Bar Showing device battery level
        BatteryLevel = UIDevice.current.batteryLevel * (-100)
        progressOutlet.progress = 10
        progressOutlet.progressViewStyle = UIProgressView.Style.bar
    }
    
// Switch Action
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        else {
           view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
// Slider Action
    @IBAction func sliderAction(_ sender: UISlider) {
        brightnessLevel = CGFloat(sender.value)
        UIScreen.main.brightness = CGFloat(sender.value)
    }

// Stepper Action
    @IBAction func stepperAction(_ sender: UIStepper) {
        
        let stepperCount = Int(sender.value)
        stepperOutlet.backgroundColor = colorArray[stepperCount]
    }

// PickerView Data Source and Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Foods.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Foods[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        foodListOutlet.text = Foods[row]
    }
    
// Hide Unhide UIElements
    func Hide() {
        sliderOutlet.isHidden = true
        switchOutlet.isHidden = true
        progressOutlet.isHidden = true
        stepperOutlet.isHidden = true
        datePickerOutlet.isHidden = true
        pickerOutlet.isHidden = true
        dateOutlet.isHidden = true
        foodListOutlet.isHidden = true
        
    }
    
    func Unhide() {
        sliderOutlet.isHidden = false
        switchOutlet.isHidden = false
        progressOutlet.isHidden = false
        stepperOutlet.isHidden = false
        datePickerOutlet.isHidden = false
        pickerOutlet.isHidden = false
        dateOutlet.isHidden = false
        foodListOutlet.isHidden = false
    }
    
// Activity Indicator Button to Perfom Action
    @IBAction func start(_ sender: AnyObject)
    {
        Hide()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        view.addSubview(activityIndicator)
        activityIndicator.color = UIColor.red
        activityIndicator.startAnimating()
//        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    @IBAction func stop(_ sender: AnyObject)
    {
        Unhide()
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    @IBAction func selectDateAction(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day, .weekday], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year , let weekDay = components.weekday {
            print("\(day) \(month) \(year) \(weekDay)")
            dateOutlet.text = "\(WeekDays[weekDay]) : \(day) : \(month) : \(year)"
        }
    }
}

