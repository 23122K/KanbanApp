//
//  SignUpViewModel.swift
//  KanbanToDoApp
//
//  Created by Patryk Maciąg on 16/05/2023.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Injected(\.model) var model
    
    //MARK: Input
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emial: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
    
    //MARK: Sign up from validation
    var areCrendentailsValid: Bool {
        if(Validator.isValidMail(emial) && Validator.isValidString(firstName) && Validator.isValidString(lastName)) {
            return true
        }
        
        return false
    }
    
    var doesPasswordsMatch: Bool {
        if(Validator.isValidPassword(password) && Validator.isValidPassword(confirmPassword ) && password == confirmPassword){
            return true
        }
        
        return false
    }
    
    func register() {
        model.register(firstName: firstName, lastName: lastName, email: emial, password: password)
        model.authenticate(email: emial, password: password)
    }
    
}
