//
//  AcronymFinderTests.swift
//  AcronymFinderTests
//
//  Created by Vishnu Chundi on 12/8/22.
//

import XCTest
@testable import AcronymFinder

final class AcronymDetailsViewModelTests: XCTestCase {

    // MARK: - Properties
    
    var viewModel: AcronymDetailsViewModel!
    var mockAcronymService: MockAcronymService!
    
    // MARK: - Set Up & Tear Down
    
    override func setUp() {
        super.setUp()
        
        viewModel = AcronymDetailsViewModel(acronym: "NASA")
        mockAcronymService = MockAcronymService()
    }

    override func tearDown()  {
        super.tearDown()
        viewModel = nil
        mockAcronymService = nil
    }
    
    // MARK: - Tests
    
    func testAPIManagerNotNil() {
        XCTAssertNotNil(viewModel.apiManager)
    }
    
    func testFetchAcronymDetailsNotNil() {
        // When
        let expectation = expectation(description: "Fetching acronym details")
        mockAcronymService.fetchAcronymDetails(with: viewModel.apiManager) { result in
            switch result {
            case .success(let acronymDetails):
                self.viewModel.acronymDetails = acronymDetails.first
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        
        // Then
        XCTAssertNotNil(viewModel.acronymDetails)
    }
    
    func testGetAcronymDetails() {
        // When
        let expectation = expectation(description: "Fetching acronym details")
        mockAcronymService.fetchAcronymDetails(with: viewModel.apiManager) { result in
            switch result {
            case .success(let acronymDetails):
                self.viewModel.acronymDetails = acronymDetails.first
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 10.0)
        
        // Then
        XCTAssertEqual(viewModel.getAcronymShortForm(), viewModel.acronymDetails?.shortForm)
    }
    
    func testNoScoresErrorText() {
        XCTAssertEqual(viewModel.getNoAcronymErrorText(), "No acronyms available! Please enter different acronym")
    }
}

