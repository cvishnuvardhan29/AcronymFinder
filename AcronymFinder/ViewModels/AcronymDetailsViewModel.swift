//
//  AcronymDetailsViewModel.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import Foundation

protocol AcronymDetailsViewModelType {
    var delegate: AcronymDetailsViewModelDelegate? { get set }
    var errorText: String { get set }

    func fetchAcronymDetails()
    func getAcronymShortForm() -> String?
    func getAcronymLongForm() -> String?
    func getNoAcronymErrorText() -> String
}

protocol AcronymDetailsViewModelDelegate: AnyObject {
    func reloadView()
    func showFailureError(with errorText: String)
}

class AcronymDetailsViewModel: AcronymDetailsViewModelType {
    var errorText: String = "No acronyms available! Please enter different acronym"
    
    // MARK: - Properties
    
    var apiManager: APIManager
    var acronymDetails: Acronym?
    private var acronym: String
    
    weak var delegate: AcronymDetailsViewModelDelegate?
    
    // MARK: - Initializer Method
    
    init(apiManager: APIManager = APIManager(),
         acronym: String) {
        self.apiManager = apiManager
        self.acronym = acronym
    }
    
    // MARK: - Methods
    
    // Making an API call for acronym details
    func fetchAcronymDetails() {
        apiManager.request(endpoint: AcronymEndpoint.getAcronymDetails(acronym: acronym)) { (result: Result<[Acronym], APIError>) in
            switch result {
            case .success(let acronymDetails):
                if acronymDetails.isEmpty {
                    self.errorText = "No acronyms available for \(self.acronym)! Please enter different acronym"
                    self.delegate?.showFailureError(with: self.errorText)
                } else {
                    self.acronymDetails = acronymDetails.first
                    self.delegate?.reloadView()
                }
            case .failure(let error):
                self.delegate?.showFailureError(with: error.localizedDescription)
            }
        }
    }
    
    func getAcronymShortForm() -> String? {
        acronymDetails?.shortForm
    }
    
    func getAcronymLongForm() -> String? {
        acronymDetails?.longForms.first?.longForm
    }
    
    func getNoAcronymErrorText() -> String {
        errorText
    }
}
