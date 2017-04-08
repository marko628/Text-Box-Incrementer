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
  
  let delegate = TextFieldWithStepper()
  let formatter = NumberFormatter()
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    print("stepper changed. value is \(stepper.value)")
    
    if let formattedValue = format(stepper.value) {
      amountField.text = formattedValue
      stepperValue.text = formattedValue
    }
  }
  
  @IBAction func stepperEditingChanged(_ sender: UIStepper) {
    print("in stepperEditingChanged")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureFormatter()
    
    if let formattedValue = format(stepper.value) {
      print("formatted value is \(formattedValue)")
      amountField.text = formattedValue
      stepperValue.text = formattedValue
    }

    delegate.stepper = stepper
    delegate.formatter = formatter
    amountField.delegate = delegate
    print("delegate is \(amountField.delegate)")
  }
  
  func format(_ number: Double) -> String? {
    if let formattedValue = formatter.string(from: stepper.value as NSNumber) {
      return formattedValue
    } else {
      return nil
    }
  }
  
  func configureFormatter() {
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 0
    formatter.minimumIntegerDigits = 1
  }
  
}
