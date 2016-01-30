//
//  JoinPartyViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit
import TextFieldEffects

class JoinPartyViewController: UIViewController {
    
    let confirmButton = UIButton()
    let keywordTF = UITextField()
    let height = UIScreen.mainScreen().bounds.height
    let width = UIScreen.mainScreen().bounds.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the background
        let bgButton:UIButton = UIButton(frame: CGRectMake(0,0,width,height))
        bgButton.backgroundColor = UIColor.blackColor()
        self.view.addSubview(bgButton)
        
        // Create the party keyword Textfield
        keywordTF.frame = CGRectMake(10.0, 0.4*height, width-20, 0.2*height)
        let atr = [
            NSForegroundColorAttributeName: UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "Helvetica Neue", size: 64)!
        ]
        keywordTF.attributedPlaceholder = NSAttributedString(string: "Keyword", attributes:atr)
        keywordTF.textColor = UIColor.whiteColor()
        keywordTF.font = UIFont(name: "Helvetica Neue", size: 64)
        keywordTF.layer.cornerRadius = 8.0
        keywordTF.layer.masksToBounds = true
        keywordTF.addTarget(self, action: "handleKeywordChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.view.addSubview(keywordTF)
        
        // Create the confirm button
        confirmButton.frame = CGRectMake(0,height,width,0.2*height)
        confirmButton.backgroundColor = UIColor.whiteColor()
        confirmButton.setTitle("Confirm", forState: UIControlState.Normal)
        confirmButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        confirmButton.titleLabel!.font =  UIFont(name: (confirmButton.titleLabel!.font?.fontName)!, size: 32)
        confirmButton.addTarget(self, action: "confirmButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(confirmButton)
        
        
    }
    
    // When the keyword textfield is not empty, the button moves into the view, and moves out of
    // the view when it is empty.
    func handleKeywordChange(sender:UITextField) {
        if sender.text == "" {
            UIView.animateWithDuration(0.5, animations:{
                self.confirmButton.frame = CGRectMake(0, self.height, self.width, 0.2*self.height)
            })
        }
        else {
            UIView.animateWithDuration(0.5, animations:{
                self.confirmButton.frame = CGRectMake(0, 0.8*self.height, self.width, 0.2*self.height) })
        }
    }
    
    // Handles the user pressing the confirm button
    func confirmButtonAction(sender:UIButton) {
        if self.keywordTF.text == "" {
            // do nothing because the user tried tapping the button while it was disappearing
        }
        else {
            findParty(self.keywordTF.text!)
        }
    }
    
    // Should retrieve a party and go to the party view
    func findParty(keyword:String) {
        //
        // use location
        //
        // Handle keyword entrance, find party
        //
        //
        //    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
