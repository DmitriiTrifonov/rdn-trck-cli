//
//  main.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 26/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation

var bkshlf = Bookshelf()

func loadBookShelf() {
    if let data = FileUtil.loadFile() {
        bkshlf = Bookshelf.decode(json: data)
    }
}




print("Welcome to rdn trck cli")

print(bkshlf)

print(bkshlf.books)

let book: Book = Book.createCLI()

print(book)







