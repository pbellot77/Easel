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
    print("Began")
    self.buttonStackView.isHidden = true
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    print("Moved")
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.buttonStackView.isHidden = false
    print("Ended")
  }


} // End of class
