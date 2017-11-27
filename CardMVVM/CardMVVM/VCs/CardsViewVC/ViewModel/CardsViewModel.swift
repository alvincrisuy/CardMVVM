//
//  CardsViewModel.swift
//  CardMVVM
//
//  Created by Cris Uy on 27/11/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

final class CardsViewModel: NSObject {
    
    private var listOfCards: [Card] = []
    
    func accessCardDataAt(_ indexPath: IndexPath) -> Card {
        return listOfCards[indexPath.row]
    }
    
    func numberOfCards() -> Int {
        return listOfCards.count
    }
    
    func add(_ card: Card) {
        listOfCards.append(card)
    }
    
    func removeCard(at index: Int) {
        listOfCards.remove(at: index)
    }
    
}
