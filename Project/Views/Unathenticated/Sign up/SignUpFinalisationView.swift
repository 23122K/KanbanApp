//
//  SignUpFinalisationView.swift
//  KanbanToDoApp
//
//  Created by Patryk Maciąg on 16/05/2023.
//

import SwiftUI

struct SignUpFinalisationView: View {
    @ObservedObject var vm: SignUpViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            FormTitleView(title: "Create", highlitedWord: "password")
            PasswordField(title: "Password", text: $vm.password)
            Divider()
            PasswordField(title: "Confirm password", text: $vm.confirmPassword)
        }
        .padding()
        
        SecondaryButton(content: "Sign in", state: vm.doesPasswordsMatch)
            .disabled(!vm.doesPasswordsMatch)
            .onTapGesture {
                vm.register()
            }
        Spacer()
    }
}

struct SignUpFinalisationView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFinalisationView(vm: SignUpViewModel())
    }
}
