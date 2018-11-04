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
        configureTextView()
    
        configureTapGestureRecognizer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTextViewPlaceholder()
        subscribeToKeyboardNotifications()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
    }

//--------------------------------------------------------------------------------------------------------------------
    // MARK: Actions
    

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
    
    fileprivate func configureTextView() {
        textView.layer.cornerRadius = 8.0
        textView.layer.borderWidth = 2.0
    }
    
//--------------------------------------------------------------------------------------------------------------------
    // MARK: Keyboard Methods
    
    // Idea of NSNotifications:
    // When events happen, such as when the keyboard shows, an NSNotification will be posted across the system
    // to the notification center
    
    // To listen for these notifications, we would need an observer
    // We would subscribe to notifications when we need them
    // Unsubscribe when it is no longer needed
    
    // If you know web development, this is similar to Event Listening on JQuery
    
    // TODO: Add observers to subscribe to notifications for .UIKeyboardWillShow and .UIKeyboardWillHide
    // TODO: Configure the behavior of the keyboard when it shows and hides
  
    // 1. Add Observers to subscribe to keyboard notifications
    // When the .UIKeyboardWillShow and .UIKeyboardWillHide notifications are
    // triggered, the keyboardWillShow(_:) and keyboardWillHide(_:) functions
    // are called
    
    // Note that keyboardWillShow(_:) and keyboardWillHide(_:) will take
    // an NSNotification parameter which will be supplied by the observer
    // and triggered by .UIKeyboardWillShow and .UIKeyboardWillHide
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // 2. Remove Observers for .UIKeyboardWillShow and .UIKeyboardWillHide
    // This will be called when the view is going to disappear in
    // viewWillDisappear()

    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // 3. Configure the screen movements when keyboard shows and hides
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if textView.isFirstResponder {
            view.frame.origin.y = -150
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    

//-------------------------------------------------------------------------------------------------------------------
}

//-------------------------------------------------------------------------------------------------------------------
    // MARK: Extension: UITextViewDelegate
extension AddQuoteVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor != UIColor.black else { return }
        textView.text = " "
        textView.textColor = UIColor.black
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        // Guard Staments: We guard based on a condition
       // We always guard the condition that is desirable
        
       // Here when textView hasText, we want to prevent falling thru
      // when textView does NOT have text
      
     // Note that guard will fall thru when the condition is false
        guard textView.hasText else { return }
        
        configureTextViewPlaceholder()
    }
}





