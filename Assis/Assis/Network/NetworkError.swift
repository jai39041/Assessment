//
//  NetworkError.swift
//  Assis
//
//  Created by jai prakash on 25/05/24.
//

import Foundation


enum NetworkError: Error {
    case badURL
    case requestFailed
    case decodingFailed
}
