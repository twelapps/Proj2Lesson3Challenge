//
//  CashTextFieldDelegate.swift
//  Proj2Lesson3Challenge
//
//  Created by Twelker on Apr/14/15.
//  Copyright (c) 2015 Twelker. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String ) -> Bool {
        // Always allow the next digit; keyboard is numpad
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
//        println(textField.text)
        textField.text = "" // Reset cash field to "" when editing begins
        
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
        // Convert user input - string of digits (number of cents) - to Int
        var cashInt: Int = 0

        if textField.text != "" {
            cashInt = textField.text.toInt()!
//            println("\(textField.text)")
//            println("\(cashInt)")
        }
        
        // Set the new cash field using NSNumberFormatter
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        // formatter.locale = NSLocale.currentLocale() // This is the default
        textField.text = formatter.stringFromNumber(Float(cashInt)/100) // "$x.yz"
//        println("\(textField.text)")
        
        return true
    }
    
}
