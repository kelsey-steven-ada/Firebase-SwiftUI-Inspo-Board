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
                // Print the data from the network response before transforming
                print("\(document.documentID) => \(document.data())")
                
                do {
                    // Try to transform a document into an Owner model
                    return try document.data(as: Owner.self)
                }
                catch {
                    // Print the error and return nil if we could
                    // not transform the document data
                    print(error)
                    return nil
                }
            }
            
            // Print transformed objects to console
            print("Owners: ", self.owners)
        }
    }
}
