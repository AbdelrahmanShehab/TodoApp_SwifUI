//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet {
            // CODE
        }
    }
    
    let itemsKeys: String = "items_List"
    
    init() {
        getItems()
    }
    
    // RENDERING THE ITEMS TO THE LIST
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemsKeys) else { return }
        guard let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        self.items = savedItem
    }
    
    // SAVING ITEMS IN THE LIST
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKeys)
        }
    }
    
    // ADDING ITEM TO THE LIST
    func addItem(title: String) {
        let newItem = ItemModel(Title: title, IsCompleted: false)
        items.append(newItem)
    }
    
    // UPDATING ITEMS IN THE LIST
    func update(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updatedCompleted()
        }
    }
    
    // DELETING ITEM FROM THE LIST
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // MOVING ITEM IN THE LIST
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

