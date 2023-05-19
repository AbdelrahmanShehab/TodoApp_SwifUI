//
//  ListRowView.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import SwiftUI

struct ListRowView: View {
    // MARK: -  PROPERTY
    let item: ItemModel
    
    // MARK: -  BODY
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }//: HSTACK
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(Title: "Item 1", IsCompleted: true)
    static var item2 = ItemModel(Title: "Item 2", IsCompleted: false)
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
