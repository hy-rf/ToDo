//
//  Tag.swift
//  ToDo
//
//  Created by hyrf on 09/08/2024.
//

import Foundation
import SwiftData

@Model
final class Tag: Identifiable {
    @Attribute(.unique) public let id: UUID
    var name: String
    
    @Relationship()
    var todos: [Todo]? = []
    
    init(id: UUID = .init(), name: String) {
        self.id = id
        self.name = name
    }
}
