//
//  ToDoListItem.swift
//  SwiftUILearning
//
//  Created by Shireesh Marla on 25/11/2021.
//

import Foundation
import CoreData

class ToDoListItem: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    @NSManaged var createdAt: Date?
}

extension ToDoListItem {
    static func getAllTodoListItems() -> NSFetchRequest<ToDoListItem>{
        let request: NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest() as! NSFetchRequest<ToDoListItem>
        let sort = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}
