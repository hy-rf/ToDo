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
    var startDate: String
    var isEnd: Bool
    
    init(name: String) {
        self.name = name
        self.startDate = {
            let dateFormatter = DateFormatter()
            dateFormatter.formatterBehavior = .default
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let UTCDate = Date()
            let date = dateFormatter.string(from: UTCDate)
            return date
        }()
        self.isEnd = false
    }
}
