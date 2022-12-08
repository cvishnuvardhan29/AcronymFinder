//
//  Navigation.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import UIKit

class AppCoordinator {
    
    // MARK: - Properties
    
    private let navigationController = UINavigationController()
    
    // MARK: - Public API
    
    var rootViewContoller: UIViewController {
        return navigationController
    }
    
    func start() {
        // Initialize Acronym View Controller
        let acronymViewController = AcronymViewController.instantiate()
        
        acronymViewController.didShowAcronymDetails = { [weak self] acronym in
            self?.showAcronymDetails(acronym: acronym)
        }
        
        // Push Acronym View Controller Onto Navigaion Stack
        navigationController.pushViewController(acronymViewController, animated: true)
    }
    
    // MARK: - Helper Methods
    
    private func showAcronymDetails(acronym: String) {
        // Initialize Acronym Details View Controller
        let acronymDetailsViewController = AcronymDetailsViewController.instantiate()
        
        // Configure View Model
        acronymDetailsViewController.viewModel = AcronymDetailsViewModel(acronym: acronym)
        
        // Push Acronym Details View Controller Onto Navigaion Stack
        navigationController.pushViewController(acronymDetailsViewController, animated: true)
    }
}
