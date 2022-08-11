//
//  ContentView.swift
//  InspoBoardFirebase
//
//  Created by Kelsey Steven on 8/10/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = BoardsManager()
    @State private var selectedOwner: String? = nil

    
    var body: some View {
        NavigationView {
            List(viewModel.owners) { owner in
                Text(owner.user_name)
            }
            .navigationTitle("List")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
