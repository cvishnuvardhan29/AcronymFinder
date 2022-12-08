//
//  MainViewController.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import UIKit

class MainViewController: UIViewController, Storyboardable {
    
    // MARK: - Properties
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    // By Setting this activity indicator will decide to animate or not
    var isAnimating: Bool = false {
        didSet {
            isAnimating ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        }
    }
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configuring the View
        self.view.backgroundColor = .white
        
        // Setting up the activity indicator
        setupActivityIndicator()
    }
    
    // MARK: - Methods
    
    private func setupActivityIndicator() {
        activityIndicator.center = view.center
        self.view.addSubview(activityIndicator)
    }

}
