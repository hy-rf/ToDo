//
//  Todo.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import SwiftData
import Foundation

@Model
final class Todo {
    var name: String
    var startDate: Date
    var isEnd: Bool
    
    init(name: String) {
        self.name = name
        self.startDate = Date()
        self.isEnd = false
    }
}
