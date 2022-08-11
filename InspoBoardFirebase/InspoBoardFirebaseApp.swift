//
//  InspoBoardFirebaseApp.swift
//  InspoBoardFirebase
//
//  Created by Kelsey Steven on 8/10/22.
//

import SwiftUI
import Firebase

@main
struct InspoBoardFirebaseApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
