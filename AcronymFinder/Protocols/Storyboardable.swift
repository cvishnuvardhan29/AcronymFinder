//
//  Storyboardable.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import UIKit

protocol Storyboardable {
    // MARK: - Properties
    
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var storyboardIdentifier: String { get }
    static var mainStoryboard: UIStoryboard { get }
    
    // MARK: - Methods
    
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String {
        "Main"
    }
    static var storyboardBundle: Bundle {
        .main
    }
    static var storyboardIdentifier: String {
        String(describing: self)
    }
    static var mainStoryboard: UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
    
    static func instantiate() -> Self {
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        return viewController
    }
}

