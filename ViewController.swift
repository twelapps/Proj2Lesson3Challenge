//
//  ViewController.swift
//  Proj2Lesson3Challenge
//
//  Created by Twelker on Apr/13/15.
//  Copyright (c) 2015 Twelker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField1: UITextField! // Keyboard is numberpad !!
    @IBOutlet weak var textField2: UITextField! // Keyboard is numberpad !!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var lockUnlockEditing: UISwitch!
    @IBAction func lockUnlockEditing(sender: UISwitch) {
        if lockUnlockEditing.on {
            // Do nothing
        } else {
            textField3.resignFirstResponder() // End editing of field 3
        }
    }
    
    // Text Field Delegate objects
    let zipTextFieldDelegate = ZipTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textField1.delegate = zipTextFieldDelegate // Will limit user input to max 5 digits
        
        // Initialize field 2, the cash field, using NSNumberFormatter and define delegate
        var cash = 0
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        // formatter.locale = NSLocale.currentLocale() // This is the default
        formatter.stringFromNumber(cash) // "$123.44"
        self.textField2.text = formatter.stringFromNumber(cash) // "$0.00"
        
        self.textField2.delegate = cashTextFieldDelegate // Will return user input as $x.yz
        
        self.textField3.delegate = self
        
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        // Only allow editing if the switch is on
        if lockUnlockEditing.on {
            return true
        } else {
            return false
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String ) -> Bool {
        
        
        // Only allow the next character if the switch is on
        if lockUnlockEditing.on {
            return true
        } else {
            return false
        }
    }

}

