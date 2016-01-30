
//
//  ViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/29/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit
import TextFieldEffects

class HostPartyViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {
    
    
    //Create all the labels and things here so that they may be referenced throughout the class
    var themeTextField = KaedeTextField(frame: CGRectMake(5, 160, 0, 44.0))
    var nameTextField = KaedeTextField(frame: CGRectMake(5, 160, 0, 44.0))
    var partyTextField = KaedeTextField(frame: CGRectMake(5, 160, 0, 44.0))
    var locationTextField = KaedeTextField(frame: CGRectMake(5, 160, 0, 44.0))
    var timePicker = UIDatePicker(frame: CGRectMake(5, 290, 0, 44.0))
    var imageSelector = UIImageView(frame: CGRectMake(5, 378, 0, 250))
    let tapRecImage = UITapGestureRecognizer()
    let tapRecKeyBoardHider = UITapGestureRecognizer()
    let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
    var guestLimitSlider = UISlider(frame:CGRectMake(20, 700, 280, 20))
    var guestLimitValueLabel = UILabel(frame: CGRectMake(5, 625, 10, 44.0))
    var fundingGoalSlider = UISlider(frame:CGRectMake(20, 700, 280, 20))
    var fundingGoalValueLabel = UILabel(frame: CGRectMake(5, 625, 10, 44.0))
    var fundingGoalSwitch=UISwitch(frame:CGRectMake(250, 677.5, 0, 0))
    var fundingGoalLabel = UILabel(frame: CGRectMake(5, 670, 10, 44.0))
    var descriptionTextView = UITextView(frame:CGRectMake(5, 550, 10, 300))
    var keywordTextField = KaedeTextField(frame: CGRectMake(5, 204-75, 10, 44.0))
    var createButton = UIButton(frame: CGRectMake(5, 1140, 10, 44.0))
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        view.backgroundColor = .whiteColor()
        self.view = self.scrollView
        self.scrollView.contentSize = CGSize(width:width, height: 1290)
        scrollView.backgroundColor = .blackColor()
        view.backgroundColor = .blackColor()
        
        
        
        /*
        let button:UIButton = UIButton(frame: CGRectMake(100, 100, 100, 200))
        button.setTitle("My Button", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        self.view.addSubview(button)
        */
        
        //Create the party theme Textfield
        themeTextField = KaedeTextField(frame: CGRectMake(5, 160-75+44, width-10, 44.0))
        themeTextField.placeholder = "Theme (Opt.)"
        themeTextField.placeholderColor = .whiteColor()
        themeTextField.textColor = .whiteColor()
        themeTextField.backgroundColor = .blackColor()
        self.view.addSubview(themeTextField)
        
        
        //Create the party title TextField
        partyTextField = KaedeTextField(frame: CGRectMake(5, 118-75, width-10, 44.0))
        partyTextField.placeholder = "Party Name"
        partyTextField.placeholderColor = .whiteColor()
        partyTextField.textColor = .whiteColor()
        partyTextField.backgroundColor = .blackColor()
        self.view.addSubview(partyTextField)
        
        //Create the name TextField
        nameTextField = KaedeTextField(frame: CGRectMake(5, 75-75, width-10, 44.0))
        nameTextField.placeholder = "Host Name"
        nameTextField.placeholderColor = .whiteColor()
        nameTextField.textColor = .whiteColor()
        nameTextField.backgroundColor = .blackColor()
        self.view.addSubview(nameTextField)
        
        //Create the location TextField
        locationTextField = KaedeTextField(frame: CGRectMake(5, 204-75+44, width-10, 44.0))
        locationTextField.placeholder = "Location"
        locationTextField.placeholderColor = .whiteColor()
        locationTextField.textColor = .whiteColor()
        locationTextField.backgroundColor = .blackColor()
        self.view.addSubview(locationTextField)
        
        //Create the Date Picker
        timePicker = UIDatePicker(frame: CGRectMake(5, 290-75+44, width-10, 44.0))
        timePicker.backgroundColor = .blackColor()
        timePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        self.view.addSubview(timePicker)
        
        //Create the label for the date Picker
        let timeLabel = UILabel(frame: CGRectMake(5, 248-75+44, width-10, 44.0))
        timeLabel.backgroundColor = .blackColor()
        timeLabel.textColor = .whiteColor()
        timeLabel.text = " Choose the Date:"
        self.view.addSubview(timeLabel)
        
        //Create the label for the image selector
        let imageLabel = UILabel(frame: CGRectMake(5, 334-75+44, width-10, 44.0))
        imageLabel.backgroundColor = .blackColor()
        imageLabel.textColor = .whiteColor()
        imageLabel.text = " Choose an Image:"
        self.view.addSubview(imageLabel)
        
        //Create the image selector
        let image : UIImage = UIImage(named:"defaultPhoto")!
        imageSelector = UIImageView(frame: CGRectMake(5, 378-75+44-3, width-10, 350))
        imageSelector.image = image
        imageSelector.userInteractionEnabled = true
        self.view.addSubview(imageSelector)
        
        
        //Create the tap recognition for the image
        tapRecImage.addTarget(self, action: "tappedView")
        imageSelector.addGestureRecognizer(tapRecImage)
        
        //Create the tap recognition for the action to hide keyboard
        tapRecImage.addTarget(self, action: "tappedView")
        imageSelector.addGestureRecognizer(tapRecImage)
        
        //Create the tap recognition for the action to hide keyboard
        tapRecKeyBoardHider.addTarget(self, action: "dismissKeyboard")
        view.addGestureRecognizer(tapRecKeyBoardHider)
        
        //Create the label for guest limit
        let guestLimitLabel = UILabel(frame: CGRectMake(5, 550+300+44+100+1, width-10, 44.0))
        guestLimitLabel.backgroundColor = .blackColor()
        guestLimitLabel.textColor = .whiteColor()
        guestLimitLabel.text = " Guest Limit"
        self.view.addSubview(guestLimitLabel)
        
        //Create the switch for the guest limit
        let guestLimitSwitch=UISwitch(frame:CGRectMake(250, 557.5+300+44+100+1, 0, 0))
        guestLimitSwitch.on = true
        guestLimitSwitch.setOn(true, animated: false);
        guestLimitSwitch.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged);
        self.view.addSubview(guestLimitSwitch)
        
        //Create the slider for the guest limit
        guestLimitSlider = UISlider(frame:CGRectMake(20, 600+300+44+100+1, 280, 20))
        guestLimitSlider.minimumValue = 0
        guestLimitSlider.maximumValue = 200
        guestLimitSlider.continuous = true
        guestLimitSlider.tintColor = UIColor.redColor()
        guestLimitSlider.value = 100
        guestLimitSlider.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(guestLimitSlider)
        
        //Create the label for guest limit value
        guestLimitValueLabel = UILabel(frame: CGRectMake(5, 625+300+44+100+1, width-10, 44.0))
        guestLimitValueLabel.backgroundColor = .blackColor()
        guestLimitValueLabel.textColor = .whiteColor()
        guestLimitValueLabel.text = String(Int(guestLimitSlider.value))
        guestLimitValueLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(guestLimitValueLabel)
        
        //Create the label for funding goal
        fundingGoalLabel = UILabel(frame: CGRectMake(5, 670+300+44+100+1, width-10, 44.0))
        fundingGoalLabel.backgroundColor = .blackColor()
        fundingGoalLabel.textColor = .whiteColor()
        fundingGoalLabel.text = " Funding Goal"
        self.view.addSubview(fundingGoalLabel)
        
        //Create the switch for the funding goal
        fundingGoalSwitch=UISwitch(frame:CGRectMake(250, 677.5+300+44+100+1, 0, 0))
        fundingGoalSwitch.on = true
        fundingGoalSwitch.setOn(true, animated: false);
        fundingGoalSwitch.addTarget(self, action: "switchValueDidChange2:", forControlEvents: .ValueChanged);
        self.view.addSubview(fundingGoalSwitch)
        
        //Create the slider for the funding goal
        fundingGoalSlider = UISlider(frame:CGRectMake(20, 720+300+44+100+1, 280, 20))
        fundingGoalSlider.minimumValue = 0
        fundingGoalSlider.maximumValue = 500
        fundingGoalSlider.continuous = true
        fundingGoalSlider.tintColor = UIColor.redColor()
        fundingGoalSlider.value = 250
        fundingGoalSlider.addTarget(self, action: "sliderValueDidChange2:", forControlEvents: .ValueChanged)
        self.view.addSubview(fundingGoalSlider)
        
        //Create the label for guest limit value
        fundingGoalValueLabel = UILabel(frame: CGRectMake(5, 745+300+44+100+1, width-10, 44.0))
        fundingGoalValueLabel.backgroundColor = .blackColor()
        fundingGoalValueLabel.textColor = .whiteColor()
        fundingGoalValueLabel.text = String(Int(fundingGoalSlider.value))
        fundingGoalValueLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(fundingGoalValueLabel)
        
        //Create the description text view
        descriptionTextView = UITextView(frame:CGRectMake(5, 550+44+100, width-10, 300))
        descriptionTextView.backgroundColor = .blackColor()
        descriptionTextView.layer.borderColor = UIColor.redColor().CGColor
        descriptionTextView.layer.borderWidth = 2
        descriptionTextView.text = "Type your description here."
        descriptionTextView.textColor = .whiteColor()
        descriptionTextView.font = UIFont(name: descriptionTextView.font!.fontName, size: 18)
        self.view.addSubview(descriptionTextView)
        
        //Create the keyword TextField
        keywordTextField = KaedeTextField(frame: CGRectMake(5, 204-75-44, width-10, 44.0))
        keywordTextField.placeholder = "Keyword"
        keywordTextField.placeholderColor = .whiteColor()
        keywordTextField.textColor = .whiteColor()
        keywordTextField.backgroundColor = .blackColor()
        self.view.addSubview(keywordTextField)
        
        //Create the create button
        createButton = UIButton(frame: CGRectMake(5, 1140+100+1, width-10, 44.0))
        createButton.setTitle("Create", forState: UIControlState.Normal)
        createButton.backgroundColor = .whiteColor()
        createButton.setTitleColor(.blackColor(), forState: UIControlState.Normal)
        createButton.layer.borderColor = UIColor.blackColor().CGColor
        createButton.layer.borderWidth = 2
        createButton.userInteractionEnabled = true
        self.view.addSubview(createButton)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func itemPressed(sender: AnyObject) {
        
    }
    
    //Function for getting the value of the guest limit slider
    func sliderValueDidChange(sender:UISlider!)
    {
        guestLimitValueLabel.text = String(Int(guestLimitSlider.value))
    }
    
    //Function for getting the value of the funding goal slider
    func sliderValueDidChange2(sender:UISlider!)
    {
        fundingGoalValueLabel.text = String(Int(fundingGoalSlider.value))
    }
    
    
    //Whenever you tap somewhere outside the TextField
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    //A function for when the gust limit switch is swicthed
    func switchValueDidChange(sender:UISwitch!)
    {
        
        
        if (sender.on == true){
            let height = UIScreen.mainScreen().bounds.height
            let width = UIScreen.mainScreen().bounds.width
            
            
            guestLimitSlider.hidden = false
            guestLimitValueLabel.hidden = false
            
            UIView.animateWithDuration(0.01, animations:{
                self.fundingGoalLabel.frame = CGRectMake(5, 670+300+44+100+1, width-10, 44.0)
                self.fundingGoalSwitch.frame = CGRectMake(250, 677.5+300+44+100+1, 0, 0)
                self.fundingGoalSlider.frame = CGRectMake(20, 720+300+44+100+1, 280, 20)
                self.fundingGoalValueLabel.frame = CGRectMake(5, 745+300+44+100+1, width-10, 44.0)
                
                
                
            })
            
            
        }
        else{
            let height = UIScreen.mainScreen().bounds.height
            let width = UIScreen.mainScreen().bounds.width
            
            
            UIView.animateWithDuration(0.5, animations:{
                self.fundingGoalLabel.frame = CGRectMake(5, 600+300+44+100+1, width-10, 44.0)
                self.fundingGoalSwitch.frame = CGRectMake(250, 607.5+300+44+100+1, 0, 0)
                self.fundingGoalSlider.frame = CGRectMake(20, 650+300+44+100+1, 280, 20)
                self.fundingGoalValueLabel.frame = CGRectMake(5, 675+300+44+100+1, width-10, 44.0)
                
                
            })
            
            guestLimitSlider.hidden = true
            guestLimitValueLabel.hidden = true
            
        }
    }
    
    //A function for when the funding goal switch is on
    func switchValueDidChange2(sender:UISwitch!)
    {
        if (sender.on == true){
            
            fundingGoalSlider.hidden = false
            fundingGoalValueLabel.hidden = false
            
        }
        else{
            
            fundingGoalSlider.hidden = true
            fundingGoalValueLabel.hidden = true
            
        }
    }
    
    //A function to select an image for the party
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        imageSelector.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //What happens if the photo selector is tapped
    func tappedView(){
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
}
