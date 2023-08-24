import Foundation
import Combine

class Model: ObservableObject {
    private var boards = ["To do", "In progress", "Done"]
    private var cancellables = Set<AnyCancellable>()
    private var coreDataManager: CoreDataManager
    
    //MARK: Properties used to drive ui
    @Published private(set) var user: User?
    @Published private(set) var Tasks = Array<Task>()
    @Published private(set) var comments = Array<Comment>()
    @Published private(set) var teamMembers = Array<User>()
    
    var isAuthenticated: Bool {
        if let _ = user {
            return true
        }
        
        return false
    }
    
    func getBoardNames() -> Array<String> {
        return boards
    }
    
    private func doesUserExist(with emial: String) -> Bool {
        coreDataManager.doesUserExist(email: emial)
    }

    
    //MARK: - CoreDataManager functions
    func register(firstName: String, lastName: String, email: String, password: String) {
        if !doesUserExist(with: email) {
            coreDataManager.createUser(firstName: firstName, lastName: lastName, email: email, password: password)
        }
    }
    
    func authenticate(email: String, password: String){
        if doesUserExist(with: email) {
            self.user = coreDataManager.authenticate(with: email, and: password)
        }
    }
    
    func signOut() {
        self.user = nil
    }
    
    func assignUserToTask(task: Task) {
        guard let user = user else {
            return
        }
        
        coreDataManager.assignTaskTo(user: user, task: task)
    }
    
    func createTask(title: String, details: String, type: String, priority: String) {
        coreDataManager.createNewTask(title: title, details: details, type: type, priority: priority)
        fetchAllTasks()
    }
    
    func removeTask(task: Task){
        coreDataManager.removeTask(task: task)
        fetchAllTasks()
    }
    
    func fetchAllTasks() {
        self.Tasks = coreDataManager.fetchAllTasks()
    }
    
    func updateTaskStatus(task: Task, status: String) {
        coreDataManager.updateTaskStatus(task: task, new: status)
        fetchAllTasks()
    }
    
    func fetchComments(task: Task) {
        self.comments = coreDataManager.fetchAllComments(from: task)
    }
    
    func fetchAllUsers() {
        self.teamMembers = coreDataManager.fetchAllUsers()
    }
    
    func addComment(task: Task, content: String){
        coreDataManager.addComment(to: task, with: content, by: user!)
    }
    
    
    init() {
        self.coreDataManager = CoreDataManager()
    }
}
