//
//  main.swift
//  rdn-trck-cli
//
//  Created by Dmitriy Trifonov on 26/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation

var book = Book(title: "The life of Sklaga", authors: ["Kichan", "Vityan"], totalPages: 141)


book.addNote(date: Date(), pages: 21, text: "Hello, Bookreader!")


book.addNote(date: Date(), pages: 150, text: "Sklaga is good")


if let key = book.notes.keys.first {
    print(key)
    book.removeNote(withId: key)
}

let bookString = String(bytes: book.encode(), encoding: .utf8)
print(bookString ?? "Jopics")




