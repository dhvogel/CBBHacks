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
        
        view.backgroundColor = .orangeColor()

        
        /*
        let button:UIButton = UIButton(frame: CGRectMake(100, 100, 100, 200))
        button.setTitle("My Button", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        self.view.addSubview(button)
        */
        
        //Create the party theme Textfield
        let themeTextField = AkiraTextField(frame: CGRectMake(5, 160, width-10, 44.0))
        themeTextField.placeholder = "Theme (Optional)"
        themeTextField.placeholderColor = .whiteColor()
       themeTextField.textColor = .whiteColor()
        themeTextField.backgroundColor = .blackColor()
        self.view.addSubview(themeTextField)
        
        
        //Create the party title TextField
        let partyTextField = AkiraTextField(frame: CGRectMake(5, 118, width-10, 44.0))
        partyTextField.placeholder = "Party Name"
        partyTextField.placeholderColor = .whiteColor()
        partyTextField.textColor = .whiteColor()
        partyTextField.backgroundColor = .blackColor()
        self.view.addSubview(partyTextField)
        
        //Create the name TextField
        let nameTextField = AkiraTextField(frame: CGRectMake(5, 75, width-10, 44.0))
        nameTextField.placeholder = "Host Name"
        nameTextField.placeholderColor = .whiteColor()
        nameTextField.textColor = .whiteColor()
        nameTextField.backgroundColor = .blackColor()
        self.view.addSubview(nameTextField)
        
        //Create the name TextField
        let locationTextField = AkiraTextField(frame: CGRectMake(5, 204, width-10, 44.0))
        locationTextField.placeholder = "Location"
        locationTextField.placeholderColor = .whiteColor()
        locationTextField.textColor = .whiteColor()
        locationTextField.backgroundColor = .blackColor()
        self.view.addSubview(locationTextField)
        
        //Create the Date Picker
        let timePicker = UIDatePicker(frame: CGRectMake(5, 248, width-10, 44.0))
        timePicker.backgroundColor = .blackColor()
        timePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        self.view.addSubview(timePicker)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

