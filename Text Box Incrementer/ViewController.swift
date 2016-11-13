//
//  ViewController.swift
//  Text Box Incrementer
//
//  Created by Mark Nolte on 11/13/16.
//  Copyright © 2016 Mark Nolte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
  @IBOutlet weak var amountField: UITextField!
  @IBOutlet weak var stepper: UIStepper!
  @IBOutlet weak var stepperValue: UILabel!
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    print("stepper pressed. value is \(stepper.value)")
    amountField.text = String(describing: stepper.value)
    stepperValue.text = String(describing: stepper.value)
  }
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    amountField.text = String(describing: stepper.value)
    stepperValue.text = String(describing: stepper.value)
    
  }


}

