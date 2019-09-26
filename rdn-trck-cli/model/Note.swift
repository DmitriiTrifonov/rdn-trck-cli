//
//  Note.swift
//  rdn trck
//
//  Created by Dmitriy Trifonov on 18/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation


struct Note {
    let id: String
    let date: Date
    var firstPage: Int
    var lastPage: Int
    let pages: Int
    let text: String?
    
    init(id: String = UUID().uuidString,
         date: Date = Date(),
         firstPage:Int = 0, // TODO
         lastPage: Int = 0, // TODO
         pages: Int,
         text: String? = nil){
        self.id = id
        self.date = date
        self.firstPage = firstPage
        self.lastPage = lastPage
        self.pages = pages
        self.text = text
    }
}
