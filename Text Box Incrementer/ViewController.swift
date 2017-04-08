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
    updateWithFormattedStepperValue()
  }
  
  @IBAction func stepperEditingChanged(_ sender: UIStepper) {
    print("in stepperEditingChanged")
  }
  
  @IBAction func amountFieldEditingChanged(_ sender: UITextField) {
    print("in amountFieldEditingChanged")
    //stepperValue.text = amountField.text
  }
  
  @IBAction func amountFieldEditingDidEnd(_ sender: UITextField) {
    print("in amountFieldEditingDidEnd")
    stepperValue.text = amountField.text
  }
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureFormatter()
    updateWithFormattedStepperValue()

    delegate.stepper = stepper
    delegate.formatter = formatter
    amountField.delegate = delegate
    
    print("delegate is \(amountField.delegate)")
  }
  
  func configureFormatter() {
    formatter.maximumFractionDigits = 5
    formatter.minimumFractionDigits = 2
    formatter.minimumIntegerDigits = 1
  }
  
  func updateWithFormattedStepperValue() {
    if let formattedValue = formatter.string(from: stepper.value as NSNumber) {
      print("formatted value is \(formattedValue)")
      amountField.text = formattedValue
      stepperValue.text = formattedValue
    }
  }
}
