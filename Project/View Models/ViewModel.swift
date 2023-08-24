import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Injected(\.model) var model
    private var cancellabels = Set<AnyCancellable>()
    
    //MARK: - Properties driving UI
    var isAuthenticated: Bool {
        model.isAuthenticated
    }
    
    var Tasks: Array<Task> {
        model.Tasks
    }
    
    var teamMembers: Array<User> {
        return model.teamMembers
    }
    
    var comments: Array<Comment> {
        model.comments
    }
    
    var user: User? {
        model.user
    }
    
    //MARK: - Model functions
    func getBoardNames() -> Array<String> {
        model.getBoardNames()
    }
    
    func fetchTasks() {
        model.fetchAllTasks()
    }
    
    func removeTask(task: Task){
        model.removeTask(task: task)
    }
    
    func assignUserToTask(task: Task) {
        model.assignUserToTask(task: task)
    }
    
    func updateTaskStatus(task: Task, status: String){
        model.updateTaskStatus(task: task, status: status)
    }
    
    func signOut() {
        model.signOut()
    }
    
    func fetchComments(task: Task){
        model.fetchComments(task: task)
    }
    
    func addComment(task: Task, content: String){
        model.addComment(task: task, content: content)
    }
    
    func fetchTeamMembers() {
        model.fetchAllUsers()
    }
    
    //MARK: - Initializer watches for changes in model
    init(){
        model.$user
            .receive(on: DispatchQueue.main)
            .sink{ [weak self] _ in self?.objectWillChange.send() }
            .store(in: &cancellabels)
        
        model.$Tasks
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.objectWillChange.send() }
            .store(in: &cancellabels)
        
        model.$comments
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.objectWillChange.send() }
            .store(in: &cancellabels)
        
        model.$teamMembers
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in self?.objectWillChange.send() }
            .store(in: &cancellabels)
    }
}

