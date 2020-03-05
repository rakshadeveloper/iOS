//
//  ViewController.swift
//  GestureRecognigers
//
//  Created by Raksha Singh on 04/03/20.
//  Copyright © 2020 Raksha Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tap Gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
        view.addGestureRecognizer(tap)
        tap.numberOfTapsRequired = 1
        
        // Pinch Gesture
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(pinch:)))
        view.addGestureRecognizer(pinch)
        
        // Rotation Gesture
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(gesture:)))
        view.addGestureRecognizer(rotation)
    }
    
    // Random Colour Generator
    func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
    
    // Tap Gesture
    @objc func handleTap(tap: UITapGestureRecognizer) {

        guard tap.view != nil else { return }
        
        if tap.state == .ended {

            view.backgroundColor = random()
        }
    }
    
    // Pinch Gesture
    @objc func handlePinch(pinch: UIPinchGestureRecognizer) {
        guard pinch.view != nil else { return }
        
        if pinch.state == .began || pinch.state == .changed {
            pinch.view?.transform = (pinch.view?.transform.scaledBy(x: pinch.scale, y: pinch.scale))!
            pinch.scale = 1.0
        }
    }
    
    // Pan Gesture
    @IBAction func handlePan(_ gesture: UIPanGestureRecognizer) {
      // 1
      let translation = gesture.translation(in: view)

      // 2
      guard let gestureView = gesture.view else {
        return
      }

      gestureView.center = CGPoint(
        x: gestureView.center.x + translation.x,
        y: gestureView.center.y + translation.y
      )

      // 3
      gesture.setTranslation(.zero, in: view)
    }
    
    // Rotayion Gesture
    @objc func handleRotation(gesture: UIRotationGestureRecognizer) {
        guard let gestureView = gesture.view else {
          return
        }

        gestureView.transform = gestureView.transform.rotated(
          by: gesture.rotation
        )
        gesture.rotation = 0
    }


}

