//
//  ViewController.swift
//  LocalNotification
//
//  Created by Raksha Singh on 13/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Asked for permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in
        })
        
        let content = UNMutableNotificationContent()
        content.title = "Notification Alert"
        content.subtitle = "Need To Check App"
        content.body = "Check The Updates"
        content.sound = UNNotificationSound.defaultCritical
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timerDone", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    


}

