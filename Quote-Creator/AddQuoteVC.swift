//
//  AddQuoteVC.swift
//  Quote-Creator
//
//  Created by Tim Ng on 11/3/18.
//  Copyright © 2018 Learn Swift HK. All rights reserved.
//

import UIKit

class AddQuoteVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
    
}


extension AddQuoteVC: UITextViewDelegate {
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.text = " "
        return true
    }
    
}





