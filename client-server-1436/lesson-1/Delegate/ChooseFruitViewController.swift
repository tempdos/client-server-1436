//
//  ChooseFruiteViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 13.09.2021.
//

import UIKit

class ChooseFruitViewController: UIViewController, DisplayFruitsTableControllerDelegate {
     
    
    @IBOutlet var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Delegate
    func fruitDidSelect(fruit: String) {
//        fruitLabel.text = fruit
    }
    
    @IBAction func chooseFruitAction(_ sender: Any) {
        
        let displayFruitsVC = DisplayFruitsTableController()
        displayFruitsVC.delegate = self
        
        // Closure
        displayFruitsVC.fruitSelect = { [weak self] fruit in
            self?.fruitLabel.text = fruit
        }
        
        navigationController?.pushViewController(displayFruitsVC, animated: true )
    }
    
}
