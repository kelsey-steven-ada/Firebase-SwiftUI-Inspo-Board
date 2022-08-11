//
//  Board.swift
//  InspoBoard (iOS)
//
//  Created by Kelsey Steven on 8/3/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Board: Codable {
    let board_name: String
    let cards: [String]
}
