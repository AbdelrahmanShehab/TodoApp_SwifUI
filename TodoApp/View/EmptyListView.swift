//
//  EmptyListView.swift
//  TodoApp
//
//  Created by Abdelrahman Shehab on 04/05/2023.
//

import SwiftUI

struct EmptyListView: View {
    // MARK: -  PROPERTY
    @State private var animate: Bool = false
    
    // MARK: -  FUNCTION
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
    
    // MARK: -  BODY
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                Text("There are no items here!!")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Be more productive and add some todos to finish them on time !!")
                    .font(.callout)
                    .padding(.bottom, 15)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something here 😁")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(
                            animate ? Color("NewColor") : Color.accentColor
                        )
                        .cornerRadius(10)
                    
                }//: NAVIGATION LINK
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color("NewColor").opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 20 : 40, x: 0, y: animate ? 40 : 20)
                .offset(y: animate ? -7 : 0)
            }//: VSTACK
            .multilineTextAlignment(.center)
            .padding(25)
            .onAppear(perform: addAnimation)
        }//: SCROLL
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
