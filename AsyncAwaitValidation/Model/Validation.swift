//
//  Validation.swift
//  AsyncAwaitValidation
//
//  Created by Marwan Mekhamer on 25/06/2025.
//

import UIKit

struct Validation {
    
    static func validation(_ email: String,_ password: String) async throws {
        let email = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !email.isEmpty else {
            throw ValidationErrors.emptyEmail
        }
        
        guard isValidEmail(email) else {
            throw ValidationErrors.validationEmail
        }
        
        guard !password.isEmpty else {
            throw ValidationErrors.emptyPassword
        }
        
        guard isValidPassword(password) else {
            throw ValidationErrors.validationPassword
        }
        
        
        
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
           let regex =
           #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
           return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }
       
    private static func isValidPassword(_ password: String) -> Bool {
           let regex = #"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$"#
           return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: password)
    }
    
    
}
