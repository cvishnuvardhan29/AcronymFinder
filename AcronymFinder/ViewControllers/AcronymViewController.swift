//
//  AcronymViewController.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import UIKit

class AcronymViewController: MainViewController, Container {

    // MARK: - Outlet Properties
    
    @IBOutlet weak var acronymTextField: UITextField!
    @IBOutlet weak var findButton: UIButton!
    
    // MARK: - Container Properties
    
    typealias ViewModel = AcronymViewModel
    var viewModel: AcronymViewModel?
    
    // MARK: - Properties
    
    var didShowAcronymDetails: ((String) -> Void)?
    var isEnableFind: Bool = false {
        didSet {
            findButton.isEnabled = isEnableFind
        }
    }

    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initialSetup()
    }
    
    // MARK: - Helper Methods
    
    private func initialSetup() {
        isEnableFind = false
        acronymTextField.text = nil
        acronymTextField.enablesReturnKeyAutomatically = false
    }
    
    // MARK: - Methods

    @IBAction func didTapOnFind(_ sender: UIButton) {
        guard let acronym = acronymTextField.text else { return }
        didShowAcronymDetails?(acronym)
    }
}

// MARK: - UITextFieldDelegate Methods

extension AcronymViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""
        
        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        // Enabling the find button
        isEnableFind = updatedText.count >= 2
        
        return true
    }
}
