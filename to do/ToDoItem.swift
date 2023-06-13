//
//  ToDoItem.swift
//  to do
//
//  Created by Kennedy Miller on 6/13/23.
//

import Foundation

class ToDoItems: Identifiable {
    //properties
    var title = " "
    var isImportant = false
    var id = UUID()
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
        }
}
