//
//  AuthViewController.swift
//  client-server-1436
//
//  Created by Василий Слепцов on 15.09.2021.
//

import UIKit
import WebKit

class AuthViewController: UIViewController {

    @IBOutlet var webView: WKWebView! {
        didSet{
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func authorizeToVk() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7959374"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        
    }

}

extension AuthViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        guard let token = params["access_token"] else { return }
        
        print(token)
        
        Session.shared.token = token
        
        self.performSegue(withIdentifier: "moveToMain", sender: self)
        
        decisionHandler(.cancel)
    }
}
