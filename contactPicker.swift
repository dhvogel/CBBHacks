
//

import UIKit
import MessageUI

class contactPicker: UIViewController, EPPickerDelegate{

  override func viewDidLoad() {
    super.viewDidLoad()
    
    /*
    var messageVC = MFMessageComposeViewController()
    messageVC.body = "Hello Friends, Sharing some data here... !"
    messageVC.recipients = ["2079070274"]
    //messageVC.messageComposeDelegate = self;
    self.presentViewController(messageVC, animated: false, completion: nil)
   */

    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func onTouchShowMeContactsButton(sender: AnyObject) {
    
    let contactPickerScene = EPContactsPicker(delegate: self, multiSelection:true, subtitleCellType: SubtitleCellValue.Phonenumer)
    let navigationController = UINavigationController(rootViewController: contactPickerScene)
    self.presentViewController(navigationController, animated: true, completion: nil)
    
  }
    
//MARK: EPContactsPicker delegates
    func epContactPicker(_: EPContactsPicker, didContactFetchFailed error : NSError)
    {
        print("Failed with error \(error.description)")
    }
    
    func epContactPicker(_: EPContactsPicker, didSelectContact contact : EPContact)
    {
        print("Contact \(contact.displayName()) has been selected")
    }
    
    func epContactPicker(_: EPContactsPicker, didCancel error : NSError)
    {
        print("User canceled the selection");
    }
    
    func epContactPicker(_: EPContactsPicker, didSelectMultipleContacts contacts: [EPContact]) {
        print("The following contacts are selected")
        
        var nameArray: Array<String> = []
        for contact in contacts {
            var bob = contact.phoneNumbers[0]
            nameArray.append(bob.phoneNumber)
        }
        print(nameArray)
    }

}