//
//  SignInViewModel.swift
//  KanbanToDoApp
//
//  Created by Patryk Maciąg on 15/05/2023.
//

import SwiftUI
import Combine


class TaskFormViewModel: ObservableObject {
    @Injected(\.model) var model
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Input
    @Published var TaskTitle: String = ""
    @Published var TaskDetails: String = ""
    @Published var TaskType: String = ""
    @Published var TaskPriority: String = ""
    
    //MARK: - Form validation
    var isValid: Bool {
        if (Validator.isValidString(TaskTitle) && Validator.isValidString(TaskDetails) && Validator.isValidString(TaskType) && Validator.isValidString(TaskPriority)) {
            return true
        }
        
        return false
    }
    
    //MARK: - Model functions
    func createTask() {
        model.createTask(title: TaskTitle, details: TaskDetails, type: TaskType, priority: TaskPriority)
    }

    //MARK: Initializer
    init() { }
    
    
}
