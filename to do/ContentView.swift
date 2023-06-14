//
//  ContentView.swift
//  to do
//
//  Created by Kennedy Miller on 6/13/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    //@State var toDoItems: [ToDoItems] = []
    @State private var showNewTask = false
    
    @FetchRequest(
        entity: ToDo.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDo.id, ascending: false) ])
    
    var toDoItems: FetchedResults<ToDo>
    
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
                    if toDoItems.isImportant == true {
                        Text("‼️" + (toDoItems.title ?? "No title"))
                    } else {
                        Text(toDoItems.title ?? "No title")
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        .padding()
        if showNewTask {
            NewToDoView(title: "", isImportant: false, toDoItems: .constant([]), showNewTask: $showNewTask)
        }
    }
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { toDoItems[$0] }.forEach(context.delete)
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
