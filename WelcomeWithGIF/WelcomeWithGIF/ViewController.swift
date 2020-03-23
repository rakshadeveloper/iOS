//
//  ViewController.swift
//  WelcomeWithGIF
//
//  Created by Raksha Singh on 18/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webKitView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webKitView.autoresizingMask = .flexibleWidth
        let filePath = Bundle.main.path(forResource:"Mprs8", ofType: "gif")
        let gifData = NSData(contentsOfFile: filePath!)
        self.webKitView.load(gifData! as Data, mimeType: "image/gif", characterEncodingName: String(), baseURL: NSURL() as URL)
    }
}

