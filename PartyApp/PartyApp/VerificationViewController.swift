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
    var buttonlist:[UIButton] = []
    var verifArray:[Int] = []
    var timer:NSTimer?
    var lastChangedButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        view.backgroundColor = .whiteColor()
        
        let bwidth = (width-2)/5
        let bheight = (height-64)/5
        
        // get information about the party that will be the same for everyone attending
        let partyHashed = partyDetails.valueForKey("objectId") as! String!
        
        var alphanum: [String:Int] = [
            "a" : 1,
            "b" : 2,
            "c" : 3,
            "d" : 4,
            "e" : 5,
            "f" : 6,
            "g" : 7,
            "h" : 8,
            "i" : 9,
            "j" : 10,
            "k" : 11,
            "l" : 12,
            "m" : 13,
            "n" : 14,
            "o" : 15,
            "p" : 16,
            "q" : 17,
            "r" : 18,
            "s" : 19,
            "t" : 20,
            "u" : 21,
            "v" : 22,
            "w" : 23,
            "x" : 24,
            "y" : 25,
            "z" : 26
        ]
        
        // turn it into a number
        var hashedCharsList:[Int] = []
        for i in partyHashed.characters {
            //print(i)
            let someString = String(i).lowercaseString
            if let someInt = Int(someString) {
                //print(someInt)
                hashedCharsList.append(someInt)
            }
            else {
                hashedCharsList.append(alphanum[someString]!)
            }
        }
        
        // turn it back into a string because swift
        var verificationGenerator:String = ""
        for i in hashedCharsList {
            verificationGenerator = verificationGenerator + String(i)
        }
        
        // turn it back into a number to seed the random number generator
        srand(UInt32(truncatingBitPattern: Int(verificationGenerator)!))
        // now everyone has the same rng
        
        // generate the first random number ??????
        //let first = rand something
        // initialize the grid based on the first random number ??????
        
        // generate an array of random numbers of fixed length (start low for testing)
        // verifArray = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
        verifArray = []
        for i in 0...18 {
            verifArray.append(Int(rand()))
        }
        
        
        for i in 0...24 {
            let b:UIButton = UIButton(frame: CGRectMake(CGFloat(i%5)*bwidth+10, CGFloat(i/5)*bwidth + 64+10, bwidth-20, bwidth-20))
            b.backgroundColor = UIColor.blackColor()
            self.buttonlist.append(b)
            
            for i in verificationGenerator.characters {
                //print(i)
                //print(String(i))
                //print(Int(String(i)))
                if Int(String(i))! % 2 == 0 {
                    b.backgroundColor = UIColor.grayColor()
                }
            }
            //
            self.view.addSubview(b)
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector:"update", userInfo:nil, repeats: true)
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        timer!.invalidate()
        timer = nil
    }
    
    func update() {
        
        // turn the last changed one to grey
        if (lastChangedButton != nil) {
            lastChangedButton.backgroundColor = UIColor.grayColor()
        }
        
        // change the current array position
        var buttonToChange = self.verifArray[Int(NSDate().timeIntervalSince1970*13) % self.verifArray.count] % 25
        print(buttonToChange)
        var b:UIButton = self.buttonlist[buttonToChange]
        if b.backgroundColor == UIColor.blackColor() {
            // it was black so change it to gray
            b.backgroundColor = UIColor.grayColor()
        }
        else {
            // it was gray so change it to black
            b.backgroundColor = UIColor.blackColor()
            // save this so it can be turned back to grey later
            lastChangedButton = b
        }
        self.buttonlist[buttonToChange] = b
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
