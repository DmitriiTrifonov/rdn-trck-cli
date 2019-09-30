//
//  Note.swift
//  rdn trck
//
//  Created by Dmitriy Trifonov on 18/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation


struct RdnActivity : Codable {
    let id: String
    let date: Date
    var firstPage: Int
    var lastPage: Int
    let pages: Int
    let title: String?
    let text: String?
    
    init(id: String = UUID().uuidString,
         date: Date = Date(),
         firstPage:Int,
         pages: Int,
         title: String?,
         text: String?){
        self.id = id
        self.date = date
        self.firstPage = firstPage
        self.lastPage = firstPage + pages
        self.pages = pages
        self.title = title
        self.text = text
    }
    
    init(id: String = UUID().uuidString,
         date: Date = Date(),
        firstPage:Int,
        lastPage: Int,
        title: String?,
        text: String?){
        self.id = id
        self.date = date
        self.firstPage = firstPage
        self.lastPage = lastPage
        self.pages = lastPage - firstPage
        self.title = title
        self.text = text
    }
    
    
}
