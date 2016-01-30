//
//  JoinPartyViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit

class JoinPartyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        
        // Create the party keycode Textfield
        let partyKeyCodeTextField = UITextField(frame: CGRectMake(10.0, 50.0, width-20, 44.0))
        partyKeyCodeTextField.placeholder = "Keyword"
        partyKeyCodeTextField.layer.cornerRadius = 8.0
        partyKeyCodeTextField.layer.masksToBounds = true
        self.view.addSubview(partyKeyCodeTextField)
        
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
