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
    amountField.text = String(describing: stepper.value)
    stepperValue.text = String(describing: stepper.value)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    amountField.text = String(describing: stepper.value)
    stepperValue.text = String(describing: stepper.value)
    
    amountField.delegate = self
    
    
  }
  
  // MARK: Text Field Delegates
  func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    
    print("in textFieldDidEndEditing()")

  }
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    print("in textFieldShouldBeginEditing()")
    return true
  }
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    let myString = textField.text as NSString?
    
    if let amount = Double((myString?.replacingCharacters(in: range, with: string))!) {
      print("amount is a Double: \(amount)")
      //amountField.text = String(amount)
      stepper.value = amount
      stepperValue.text = String(stepper.value)
      print("stepper amount is now \(stepper.value)")
    } else {
      print("text field can't be converted to Double: \(textField.text)")
    }
    
    return true
    
  }


}

