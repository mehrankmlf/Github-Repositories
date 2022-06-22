//
//  Enums.swift
//  GithubRepository
//
//  Created by Mehran on 3/26/1401 AP.
//

import Foundation

enum ViewModelStatus : Equatable {
    case loadStart
    case dismissAlert
    case emptyStateHandler(title : String, isShow : Bool)
}

enum APIError : Error {
    case general
    case timeout
    case pageNotFound
    case noData
    case noNetwork
    case unknownError
    case serverError
    case statusMessage(message : String)
    case decodeError(String)
}

extension APIError {
    ///Description of error
    var desc: String {
        
        switch self {
        case .general:                    return MessageHelper.serverError.general
        case .timeout:                    return MessageHelper.serverError.timeOut
        case .pageNotFound:               return MessageHelper.serverError.notFound
        case .noData:                     return MessageHelper.serverError.notFound
        case .noNetwork:                  return MessageHelper.serverError.noInternet
        case .unknownError:               return MessageHelper.serverError.general
        case .serverError:                return MessageHelper.serverError.serverError
        case .statusMessage(let message): return message
        case .decodeError(let error):     return error
        }
    }
}

enum StatusCodeType : Int , Codable {
    case success = 0
    case requestIsNotPermitted = 31
    case failed = 42
    case NotFound = 1
    case ServerError = 2
    case InvalidToken = 3
    case TokenExpired = 4
    case Disabled = 23
    case ValueIsNull = 19
}

enum PermisionType : Int {
    case camera = 1
    case contact = 2
    case photoLibrary = 3
    case location = 4
    case photoCamera = 5
    
    var desc: String {
        switch self {
            
        case .camera:
            return "You do not have permission to access the Camera, you can access the application through the device settings, Privacy menu"
        case .contact:
            return "You have not allowed access to Contact, you can access the application through the device settings, under the Privacy menu"
        case .photoLibrary:
            return "You are not allowed to access Photos, you can access the app through the device settings under the Privacy menu"
        case .location:
            return "You are not allowed to access Location, you can access the application through the device settings, under the Privacy menu"
        case .photoCamera:
            return "You are not allowed to access Photo and Camera, you can access the application through the device settings, under the Privacy menu"
        }
    }
}




