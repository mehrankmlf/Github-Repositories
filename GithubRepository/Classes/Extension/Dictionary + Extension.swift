//
//  Dictionary + Extension.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation

extension Dictionary {
    var queryString: String {
        var output: String = ""
        forEach({ output += "\($0.key)=\($0.value)&" })
        output = String(output.dropLast())
        return "?" + output
    }
}
