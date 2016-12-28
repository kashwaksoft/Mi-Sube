//
//  ChangelogViewController.swift
//  Mi SUBE
//
//  Created by Mariano Molina on 1/26/16.
//  Copyright © 2016 Hernan Matias Coppola. All rights reserved.
//

import UIKit

class ChangelogViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var changesWebview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        changesWebview.delegate = self
        
        let url = URL(string: "http://misube.com/changelog.html")
        let requestObj = URLRequest(url: url!)
        changesWebview.loadRequest(requestObj)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url: URL = request.url!
        let isExternalLink: Bool = url.scheme == "http" || url.scheme == "https" || url.scheme == "mailto"
        if (isExternalLink && navigationType == UIWebViewNavigationType.linkClicked) {
            return !UIApplication.shared.openURL(request.url!)
        } else {
            return true
        }
    }
}
