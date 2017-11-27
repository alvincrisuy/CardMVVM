//
//  CreateCardViewModel.swift
//  CardMVVM
//
//  Created by Cris Uy on 27/11/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

final class CreateCardViewModel: NSObject {
    
    private let card = Card()
    
    func createCard(name: String, email: String, phoneNumber: String, occupation: String, companyAddress: String?, companyWebsite: String?) -> Card {
        
        card.name = name
        card.email = email
        card.phoneNumber = phoneNumber
        card.occupancy = occupation
        card.companyAddress = companyAddress
        card.companyWebsite = companyWebsite
        
        return card
    }
    
}

