//
//  Note.swift
//  rdn trck
//
//  Created by Dmitrii Trifonov on 18/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation


struct Reading : Codable {
    let id: String
    let date: Date
    var firstPage: Int
    var lastPage: Int
    let pages: Int
    let title: String?
    let text: String?
    let bookId: String
    
    init(id: String = UUID().uuidString,
         date: Date = Date(),
         firstPage:Int,
         pages: Int,
         title: String?,
         text: String?,
        bookId: String){
        self.id = id
        self.date = date
        self.firstPage = firstPage
        self.lastPage = firstPage + pages
        self.pages = pages
        self.title = title
        self.text = text
        self.bookId = bookId
    }
    
    init(id: String = UUID().uuidString,
         date: Date = Date(),
        firstPage:Int,
        lastPage: Int,
        title: String?,
        text: String?,
        bookId: String){
        self.id = id
        self.date = date
        self.firstPage = firstPage
        self.lastPage = lastPage
        self.pages = lastPage - firstPage
        self.title = title
        self.text = text
        self.bookId = bookId
    }
    
    
}

extension Reading : CommandLineView {
    typealias T = Reading
    static func createCLI<T>() -> T {
        // TODO – make an cli input
        let activity = Reading(id: "", date: Date(), firstPage: 1, lastPage: 2, title: "", text: "", bookId: "fddfdf")
        return activity as! T
    }
}
