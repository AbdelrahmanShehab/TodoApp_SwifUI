//
//  ListView.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import SwiftUI

struct ListView: View {
    // MARK: -  PROPERTY
    @EnvironmentObject var listViewModel: ListViewModel
    
    // MARK: -  BODY
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                EmptyListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items, id: \.id) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation {
                                    listViewModel.update(item: item)
                                }
                            }
                    }//: LOOP
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }//: LIST
            }
        }//: ZSTACK
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
    }
}
