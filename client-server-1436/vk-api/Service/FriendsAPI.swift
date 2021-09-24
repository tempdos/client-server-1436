//
//  FriendsAPI.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 24.09.2021.
//

import Foundation
import Alamofire

struct User {
    
}

final class GroupsAPI {
    
}

final class PhotosAPI {
    
}

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = Session.shared.userId
    let version = "5.21"
    
    func getFriends(completion: @escaping([User]?)->()) {
        
        let method = "/friends.get"
        let parameters: Parameters = [
            "user_id": userId,
            "order": "name",
            "count": 1000,
            "fields": "photo_100, photo_50",
            "access_token": Session.shared.token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { response in
            print(response.result)
        }
    }
}
