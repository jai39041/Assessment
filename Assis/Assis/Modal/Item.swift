//
//  Item.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import Foundation


struct Item: Codable {
    let userID, id: Int?
    let title, body: String?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
        
    }
    
    // tdhasa
    
    //asasasas
    
    
    
}
