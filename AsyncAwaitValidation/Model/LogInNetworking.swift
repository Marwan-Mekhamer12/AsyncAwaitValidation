//
//  LogInNetworking.swift
//  AsyncAwaitValidation
//
//  Created by Marwan Mekhamer on 25/06/2026.
//

import Foundation
// import FirebaseAuth

protocol LogInProtocol {
    func LogIn(_ email: String,_ password: String) async throws -> User
}

class LogInNetworking: LogInProtocol {
    func LogIn(_ email: String, _ password: String) async throws -> User {
        return try await withCheckedThrowingContinuation({ continuation in
            Auth.auth().signIn(withEmail: email, password: password) { authUser, error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let user = authUser?.user else {
                    continuation.resume(throwing: ValidationErrors.validationEmail)
                    return
                }
                
                continuation.resume(returning: user)
            }
        })
        
        
    }
}
