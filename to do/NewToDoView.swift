//
//  NewToDoView.swift
//  to do
//
//  Created by Kennedy Miller on 6/13/23.
//

import SwiftUI

struct NewToDoView: View {
    @State var title: String
    @State var isImportant: Bool
    var body: some View {
        VStack{
            Text("Add a new task")
            .font(.title)
            .fontWeight(.bold)
        TextField("Enter task description", text: $title)
            // $ represents 2 way binding; reads value and update varibale at the same time
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
                .padding()
            
        Toggle(isOn: $isImportant) {
            Text("Is it important?")
            }
        .padding()
    Button(action: {
              
    }) {
        Text("Add")
            }
        .padding()
        .background(Color(.systemGroupedBackground))
        .cornerRadius(15)
        .padding()
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title : " ", isImportant: false)
    }
}
