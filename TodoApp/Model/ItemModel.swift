//
//  ItemModel.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(Id: String = UUID().uuidString, Title: String, IsCompleted: Bool) {
        self.id = Id
        self.title = Title
        self.isCompleted = IsCompleted
    }
    
    func updatedCompleted() -> ItemModel {
        return ItemModel(Id: id, Title: title, IsCompleted: !isCompleted)
    }
    
}
