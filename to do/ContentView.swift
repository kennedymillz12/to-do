//
//  ContentView.swift
//  to do
//
//  Created by Kennedy Miller on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    @State var toDoItems: [ToDoItems] = []
    @State private var showNewTask = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Grind Time")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                
                Spacer()
                //button
                Button(action: {
                    self.showNewTask = true
                }) {
                    Text("+")
                }
            }
            .padding()
            Spacer()
            
            List {
                ForEach(toDoItems){toDoItems in
                    Text(toDoItems.title)
                    if toDoItems.isImportant == true {
                        Text("‼️" + toDoItems.title)
                    } else {
                        Text(toDoItems.title)
                    }
                }
            }
        }
            .padding()
            if showNewTask {
                NewToDoView(title: "", isImportant: false, toDoItems: .constant([]), showNewTask: $showNewTask)
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
