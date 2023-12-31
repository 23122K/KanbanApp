import SwiftUI

struct SignInView: View {
    @StateObject private var vm = SignInViewModel()
    
    var body : some View {
        VStack(alignment: .leading){
            FormTitleView(title: "Welcome", highlitedWord: "back!")
            
            FormRowView(title: "Emial address", text: $vm.emialAddress, content: {
                Image(systemName: "envelope")
            })
            
            PasswordField(title: "Password", text: $vm.password)

            SecondaryButton(content: "Sign in", state: vm.isValid)
                .disabled(!vm.isValid)
                .onTapGesture { 
                    if(vm.isValid){
                        vm.authenticate()
                    }
                }
            Spacer()
        }.padding()
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
