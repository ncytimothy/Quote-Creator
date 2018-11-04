//
//  AddQuoteVC.swift
//  Quote-Creator
//
//  Created by Tim Ng on 11/3/18.
//  Copyright © 2018 Learn Swift HK. All rights reserved.
//

import UIKit

class AddQuoteVC: UIViewController {
    
    //TODO:     1. Build the UITextView UI Interaction when user taps an empty area on screen, other than the UITextView itself
    //TODO:    2. Build the IBAction for the "Add" button for the AddQuoteVC scene
    //TODO:    3. Adjust cells dynamically on QuoteTableVC
    
//--------------------------------------------------------------------------------------------------------------------
    // MARK: Properties
    @IBOutlet weak var textView: UITextView!
    
//--------------------------------------------------------------------------------------------------------------------
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        
        self.navigationItem.title = "Add Quote"
        textView.layer.cornerRadius = 8.0
        textView.layer.borderWidth = 2.0
    
        configureTapGestureRecognizer()
        
    
        
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTextViewPlaceholder()
        
    }
    

    
    
    @IBAction func cancelPressed(_ sender: Any) {
       self.navigationController?.popViewController(animated: true)
    }
    
    
//--------------------------------------------------------------------------------------------------------------------
    // MARK: Helpers
    
    fileprivate func configureTapGestureRecognizer() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func configureTextViewPlaceholder() {
        
        let placeholder = "Enter Your Favorite Quote!"
        textView.text = placeholder
        textView.textColor = UIColor.gray
    }
}
    
    
extension AddQuoteVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor != UIColor.black else { return }
        textView.text = " "
        textView.textColor = UIColor.black
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.hasText else { return }
        
        configureTextViewPlaceholder()
    }
    
    
    
}





