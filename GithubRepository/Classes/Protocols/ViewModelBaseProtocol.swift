//
//  ViewModelBaseProtocol.swift
//  GithubRepository
//
//  Created by Mehran on 3/25/1401 AP.
//

import Foundation
import Combine

// MARK: BaseViewModel

protocol ViewModelBaseProtocol {
    var loadinState : CurrentValueSubject<ViewModelStatus, Never> { get set }
    var bag : Set<AnyCancellable> { get }
}

