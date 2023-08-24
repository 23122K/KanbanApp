import SwiftUI
import Combine


class SignInViewModel: ObservableObject {
    @Injected(\.model) var model
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Input
    @Published var emialAddress = ""
    @Published var password = ""
    
    //MARK: Sign in form validation
    var isValid: Bool {
        if Validator.isValidMail(emialAddress) && Validator.isValidPassword(password) {
            return true
        }
        
        return false
    }
    
    func authenticate() {
        model.authenticate(email: emialAddress, password: password)
    }

    //MARK: Initializer
    init() { }
    
    
}
