//
//  Data.swift
//  Vote-Prototype
//
//  Created by Matthew Soto on 11/2/20.
//

import Foundation

struct Results: Decodable {
    let value: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return datePublished
    }
    
    let name: String
    let url: String
    let datePublished: String
}

struct RepData: Decodable {
    let normalizedInput: Address
    let offices: [Office]
    let officials: [Official]
}

struct Address: Decodable {
    let state: String
}

struct Office: Decodable {
    let name: String
    let officialIndices: [Int]
}

struct Official: Decodable {
    let name: String
}
