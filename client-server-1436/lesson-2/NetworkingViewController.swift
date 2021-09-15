//
//  NetworkingViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 14.09.2021.
//

import UIKit
import Alamofire

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        secondRequest()
    }
    
    func firstRequest() {
        
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            print(json)
        }
        
        task.resume()
    }
    
    func secondRequest() {
        
        let baseURL = "http://samples.openweathermap.org"
        
        let path = "/data/2.5/forecast"
        
        let url = "\(baseURL)\(path)"
        var urlParameters: Parameters = [
            "q": "Moscow,DE",
            "appid": "b1b15e88fa797225412429c1c50c122a1"
        ]
        
        AF.request(url, method: .get, parameters: urlParameters).responseJSON { response in
            
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
        }
    }
    
    func thirdRequest() {
        
    }

}
