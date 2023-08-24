//
//  AuthenticatedUserView.swift
//  KanbanToDoApp_project
//
//  Created by Patryk Maciąg on 31/05/2023.
//

import SwiftUI

struct AuthenticatedUserView: View {
    @EnvironmentObject var vm: ViewModel
    @State private var isPresneted: Bool = false
    var body: some View {
        LoggedPersonView()
        BoardsView()
        .fullScreenCover(isPresented: $isPresneted, content: {
            TaskFormView()
        })
        .overlay(alignment: .bottom){
            Image(systemName: "plus.circle.fill")
                .foregroundColor(.blue.opacity(0.9))
                .font(.system(size: 50))
                .offset(y: -20)
                .onTapGesture {
                    isPresneted.toggle()
                }
        }
        .onAppear{
            vm.fetchTasks()
        }
    }
}

struct AuthenticatedUserView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticatedUserView()
            .environmentObject(ViewModel())
    }
}
