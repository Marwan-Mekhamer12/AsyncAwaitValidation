//
//  ErrorHandling.swift
//  Grand Hotel
//
//  Created by Marwan Mekhamer on 25/06/2025.
//

import Foundation

enum ValidationErrors: LocalizedError {
    
    case emptyEmail
    case emptyPassword
    case validationEmail
    case validationPassword
    
    var errorDescription: String? {
        switch self {
        case .emptyEmail:
            return "Please Enter Your Email!"
        case .emptyPassword:
            return "Please Enter Your Password!"
        case .validationEmail:
            return "Please Enter valid Email!"
        case .validationPassword:
            return "Please Enter valid Password!"
        }
    }
}
