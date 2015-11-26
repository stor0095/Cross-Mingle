//
//  ViewController.swift
//  Go Mingle
//
//  Created by Geemakun Storey on 2015-09-18.
//  Copyright (c) 2015 Storey Inc. All rights reserved.
//

import UIKit
import AddressBookUI

class gameVC: UIViewController, ABNewPersonViewControllerDelegate {
    
    // Label outlets
    
    @IBOutlet var friendsLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    
    // Switch outlets
    
    @IBOutlet var firstSwitchG: UISwitch!
    @IBOutlet var secondSwitch: UISwitch!
    @IBOutlet var thirdSwitch: UISwitch!
    
    // Button outlets
    
    @IBOutlet var playButton: UIButton!
    @IBOutlet var sureButton: UIButton!
    @IBOutlet var noThanks: UIButton!
    @IBOutlet var refreshButton: UIButton!
    @IBOutlet var yesButton: UIButton!

    // Nav Bar Outlet
    
    @IBOutlet var navBar: UINavigationItem!
    
    
    ///////////////////////// First Switch Action ////////////////////////////
    
    
    @IBAction func firstSwitchAction(sender: UISwitch) {
        if firstSwitchG.on {
            playButton.hidden = false
            secondSwitch.hidden = true
            thirdSwitch.hidden = true
            secondSwitch.hidden = true
            dateLabel.hidden = true
            phoneLabel.hidden = true
            messageLabel.text = "Put your number in my phone?"
        }
        else {
            playButton.hidden = true
            secondSwitch.hidden = false
            thirdSwitch.hidden = false
            secondSwitch.hidden = false
            dateLabel.hidden = false
            phoneLabel.hidden = false
            messageLabel.text = " "
            
        }
    }
    
 ///////////////////////// Second Switch Action ////////////////////////////
    
    @IBAction func sndAction(sender: UISwitch) {
        if secondSwitch.on {
            playButton.hidden = false
            firstSwitchG.hidden = true
            thirdSwitch.hidden = true
            friendsLabel.hidden = true
            phoneLabel.hidden = true
            messageLabel.text = "Will you go on a date with me?"
        }
        else {
            playButton.hidden = true
            firstSwitchG.hidden = false
            thirdSwitch.hidden = false
            secondSwitch.hidden = false
            friendsLabel.hidden = false
            phoneLabel.hidden = false
            messageLabel.text = ""
        }
        
    }
    
    ///////////////////////// Third Switch Action ////////////////////////////
    
    @IBAction func thirdAction(sender: UISwitch) {
        if thirdSwitch.on {
            playButton.hidden = false
            firstSwitchG.hidden = true
            secondSwitch.hidden = true
            friendsLabel.hidden = true
            dateLabel.hidden = true
            messageLabel.text = "Are you single?"
        }
        else {
            playButton.hidden = true
            firstSwitchG.hidden = false
            secondSwitch.hidden = false
            friendsLabel.hidden = false
            dateLabel.hidden = false
            messageLabel.text = " "
        }
    }
    
 ////// Play Button Action
    
    @IBAction func playAction(sender: UIButton) {
        playButton.hidden = true
        firstSwitchG.hidden = true
        secondSwitch.hidden = true
        thirdSwitch.hidden = true
        friendsLabel.hidden = true
        dateLabel.hidden = true
        phoneLabel.hidden = true
        navigationController?.navigationBarHidden = true
        
        messageLabel.hidden = false
        noThanks.hidden = false
        
        if thirdSwitch.on {
            yesButton.hidden = false
        }
        else {
            yesButton.hidden = true
            sureButton.hidden = false
        }
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
        noThanks.hidden = true
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
    
    // Reset Button Action
    
    @IBAction func resetAction(sender: UIButton) {
        navigationController?.navigationBarHidden = false
        playButton.hidden = true
        messageLabel.hidden = true
        sureButton.hidden = true
        noThanks.hidden = true
        refreshButton.hidden = true
        
        firstSwitchG.hidden = false
        secondSwitch.hidden = false
        thirdSwitch.hidden = false
        friendsLabel.hidden = false
        dateLabel.hidden = false
        phoneLabel.hidden = false
        yesButton.hidden = true
        
        firstSwitchG.on = false
        secondSwitch.on = false
        thirdSwitch.on = false
        
     
        
        
    }
    
    ///// Gives Nav Bar Back Button No Text //////////////
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.Plain, target:nil, action:nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.hidden = true
        messageLabel.hidden = true
        sureButton.hidden = true
        noThanks.hidden = true
        refreshButton.hidden = true
        yesButton.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

