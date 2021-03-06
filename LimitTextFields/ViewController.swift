//
//  ViewController.swift
//  LimitTextFields
//
//  Created by Moment Inc. on 22/11/15.
//  Copyright © 2015 fatihyildizhan. All rights reserved.
//

import UIKit

// TODO: add keyboard show/hide support

class ViewController: UIViewController {
  
  let maxWidth:CGFloat = 200
  let maxCount:Int = 20
  
  @IBOutlet weak var textField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // set the delegate
    textField.delegate = self
  }
}

extension ViewController:UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
    // to allow backspace when limit exceeds
    if (string.count == 0 && range.length == 1) {
      return true
    }
    
    // you should check for the specific textfield or these conditions will apply for all of them
    // don't forget to set delegate.
    if textField.isEqual(self.textField) {
        let width:CGFloat = textField.intrinsicContentSize.width
      let currentText:String = textField.text ?? ""
      print("width:\(width) - count:\(currentText.count)")
      
      if width >= maxWidth {
        print("width-limit is exceeded")
        return false
      }
      
      if currentText.count >= maxCount {
        print("count-limit is exceeded.")
        return false
      }
    }
    return true
  }
}
