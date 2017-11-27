//
//  CreateCardViewController.swift
//  CardMVVM
//
//  Created by Cris Uy on 27/11/2017.
//  Copyright © 2017 Test. All rights reserved.
//

import UIKit

final class CreateCardViewController: UIViewController {
    
    /* ===== IBOutlets ====== */
    
    @IBOutlet var mainView: CreateCardMainView!
    @IBOutlet var viewModel: CreateCardViewModel!
    
    /* ===== IBActions ====== */
    
    @IBAction func addButtonAction(_ sender: Any) {
        addCard()
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /* ======= Logic ======= */
    
    private func prepareCard() -> Card? {
        guard
            let fullName = mainView.fullNameTextField.text,
            let email = mainView.emailAddressTextField.text,
            let phoneNumber = mainView.phoneNumberTextField.text,
            let occupation = mainView.occupationTextField.text
            else {
                return nil
        }
        
        let companyAddress = mainView.companyAddressTextField.text
        let companyWebsite = mainView.companyWebsiteTextField.text

        return viewModel.createCard(name: fullName, email: email, phoneNumber: phoneNumber, occupation: occupation, companyAddress: companyAddress, companyWebsite: companyWebsite)
    }
    
    private func addCard() {
        let cardsVC = presentingViewController as? CardsViewController
        guard let card = prepareCard() else { return }

        cardsVC?.cardsCollectionView.reloadData()
        defer {
            dismiss(animated: true, completion: nil)
        }
    }
    
}

