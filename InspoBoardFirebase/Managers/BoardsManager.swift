//
//  BoardsManager.swift
//  InspoBoardFirebase
//
//  Created by Kelsey Steven on 8/10/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class BoardsManager: ObservableObject {
//    @Published private(set) var owners: [Owner] = []
    @Published var owners = [Owner]()

    // Create an instance of our Firestore database
    private var db = Firestore.firestore()
    
    init() {
        getBoards()
    }
    
    // Read message from Firestore in real-time with the addSnapShotListener
    func getBoards() {
        db.collection("owners").getDocuments() { (querySnapshot, error) in
            // Error fetching docs
            guard error == nil else {
                print("Error getting documents: \(error!)")
                return
            }
            
            // No error, but no docs were found
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            // Transform docs and store them to `owners`
            self.owners = documents.compactMap { (document) -> Owner? in
                print("\(document.documentID) => \(document.data())")
                do {
                  return try document.data(as: Owner.self)
                }
                catch {
                  print(error)
                }
                
                return nil // Could not transform owner
            }
            
            
            print("Owners: ", self.owners)
        }
    }
}
