//
//  venmo handling.swift
//  PartyApp
//
//  Created by The bumblebee on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import Foundation
import VENCore
import UIKit

class VenmoHandling: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        // Do any additional setup after loading the view.
        
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        
        
        // Create the join button and handle action
        let joinButton:UIButton = UIButton(frame: CGRectMake(0,0,width,height/2))
        joinButton.backgroundColor = UIColor.blackColor()
        joinButton.setTitle("Join Party", forState: UIControlState.Normal)
        joinButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        joinButton.titleLabel!.font =  UIFont(name: (joinButton.titleLabel!.font?.fontName)!, size: 60)
        joinButton.addTarget(self, action: "joinButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(joinButton)
    };
}