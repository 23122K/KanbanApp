//
//  MessageField.swift
//  Messenger
//
//  Created by Patryk Maciąg on 16/05/2023.
//

import SwiftUI

struct MessageField: View {

    @EnvironmentObject var vm: ViewModel
    let task: Task
    @Binding var content: String
    @State var isActive: Bool = false
    
    var body: some View {
        HStack(spacing: 25){
            if(isActive){
                Image(systemName: "chevron.right")
                    .bold()
                    .font(.system(size: 25))
                    .foregroundColor(.blue.opacity(0.9))
                    .onTapGesture {
                        isActive = false
                        content = ""
                    }
            }
           
            HStack(spacing: 5){
                TextField("Aa", text: $content)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .foregroundColor(.black.opacity(0.4))
            }
            .padding(.horizontal)
            .frame(height: 40)
            .background(content: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.4))
                    .shadow(color: .black.opacity(0.2), radius: 1)
            })
            .onTapGesture {
                isActive = true
            }
            
            if(isActive){
                Image("Send")
                    .onTapGesture {
                        vm.addComment(task: task, content: content)
                        content = ""
                        vm.fetchComments(task: task)
                    }
            }
        }
        .padding(.horizontal)
    }
}


