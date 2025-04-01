//
//  ListViewModel.swift
//  ListProject
//
//  Created by Mina Malak on 30/03/2025.
//

import Combine

class ListViewModel: ObservableObject {
    @Published var items: [ListItem] = [
        ListItem(id: "1", imageName: "mina", title: "test", desc: "")
    ]
}
