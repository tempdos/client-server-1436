//
//  DisplayFriendsViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 15.09.2021.
//

import UIKit

class DisplayFriendsViewController: UITableViewController {
    
    let friendsAPI = FriendsAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsAPI.getFriends { users in
//            self.friends = users
//            tableView.reload
        }
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
