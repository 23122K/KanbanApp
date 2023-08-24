//
//  ContentView.swift
//  KanbanToDoApp_project
//
//  Created by Patryk Maciąg on 31/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ViewModel()
    @State private var isPresneted: Bool = false
    var body: some View {
        switch(vm.isAuthenticated){
        case false:
            WelcomePageView()
        case true:
            AuthenticatedUserView()
                .environmentObject(vm)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
