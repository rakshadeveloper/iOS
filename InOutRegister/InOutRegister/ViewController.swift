//
//  ViewController.swift
//  InOutRegister
//
//  Created by Raksha.Singh on 11/8/19.
//  Copyright © 2019 Raksha.Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    let defaults = UserDefaults.standard
    var inTime = [String]()
    var outTime = [String]()
//    let date = NSDate()
//    let calendar = NSCalendar.current
//    let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute, fromDate: date)
//    let hour = components.hour
//    let minutes = components.minute
    @IBOutlet weak var lbInDateOutDateOutlet: UILabel!
    @IBOutlet weak var btOutOutlet: UIButton!
    @IBOutlet weak var btInOutlet: UIButton!
    @IBOutlet weak var btShowRegisterOutlet: UIButton!
    @IBAction func btShowRegisterButton(_ sender: Any) {
        performSegue(withIdentifier: "ShowRegister", sender: self)
    }
    @IBAction func btInButton(_ sender: Any) {
        inTime.append(GetCurrentDateTime())
    }
    @IBAction func btOutButton(_ sender: Any) {
//        print(inTime)
        outTime.append(GetCurrentDateTime())

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btInOutlet.layer.cornerRadius = 50
        self.btOutOutlet.layer.cornerRadius = 50
        self.btShowRegisterOutlet.layer.cornerRadius = 28
        lbInDateOutDateOutlet.text = GetCurrentDateTime()
    }
    func GetCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM, dd, yyyy  HH:MM"
        let currentDate = formatter.string(from: Date())
        return currentDate
    }
    
//    func SeperateDate (){
//        let date = Date()
//        let calander = Calendar.current
//        let year = Calendar.Component(from: date)
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVCIn = segue.destination as! ShowRegisterViewController
        let detailVCOut = segue.destination as! ShowRegisterViewController
        detailVCIn.inTimeShow = inTime
        detailVCOut.outTimeShow = outTime
    }


}

