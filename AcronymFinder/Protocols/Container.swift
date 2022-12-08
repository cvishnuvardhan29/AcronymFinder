//
//  Container.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import Foundation

protocol Container {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
}
