//
//  WebView.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 11/4/20.
//

import UIKit
import WebKit

class WebView: UIViewController, WKUIDelegate {
    
    var url = "https://www.apple.com"
    @IBOutlet var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
