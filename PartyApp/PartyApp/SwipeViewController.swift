//
//  SwipeViewController.swift
//  PartyApp
//
//  Created by The bumblebee on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import Foundation
import Stripe
// PaymentViewController.swift

class PaymentViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    let paymentTextField = STPPaymentCardTextField()

    override func viewDidLoad() {
        super.viewDidLoad();

        paymentTextField.frame = CGRectMake(15, 15, CGRectGetWidth(self.view.frame) - 30, 44)
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
    }
}