//
//  AddView.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import SwiftUI

struct AddView: View {
    // MARK: -  PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var titleFieldText: String = ""
    @State private var alertTitle: String = ""
    @State private var showALert: Bool = false
    
    // MARK: -  FUNCTIONS
    func saveButtonTapped() {
        if textIsValid() {
            listViewModel.addItem(title: titleFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsValid() -> Bool {
        if titleFieldText.count < 3 {
            alertTitle = "Your todo item should contain atleast 3 characters 😟"
            showALert.toggle()
            return false
        }
        
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
    // MARK: -  BODY
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type Something Here...", text: $titleFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(
                        Color(hue: 0.621, saturation: 0.048, brightness: 0.916)
                    )
                    .cornerRadius(10)
                    .padding(.horizontal, 5)
                
                Button(
                    action: saveButtonTapped
                        , label: {
                            Text("Save".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                                .frame(height: 55)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(10)
                        })//: BUTTON
                
            }//: VSTACK
            .padding(16)
        }//: SCROLL
        .navigationTitle("Add an Item")
        .alert(isPresented: $showALert, content: getAlert
        )
    }
}

// MARK: -  PREVIEW
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
