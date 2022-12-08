//
//  AcronymDetailsViewController.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import UIKit

class AcronymDetailsViewController: MainViewController, Container {

    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var shortFormLabel: UILabel!
    @IBOutlet weak var longFormLabel: UILabel!
    
    // MARK: - Container Properties
    
    typealias ViewModel = AcronymDetailsViewModelType
    var viewModel: AcronymDetailsViewModelType? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    // MARK: - View Controller Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Acronym Details"
        
        // Initial Setup
        initialSetup()
        
        // Fetching the acronym details
        viewModel?.fetchAcronymDetails()
    }
    
    // MARK: - Helper Methods
    
    private func initialSetup() {
        isAnimating = true
        mainStackView.isHidden = true
    }
    
    private func updateData() {
        mainStackView.isHidden = false
        isAnimating = false
        shortFormLabel.text = viewModel?.getAcronymShortForm()
        longFormLabel.text = viewModel?.getAcronymLongForm()?.capitalized
    }
    
    private func handleNoAcronym() {
        mainStackView.isHidden = false
        isAnimating = false
        longFormLabel.text = viewModel?.getNoAcronymErrorText()
        longFormLabel.textColor = .red
    }
    
}

extension AcronymDetailsViewController: AcronymDetailsViewModelDelegate {
    func reloadView() {
        DispatchQueue.main.async {
            self.updateData()
        }
    }
    
    func showFailureError(with errorText: String) {
        DispatchQueue.main.async {
            self.handleNoAcronym()
        }
    }
    
    
}
