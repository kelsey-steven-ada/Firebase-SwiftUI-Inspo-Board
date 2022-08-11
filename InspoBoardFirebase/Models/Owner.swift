//
//  Owner.swift
//  InspoBoardFirebase
//
//  Created by Kelsey Steven on 8/10/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Owner: Identifiable, Codable {
    @DocumentID var id: String?
    let user_name: String
    let boards: [Board]
}
