//
//  ViewController.swift
//  Quote-Creator
//
//  Created by Tim Ng on 10/31/18.
//  Copyright © 2018 Learn Swift HK. All rights reserved.
//

import UIKit

class QuoteTableVC: UITableViewController {
//-----------------------------------------------------------
    // MARK: Properties
    var quotes = [String]()
    @IBOutlet var favoriteQuotesTable: UITableView!
//-----------------------------------------------------------
    // MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called!")
        
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called!")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        quotes = appDelegate.quotes
        favoriteQuotesTable.reloadData()
        
    }
//-----------------------------------------------------------
    // MARK: Actions
    @IBAction func addQuote(_ sender: Any) {
      let addQuoteVC = storyboard?.instantiateViewController(withIdentifier: "AddQuoteVC") as! UIViewController
        navigationController?.pushViewController(addQuoteVC, animated: true)
        
    }
    

//-----------------------------------------------------------
    
    

}


