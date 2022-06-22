//
//  String + Extension.swift
//  GithubRepository
//
//  Created by Mehran on 3/25/1401 AP.
//

import Foundation

extension String {
    
    static func isNilOrEmpty(string: String?) -> Bool {
        guard let value = string else { return true }
        return value.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func whiteSpacesRemoved() -> String {
      return self.filter { $0 != Character(" ") }
    }
}
