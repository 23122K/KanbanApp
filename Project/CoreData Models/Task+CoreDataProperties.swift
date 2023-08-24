//
//  Task+CoreDataProperties.swift
//  KanbanToDoApp
//
//  Created by Patryk Maciąg on 23/08/2023.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var details: String
    @NSManaged public var priority: String
    @NSManaged public var status: String
    @NSManaged public var title: String
    @NSManaged public var type: String
    @NSManaged public var comment: NSSet?
    @NSManaged public var user: User?
    
    public var comments: Array<Comment> {
        let set = comment as? Set<Comment> ?? []
        return set.sorted(by: { $0.content < $1.content })
    }

}

// MARK: Generated accessors for comment
extension Task {

    @objc(addCommentObject:)
    @NSManaged public func addToComment(_ value: Comment)

    @objc(removeCommentObject:)
    @NSManaged public func removeFromComment(_ value: Comment)

    @objc(addComment:)
    @NSManaged public func addToComment(_ values: NSSet)

    @objc(removeComment:)
    @NSManaged public func removeFromComment(_ values: NSSet)

}

extension Task : Identifiable {

}
