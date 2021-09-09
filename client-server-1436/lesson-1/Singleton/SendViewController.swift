//
//  SendViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 09.09.2021.
//

import UIKit

final class Account {
    
    private init() {}
    
    static let shared = Account()
    
    var name: String = ""
    
    var cash: Int = 0
}

class SendViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var cashTextField: UITextField!
    
    let account = Account.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendCashAction(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let cashString = cashTextField.text, let cash = Int(cashString)
        else {
            return
        }

        account.name = name
        account.cash = cash
    }
}
