//
//  Book.swift
//  rdn trck
//
//  Created by Dmitriy Trifonov on 18/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation


struct Book: Codable {
    let id: String
    let title: String
    let authors: [String?]
    let description: String?
    let year: String?
    let publisher: String?
    let edition: Int?
    let isbn: String?
    let totalPages: Int
    var currentPage: Int
    var activities: [RdnActivity]
    
    
    init(id: String = UUID().uuidString,
         title: String, authors: [String?],
         description: String? = nil, year: String? = nil,
         publisher: String? = nil, edition: Int? = nil, isbn: String? = nil,
         totalPages: Int, currentPage: Int = 1,
         acts: [RdnActivity] = []) {
        self.id = id
        self.title = title
        self.authors = authors
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.activities = acts
        self.description = description
        self.year = year
        self.publisher = publisher
        self.edition = edition
        self.isbn = isbn
    }
    
    mutating func updateCurrent(page: Int) {
        if (page > 0) {
            currentPage = page > totalPages ? totalPages : page
        }
    }
    
    mutating func add(activity: RdnActivity) {
        activities.append(activity)
    }
    
    mutating func remove(activity: RdnActivity) {
        activities.removeAll { (a) -> Bool in
            a.id == activity.id
        }
    }
    
}
