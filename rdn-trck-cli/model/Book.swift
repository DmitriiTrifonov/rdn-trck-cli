//
//  Book.swift
//  rdn trck
//
//  Created by Dmitriy Trifonov on 18/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation


struct Book {
    let id: String
    let title: String
    let authors: [String?]
    let totalPages: Int
    var currentPage: Int
    var notes: [Note]?
    
    
    init(id: String = UUID().uuidString,
         title: String, authors: [String?],
         totalPages: Int, currentPage: Int = 1,
         notes: [Note]? = nil) {
        self.id = id
        self.title = title
        self.authors = authors
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.notes = notes
    }
    
    mutating func updatePage(newCurrentPage: Int) {
        currentPage = newCurrentPage > self.totalPages ? self.totalPages : newCurrentPage
    }
    
}
