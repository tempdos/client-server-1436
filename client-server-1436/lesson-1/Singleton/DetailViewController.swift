//
//  DetailViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 09.09.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cashLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = Account.shared.name
        cashLabel.text = String(Account.shared.cash)
    }

}
