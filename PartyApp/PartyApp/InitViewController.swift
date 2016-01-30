//
//  InitViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit

class InitViewController: UIViewController {

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
        
        // Create the host button and handle action
        let hostButton:UIButton = UIButton(frame: CGRectMake(0,height/2,width,height/2))
        hostButton.backgroundColor = UIColor.whiteColor()
        hostButton.setTitle("Host Party", forState: UIControlState.Normal)
        hostButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        hostButton.titleLabel!.font =  UIFont(name: (hostButton.titleLabel!.font?.fontName)!, size: 60)
        hostButton.addTarget(self, action: "hostButtonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(hostButton)
        
        
    }
    
    func joinButtonAction(sender:UIButton) {
        let mapViewControllerObejct = self.storyboard?.instantiateViewControllerWithIdentifier("joinPartyViewController") as? JoinPartyViewController
        self.navigationController?.pushViewController(mapViewControllerObejct!, animated: true)
        
    }
    
    func hostButtonAction(sender:UIButton) {
        let vc:UIViewController = storyboard!.instantiateViewControllerWithIdentifier("hostPartyViewController") as! SecondViewController
        presentViewController(vc, animated: true, completion: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Shows the navigation bar when another view is shown
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    // Hides the navigation bar when this view is shown
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
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
