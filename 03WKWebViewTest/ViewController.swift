//
//  ViewController.swift
//  03WKWebViewTest
//
//  Created by 김종현 on 19/09/2019.
//  Copyright © 2019 김종현. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    //var request : URLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBar.delegate = self
        webView.navigationDelegate = self
        
        let request = URLRequest(url: URL(string: "http://www.naver.com")!)
        webView.load(request)
        
        backButton.isEnabled = self.webView.canGoBack
        forwardButton.isEnabled = self.webView.canGoForward
        
        indicator.isHidden = true
        
    }
    
    
    // UISearchBarDelegate 메소드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        print("Search Bar Cliecked!!!")
        let input = searchBar.text
        print(input!)
        let request = URLRequest(url: URL(string: input!)!)
        webView.load(request)
        
    }
    
    @IBAction func backAction(_ sender: Any) {
        
        if self.webView.canGoBack {
            self.webView.goBack()
        }
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        self.webView.reload()
    }
    
    @IBAction func forwardAction(_ sender: Any) {
        if self.webView.canGoForward {
            self.webView.goForward()
        }
    }
    
    // WKNagationDelegate Method
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        backButton.isEnabled = self.webView.canGoBack
        forwardButton.isEnabled = self.webView.canGoForward
        
        indicator.stopAnimating()
        indicator.isHidden = true
    }

}

