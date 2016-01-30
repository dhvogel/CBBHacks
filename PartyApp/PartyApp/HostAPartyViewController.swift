//
//  ViewController.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/29/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import UIKit
import TextFieldEffects

class HostAPartyViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIScrollViewDelegate {

 
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


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let height = UIScreen.mainScreen().bounds.height
        let width = UIScreen.mainScreen().bounds.width
        view.backgroundColor = .whiteColor()
        self.view = self.scrollView
        self.scrollView.contentSize = CGSize(width:width, height: 1000)
        scrollView.backgroundColor = .whiteColor()


        
        /*
        let button:UIButton = UIButton(frame: CGRectMake(100, 100, 100, 200))
        button.setTitle("My Button", forState: .Normal)
        button.backgroundColor = UIColor.blackColor()
        self.view.addSubview(button)
        */
        
        //Create the party theme Textfield
        themeTextField = KaedeTextField(frame: CGRectMake(5, 160-75, width-10, 44.0))
        themeTextField.placeholder = "Theme (Optional)"
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
        locationTextField = KaedeTextField(frame: CGRectMake(5, 204-75, width-10, 44.0))
        locationTextField.placeholder = "Location"
        locationTextField.placeholderColor = .whiteColor()
        locationTextField.textColor = .whiteColor()
        locationTextField.backgroundColor = .blackColor()
        self.view.addSubview(locationTextField)
        
        //Create the Date Picker
        timePicker = UIDatePicker(frame: CGRectMake(5, 290-75, width-10, 44.0))
        timePicker.backgroundColor = .blackColor()
        timePicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        self.view.addSubview(timePicker)
        
        //Create the label for the date Picker
        let timeLabel = UILabel(frame: CGRectMake(5, 248-75, width-10, 44.0))
        timeLabel.backgroundColor = .blackColor()
        timeLabel.textColor = .whiteColor()
        timeLabel.text = " Choose the Date:"
        self.view.addSubview(timeLabel)
       
  
        
        //Create the label for the image selector
        let imageLabel = UILabel(frame: CGRectMake(5, 334-75, width-10, 44.0))
        imageLabel.backgroundColor = .blackColor()
        imageLabel.textColor = .whiteColor()
        imageLabel.text = " Choose an Image:"
        self.view.addSubview(imageLabel)
        
        //Create the image selector
        let image : UIImage = UIImage(named:"defaultPhoto")!
        imageSelector = UIImageView(frame: CGRectMake(5, 378-75, width-10, 250))
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
        

        /*
        //Create the switch for the guest limit
        var switchDemo=UISwitch(frame:CGRectMake(150, 645, 0, 0))
        switchDemo.on = true
        switchDemo.setOn(true, animated: false);
        switchDemo.addTarget(self, action: "switchValueDidChange:", forControlEvents: .ValueChanged);
        self.view.addSubview(switchDemo);
        */
        //Create the scroll view


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func itemPressed(sender: AnyObject) {

    }
    
    //Whenever you tap somewhere outside the TextField
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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

