//
//  Session.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 15.09.2021.
//

import Foundation

final class Session {
    
    static let shared = Session()
    
    private init() {}
    
    var token = ""
    var userId = ""
}
