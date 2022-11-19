//
//  ModelPhotos.swift
//  Sfera_iOS_Test
//
//  Created by Shom on 19.11.2022.
//

import Foundation

struct ApiResponse: Codable {
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable {
    let id: String
    let urls: URLS
    let user: User
    let links: ResultLinks
    let likes: Int
    //let createdAt: Date
    //let updatedAt: Date

    
    enum CodingKeys: String, CodingKey {
        case id
        case urls
        case user
        case links
        case likes
        //case createdAt = "created_at"
        //case updatedAt = "updated_at"

    }
   

}


struct URLS: Codable {
    let regular: String
}

struct User: Codable {
    let location: String?
    let name: String
}

struct ResultLinks: Codable {
    let download: String
}
