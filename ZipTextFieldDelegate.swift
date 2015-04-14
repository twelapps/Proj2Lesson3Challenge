//
//  ZipTextFieldDelegate.swift
//  Proj2Lesson3Challenge
//
//  Created by Twelker on Apr/14/15.
//  Copyright (c) 2015 Twelker. All rights reserved.
//

import Foundation
import UIKit

class ZipTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String ) -> Bool {
        // Figure out what the new text will be, if we return true
        var newText: NSString = textField.text // This is the text before I typed a new character
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        if newText.length > 5 {
            return false // 6th digit that was typed is not allowed
        } else {
            return true
        }
        
    }
    
}


