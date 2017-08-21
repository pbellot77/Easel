//
//  ViewController.swift
//  Easel
//
//  Created by Patrick Bellot on 8/21/17.
//  Copyright © 2017 Polestar Interactive LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var buttonStackView: UIStackView!
  @IBOutlet weak var imageView: UIImageView!
  
  var lastPoint = CGPoint.zero
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(ViewController.appBecameActive), name: NSNotification.Name.UIApplicationDidBecomeActive , object: nil)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.navigationController?.navigationBar.isHidden = true
  }
  
  func appBecameActive() {
    self.buttonStackView.isHidden = false
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      let point = touch.location(in: self.imageView)
      self.lastPoint = point
    }
    
    self.buttonStackView.isHidden = true
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let touch = touches.first {
      let point = touch.location(in: self.imageView)
      print(point)
    }
    
    UIGraphicsBeginImageContext(self.imageView.frame.size)
    let context = UIGraphicsGetCurrentContext()
    
    self.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.imageView.frame.size.width, height: self.imageView.frame.size.height))
    
//    CGContext.move(context, self.lastPoint.x, self.lastPoint.y) // Depricated Context roadblock
    
    UIGraphicsEndImageContext()
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.buttonStackView.isHidden = false
    print("Ended")
  }


} // End of class
