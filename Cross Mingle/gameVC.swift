//
//  ViewController.swift
//  Cross Mingle
//
//  Created by Geemakun Storey on 2015-09-18.
//  Copyright (c) 2015 Storey Inc. All rights reserved.
//

import UIKit
import AddressBookUI

class gameVC: UIViewController, ABNewPersonViewControllerDelegate {
    
    // Label outlets
    @IBOutlet var messageLabel: UILabel!
    
    // Button outlets
    @IBOutlet var sureButton: UIButton!
    @IBOutlet var noThanks: UIButton!
    @IBOutlet var refreshButton: UIButton!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var nopeButton: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!

    // Nav Bar Outlet
    @IBOutlet var navBar: UINavigationItem!
    
    
    ///////////////////////// First Choice Action ////////////////////////////
    
    @IBAction func firstAction(sender: AnyObject) {
        sureButton.hidden = false
        noThanks.hidden = false
        secondButton.hidden = true
        firstButton.hidden = true
        thirdButton.hidden = true
        messageLabel.text = "Put your number in my phone?"
        messageLabel.hidden = false
    }
    

    
 ///////////////////////// Second Choice Action ////////////////////////////
    
    @IBAction func secondAction(sender: AnyObject) {
        firstButton.hidden = true
        secondButton.hidden = true
        thirdButton.hidden = true
        nopeButton.hidden = false
        yesButton.hidden = false
        messageLabel.hidden = false
        messageLabel.text = "Are you single?"
        
    }

    
    ///////////////////////// Third Choice Action ////////////////////////////
    
   
    @IBAction func thirdAction(sender: AnyObject) {
        sureButton.hidden = false
        noThanks.hidden = false
        firstButton.hidden = true
        secondButton.hidden = true
        thirdButton.hidden = true
        messageLabel.hidden = false
        messageLabel.text = "Will you go on a date with me?"
    }
    


    
    ////// Nope! Button Action
    
    
    @IBAction func nopeAction(sender: UIButton) {
        nopeButton.hidden = true
        messageLabel.text = "😔"
        refreshButton.hidden = false
        yesButton.hidden = true
        navigationController?.navigationBarHidden = false
        
    }
    
    
////// Yes Button Action
    
    
    @IBAction func yesButtonAction(sender: UIButton) {
        sureButton.hidden = false
        yesButton.hidden = true
        messageLabel.text = "Want to be friends?"
    }
    
// Sure Button Action - Contacts List 
    

    @IBAction func sureAction(sender: AnyObject) {
        let controller = ABNewPersonViewController()
        controller.newPersonViewDelegate = self
        let navigationControllerAdd = UINavigationController(rootViewController: controller)
        self.presentViewController(navigationControllerAdd, animated: true, completion: nil)
        navigationController?.navigationBarHidden = false
        refreshButton.hidden = false
        nopeButton.hidden = true 
        sureButton.hidden = true
        
    }
    func newPersonViewController(newPersonView: ABNewPersonViewController, didCompleteWithNewPerson person: ABRecord?) {
        newPersonView.navigationController?.dismissViewControllerAnimated(true, completion: nil);
        
    }
    
    // Reject Button Action
    
    @IBAction func rejectedAction(sender: UIButton) {
        noThanks.hidden = true
        messageLabel.text = "😔"
        refreshButton.hidden = false
        sureButton.hidden = true
        yesButton.hidden = true
        navigationController?.navigationBarHidden = false
        
    }
    
    // Resets Page back to default start
    
    @IBAction func resetAction(sender: UIButton) {
        navigationController?.navigationBarHidden = false
        messageLabel.hidden = true
        sureButton.hidden = true
        noThanks.hidden = true
        refreshButton.hidden = true
        nopeButton.hidden = true
        yesButton.hidden = true
        firstButton.hidden = false
        secondButton.hidden = false
        thirdButton.hidden = false
        }
    
    ///// Gives Nav Bar Back Button No Text //////////////
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.hidden = true
        sureButton.hidden = true
        noThanks.hidden = true
        refreshButton.hidden = true
        yesButton.hidden = true
        nopeButton.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

