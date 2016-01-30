//
//  Party.swift
//  PartyApp
//
//  Created by Daniel Vogel on 1/30/16.
//  Copyright © 2016 Daniel Vogel. All rights reserved.
//

import Foundation
import UIKit

class Party {
    
    var hostName: String
    var partyName: String
    var theme: String
    var location: String
    var description: String
    var date: String
    var image: UIImage
    var guestLimit: Int
    var guestCurrent: Int
    var fundingGoal: Int
    var fundingCurrent: Int
    
    init(hostName:String, partyName:String, theme:String, location:String, description:String, date:String, image:UIImage, guestLimit:Int, fundingGoal:Int){
        
        self.hostName = hostName
        self.partyName = partyName
        self.theme = theme
        self.location = location
        self.description = description
        self.date = date
        self.image = image
        self.guestLimit = guestLimit
        self.guestCurrent = 0
        self.fundingGoal = fundingGoal
        self.fundingCurrent = 0
        
    }
    
    func addFunds(funds:Int){
        self.fundingCurrent += funds
    }
    
    func addGuest() -> Bool {
        if (self.guestCurrent < self.guestLimit) {
            self.guestCurrent++
            return true
        }
        else {
            return false
        }
    }
    
}