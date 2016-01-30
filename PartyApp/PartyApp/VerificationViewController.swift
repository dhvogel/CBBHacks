//
//  VerificationViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit
import Parse

class VerificationViewController: UIViewController {

    var partyDetails:PFObject!
    let buttonlist = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        view.backgroundColor = .whiteColor()
        
        let bwidth = (width-2)/5
        let bheight = (height-64)/5
        
        for i in 0..<25 {
            let b:UIButton = UIButton(frame: CGRectMake(CGFloat(i%5)*bwidth+10, CGFloat(i/5)*bwidth + 64+10, bwidth-20, bwidth-20))
            b.backgroundColor = UIColor.blackColor()
            if i % 2 == 0 {
                b.backgroundColor = UIColor.redColor()
            }
            self.view.addSubview(b)
        }
        
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
