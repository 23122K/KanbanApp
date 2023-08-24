//
//  LoggedPersonView.swift
//  KanbanToDoApp
//
//  Created by Patryk Maciąg on 05/04/2023.
//

import SwiftUI

struct LoggedPersonView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var isPresented: Bool = false
    
    var body: some View {
        HStack{
            Spacer()
            Text("\(vm.user?.firstName ?? "Patryk") \(vm.user?.lastName ?? "Maciag")")
                .font(.headline)
                .bold()
                .padding(.horizontal, 10)
            AssignedPersonView(initials: vm.user?.initials ?? "XD", size: 40)
                .padding(.trailing, 25)
                .onLongPressGesture {
                    vm.signOut()
                }
        }
        .frame(height: 40)
    }
}

struct LoggedPersonView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedPersonView()
            .environmentObject(ViewModel())
    }
}
