//
//  Comment+CoreDataProperties.swift
//  KanbanToDoApp_project
//
//  Created by Patryk Maciąg on 01/06/2023.
//
//

import Foundation
import CoreData


extension Comment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Comment> {
        return NSFetchRequest<Comment>(entityName: "Comment")
    }

    @NSManaged public var content: String
    @NSManaged public var sendBy: UUID
    @NSManaged public var isSedner: Bool
    @NSManaged public var sendAt: Date
    @NSManaged public var task: Task?

}

extension Comment : Identifiable {

}
