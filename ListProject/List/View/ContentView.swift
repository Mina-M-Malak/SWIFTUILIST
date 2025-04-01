//
//  ContentView.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject var viewModel = ListViewModel()
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.items) { (item) in
                HStack {
                    Image(systemName: item.imageName)
                        .frame(width: 40, height: 40)
                        .background(.blue)
                        .cornerRadius(8.0)
                    
                    Text(item.title)
                        .font(.headline)
                }
                .padding()
                //                .onDelete(perform: deleteItems)
                .navigationTitle("Item List")
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
