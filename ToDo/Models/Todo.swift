//
//  Todo.swift
//  ToDo
//
//  Created by hyrf on 24/07/2024.
//

import Foundation
import SwiftData

@Model
final class Todo: Identifiable {
    @Attribute(.unique) public let id: UUID
    var name: String
    var startDate: String
    var isEnd: Bool
    
    @Relationship()
    var tags: [Tag]? = []
    
    init(id: UUID = .init(), name: String) {
        self.id = id
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
