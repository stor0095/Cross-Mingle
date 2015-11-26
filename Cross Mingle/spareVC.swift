//
//  ViewController.swift
//  Go Mingle
//
//  Created by Geemakun Storey on 2015-09-18.
//  Copyright (c) 2015 Storey Inc. All rights reserved.
//

import UIKit

class spareVC: UIViewController {
    
    // WebView Outlet
    
    @IBOutlet var webView: UIWebView!
    
    // Loads Request for youtube video
    
    var url = "https://www.youtube.com/watch?v=1mRM1VwUiYA"
    
    func loadURL () {
        let requestURL = NSURL(string: url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
    }
    
    ///// Gives Nav Bar Back Button No Text //////////////
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

