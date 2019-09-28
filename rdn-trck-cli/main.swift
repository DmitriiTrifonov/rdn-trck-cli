//
//  main.swift
//  rdn-trck-cli
//
//  Created by Dmitriy Trifonov on 26/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation

func printBookTilles(books: [Book?]) {
    var c = 1
    for book in books {
        if let uBook = book {
            let authors = uBook.authors 
            print("\(c) -- \(uBook.title) by \(authors)")
            c += 1
        }
    }
}

var bookshelf = Bookshelf()

let book1 =  Book(title: "The life of Sklaga", authors: ["Kichan", "Vityan"], totalPages: 141)

let book2 = Book(title: "My Life", authors: ["Dmitrii Trifonov"], totalPages: 27)

let book3 = Book(title: "My Another Life", authors: ["Dmitrii Trifonov"], totalPages: 28)

bookshelf.add(with: book1)

bookshelf.add(with: book2)

bookshelf.add(with: book3)

print(bookshelf.books.count)

printBookTilles(books: bookshelf.books)

bookshelf.remove(with: bookshelf.books.first(where: { (b) -> Bool in
    b?.title == "My Life"
}) as! Book)

print(bookshelf.books.count)

bookshelf.remove(with: book3)

print(bookshelf.books.count)

print(bookshelf.books[0]!)


