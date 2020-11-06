//
//  File.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 11/5/20.
//

import UIKit
import WebKit

class RegistrationWebView: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet var webView: WKWebView!
    
    var url = "https://www.vote.org/am-i-registered-to-vote/"
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
