//
//  ViewController.swift
//  Quote-Creator
//
//  Created by Tim Ng on 10/31/18.
//  Copyright © 2018 Learn Swift HK. All rights reserved.
//

import UIKit

class QuoteTableVC: UIViewController {
//-----------------------------------------------------------
    // MARK: Properties
    var quotes = [String]()
    @IBOutlet var favoriteQuotesTable: UITableView!
//-----------------------------------------------------------
    // MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called!")
        
        // Inject the Singleton AppDelegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        quotes = appDelegate.quotes
        
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

extension QuoteTableVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell") as! UITableViewCell
        cell.textLabel?.text = quotes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}


