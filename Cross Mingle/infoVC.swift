//
//  ViewController.swift
//  Go Mingle
//
//  Created by Geemakun Storey on 2015-09-18.
//  Copyright (c) 2015 Storey Inc. All rights reserved.
//

import UIKit

class infoVC: UIViewController {
    
    // Label and ImageView outlets
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mainPicture: UIImageView!


    ///// Gives Nav Bar Back Button No Text //////////////
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain,target:nil, action:nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

