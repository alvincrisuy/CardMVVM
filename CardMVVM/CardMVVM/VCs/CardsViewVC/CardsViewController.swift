//
//  CardsViewController.swift
//  CardMVVM
//
//  Created by Cris Uy on 27/11/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit
import Alamofire

final class CardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    /* ============= IBOutlets ============ */
    
    @IBOutlet var viewModel: CardsViewModel!
    @IBOutlet weak var cardsCollectionView: UICollectionView!
    
    
    /* ============= IBAction ============ */
    
    @IBAction func createCardButtonAction(_ sender: Any) {
        presentCreateCardViewController()
    }
    
    /* ============= Private Methods ============ */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://demo.app.stratus.tech/api/app-settings.json", method: .post, parameters: [:], encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                print("RESPONSE SUCCESS: \(value)")
            case .failure(let error):
                print("RESPONSE ERROR: \(error)")
            }
        }
    }
    
    private func presentCreateCardViewController() {
        let createCardViewController = storyboard?.instantiateViewController(withIdentifier: "CreateCardViewController") as! CreateCardViewController
        present(createCardViewController, animated: true, completion: nil)
    }
    
    /* ============= Collection View ============ */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numberOfCards = viewModel.numberOfCards()
        return numberOfCards
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
        
        let cardData = viewModel.accessCardDataAt(indexPath)
        cell.configure(cardData)
        
        return cell
    }
    
}

