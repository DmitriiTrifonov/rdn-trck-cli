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
    let pages: String
    let text: String
    
    init(id: String = UUID().uuidString,
         date: Date = Date(),pages: String,
         text: String){
        self.id = id
        self.date = date
        self.pages = pages
        self.text = text
    }
}
