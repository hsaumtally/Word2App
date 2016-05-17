//
//  ViewController.swift
//  Anaesthesia For Obstetrics
//
//  Created by Programming on 16/09/15.
//  Copyright © 2015 Programming. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {
    
    var titleFromSummary: String = "Introduction"
    
    @IBOutlet var menuButton: UIBarButtonItem!
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = titleFromSummary
        
        self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir", size: 20)!]
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
            self.title = titleFromSummary
                
            let localfilePath = NSBundle.mainBundle().URLForResource(titleFromSummary, withExtension: "htm");
            print(titleFromSummary)
            print (localfilePath)
            let myRequest = NSURLRequest(URL: localfilePath!);
            webView.loadRequest(myRequest);
            self.view.addSubview(webView)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        switch navigationType {
        case .LinkClicked:
            // Open links in Safari
            UIApplication.sharedApplication().openURL(request.URL!)
            return false
        default:
            // Handle other navigation types...
            return true
        }
        
    }

}

