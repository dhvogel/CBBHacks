//
//  ViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/29/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit
import TextFieldEffects

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        
        /*
        let button:UIButton = UIButton(frame: CGRectMake(100, 100, 100, 200))
        button.setTitle("My Button", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        self.view.addSubview(button)
        */
        
        //Create the party title Textfield
        let partyTitleTextField = HoshiTextField(frame: CGRectMake(10.0, 50.0, width-20, 44.0))
        partyTitleTextField.placeholder = "Party Title"
        //partyTitleTextField.layer.cornerRadius = 8.0
        partyTitleTextField.layer.masksToBounds = true
        self.view.addSubview(partyTitleTextField)
        
        //Create the theme TextField
        let themeTitleTextField = UITextField(frame: CGRectMake(10.0, 100.0, width-20, 44.0))
        themeTitleTextField.placeholder = "Party Title"
        //themeTitleTextField.layer.cornerRadius = 8.0
        themeTitleTextField.layer.masksToBounds = true
        themeTitleTextField.layer.borderColor = UIColor.blackColor().CGColor
        themeTitleTextField.layer.borderWidth = 1
        self.view.addSubview(themeTitleTextField)
        
        let button:UIButton = UIButton(frame: CGRectMake(100,100,100,100))
        button.backgroundColor = UIColor.blackColor()
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        
    }
    
    func buttonAction(sender:UIButton) {
        let vc:UIViewController = storyboard!.instantiateViewControllerWithIdentifier("SecondVC") as! SecondViewController
        presentViewController(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

