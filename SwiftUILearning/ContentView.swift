//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Shireesh Marla on 25/11/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(fetchRequest: ToDoListItem.getAllTodoListItems()) var items: FetchedResults<ToDoListItem>

    @State var text:String = ""

    var body: some View {
        NavigationView{
            List{
                Section(header: Text("New Item")){
                    HStack{
                        TextField("Enter new item...", text: $text)
                        Button(action: {
                            if (!text.isEmpty){
                                let newItem =
                                ToDoListItem(context: viewContext)
                                newItem.name = text
                                newItem.createdAt = Date()
                                do{
                                    try viewContext.save()
                                }catch{
                                    print(error)
                                }
                                text = ""
                            }
                        },
                        label: {
                            Text("Save")
                        })
                    }
                }
                Section {
                    ForEach(items) { todoListItem in
                        VStack(alignment: .leading) {
                            Text(todoListItem.name!)
                                .font(.headline)
                            Text("\(todoListItem.createdAt!)")
                        }
                    }.onDelete(perform: { indexSet in
                        guard let index = indexSet.first else {
                            return
                        }
                        let itemToDelete = items[index]
                        viewContext.delete(itemToDelete)
                        do{
                            try viewContext.save()
                        }catch {
                            print(error)
                        }
                    })
                    
                }
            }.navigationTitle("ToDo List")
        }
        
    }

   

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
