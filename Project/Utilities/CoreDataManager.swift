import CoreData
import Foundation

class CoreDataManager {
    fileprivate let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func persist() {
        do { try context.save() } catch {
            context.rollback()
        }
    }
    
    //MARK: TaskManagedObject Functions
    func removeTask(task: Task){
        context.delete(task)
        persist()
    }
    
    func updateTaskStatus(task: Task, new status: String) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "self IN %@", [task.objectID])
        let result = try? context.fetch(fetchRequest)
        
        guard let result = result?.first else {
            return
        }
        
        result.status = status
        persist()
    }
    
    func fetchAllTasks() -> Array<Task> {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let result = try? context.fetch(fetchRequest)
        
        guard let result = result, !result.isEmpty else {
            return []
        }
        return result
    }
    
    func createNewTask(title: String, details: String, type: String, priority: String) {
        let Task = Task(context: context)
        Task.title = title
        Task.details = details
        Task.type = type
        Task.priority = priority
        Task.status = "To do"
        persist()
    }
    
    
    func assignTaskTo(user: User, task: Task) {
        user.addToTask(task)
        persist()
    }
    
    //MARK: CommentManagedObject Functions
    func addComment(to task: Task, with content: String, by user: User){
        guard let asigeee = task.user else {
            return
        }
        
        let comment = Comment(context: context)
        comment.content = content
        comment.sendBy = user.id
        comment.sendAt = Date()
        
        switch(asigeee.id == user.id){
        case true: comment.isSedner = false
        case false: comment.isSedner = true
        }
        
        task.addToComment(comment)
        persist()
    }
    
    func fetchAllComments(from task: Task) -> Array<Comment> {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "self IN %@", [task.objectID])
        let result = try? context.fetch(fetchRequest)
        
        guard let result = result?.first else {
            return []
        }
        
        return result.comments.sorted{ $0.sendAt < $1.sendAt}
    }
    
    
    //MARK: UserManagedObject Functions
    
    func fetchAllUsers() -> Array<User> {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let result = try? context.fetch(fetchRequest)
        
        guard let result = result, !result.isEmpty else {
            return []
        }
        return result
    }
    
    func createUser(firstName: String, lastName: String, email: String, password: String) {
        let user = User(context: context)
        user.id = UUID()
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        persist()
    }
    
    func doesUserExist(email: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let result = try? context.fetch(fetchRequest)
        
        guard let result = result, !result.isEmpty else {
            return false
        }
        
        return true
    }
    
    
    func authenticate(with email: String, and password: String) -> User? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        let result = try? context.fetch(fetchRequest)

        guard let user = result?.first, user.password == password else {
            return nil
        }
        
        return user
    }
    
    //MARK: Initializer
    init(){
        persistentContainer = NSPersistentContainer(name: "Model")
        persistentContainer.loadPersistentStores { description, error in
            if let _ = error {
                return
            }

            self.persistentContainer.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
