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
    var title: String
    var detail: String
    var startDate: Date
    var isEnd: Bool
    
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        self.startDate = Date()
        self.isEnd = false
    }
}
