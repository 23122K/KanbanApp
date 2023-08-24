//
//  User+CoreDataProperties.swift
//  KanbanToDoApp_project
//
//  Created by Patryk Maciąg on 01/06/2023.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: UUID
    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var email: String
    @NSManaged public var password: String
    @NSManaged public var task: NSSet
    public var tasks: Array<Task> {
        let set = task as? Set<Task> ?? []
        return set.sorted(by: { $0.id < $1.id })
    }
    
    public var initials: String {
        return String(Array(firstName)[0]) + String(Array(lastName)[0])
    }

}

extension User {

    @objc(addTaskObject:)
    @NSManaged public func addToTask(_ value: Task)

    @objc(removeTaskObject:)
    @NSManaged public func removeFromTask(_ value: Task)

    @objc(addTask:)
    @NSManaged public func addToTask(_ values: NSSet)

    @objc(removeTask:)
    @NSManaged public func removeFromTask(_ values: NSSet)

}

extension User : Identifiable {

}
