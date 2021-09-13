//
//  DisplayFruitsViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 13.09.2021.
//

import UIKit


protocol DisplayFruitsTableControllerDelegate: AnyObject {
     
    func fruitDidSelect(fruit: String)
    
    
}

class DisplayFruitsTableController: UITableViewController {
    
    
    let fruits = ["Авокадо", "Банан", "Яблоко", "Апельсин"]

    
    // Delegate
    weak var delegate: DisplayFruitsTableControllerDelegate?
    
    // Closure
    var fruitSelect: ((String)->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fruits.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = fruits[indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fruit = fruits[indexPath.row]
        delegate?.fruitDidSelect(fruit: fruit)
        fruitSelect?(fruit)
        
        navigationController?.popViewController(animated: true)
    }
}
