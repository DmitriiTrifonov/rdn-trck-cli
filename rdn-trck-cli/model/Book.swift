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
    var notes: [String: Note]
    
    
    init(id: String = UUID().uuidString,
         title: String, authors: [String?],
         totalPages: Int, currentPage: Int = 1,
         notes: [String: Note] = [:]) {
        self.id = id
        self.title = title
        self.authors = authors
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.notes = notes
    }
    
    private mutating func updatePage(newCurrentPage: Int) {
        currentPage = newCurrentPage > self.totalPages ? self.totalPages : newCurrentPage
    }
    
    mutating func addNote(date: Date = Date(),pages: Int,
                          text: String? = nil) {
        let realPages = pages > totalPages ? pages - currentPage : pages
        let note = Note(date: date, pages: realPages, text: text) // Add normal init
        notes[note.id] = note
        updatePage(newCurrentPage: self.currentPage + pages)
    }
    
    mutating func removeNote(withId: String) {
        /*
        
         TODO
         
         If hash map contains only one pair then current page should revert to 1
         If hash map value has the biggest current page value then the current page should be currentPage - value.pages and the pair should be removed
         If hash map value has not the biggest current page value then the current page should be the same as before, but pages to the next bigger stop page value Note
 
        */
        
        
        // Replace this with changing values of the nearest Notes
        if let note = notes[withId] {
        notes[withId] = Note(id: withId, date: note.date, pages: note.pages, text: nil)
        }
        
    }
    
}
