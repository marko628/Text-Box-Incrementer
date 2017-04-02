//
//  ViewController.swift
//  Text Box Incrementer
//
//  Created by Mark Nolte on 11/13/16.
//  Copyright © 2016 Mark Nolte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var amountField: UITextField!
  @IBOutlet weak var stepper: UIStepper!
  @IBOutlet weak var stepperValue: UILabel!
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    print("stepper changed. value is \(stepper.value)")
    
    if let formattedValue = format(stepper.value) {
      amountField.text = formattedValue
      stepperValue.text = formattedValue
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let formattedValue = format(stepper.value) {
      print("formatted value is \(formattedValue)")
      amountField.text = formattedValue
      stepperValue.text = formattedValue
    }

    amountField.delegate = self
  }
  
  func format(_ number: Double) -> String? {
    let formatter = NumberFormatter()
    
    formatter.maximumFractionDigits = 2
    formatter.minimumFractionDigits = 0
    formatter.minimumIntegerDigits = 1
    
    if let formattedValue = formatter.string(from: stepper.value as NSNumber) {
      return formattedValue
    } else {
      return nil
    }
    
  }
  
  // MARK: Text Field Delegates
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    print("in textFieldDidEndEditing()")
    // set field to formatted stepper value if field was left blank or has more than 
    // two decimal places after editing
    textField.text = format(stepper.value)
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    print("in textFieldShouldEndEditing()")
    return true
  }
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("in textFieldShouldBeginEditing()")
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    print("in textField(_:shouldChangeCharactersIn:replacementString:). String before replacement is \(textField.text). Replacement string is \(string). Range is \(range.location) \(range.length).")
    
    let before = textField.text as NSString?
    let after = before?.replacingCharacters(in: range, with: string)
    print("text after replacement is \(after)")
    
    // allows field to be blank temporarily while user is editing
    guard after?.characters.count != 0 else {
      return true
    }
    
    if let amount = Double(after!) {
      print("amount is a Double: \(amount)")
      stepper.value = amount
      let formattedAmount = format(amount)!
      //stepper.value = Double(formattedAmount)!
      stepperValue.text = formattedAmount
      print("stepper amount is now \(stepper.value)")
    } else {
      print("text field can't be converted to Double: \(after!)")
      return false
    }
    return true
  }
}
