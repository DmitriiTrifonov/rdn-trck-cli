//
//  main.swift
//  rdn-trck-cli
//
//  Created by Dmitriy Trifonov on 26/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation

var book = Book(title: "The life of Sklaga", authors: ["Kichan", "Vityan"], totalPages: 141)

print(book)

book.updatePage(newCurrentPage: 3)

print(book)

book.updatePage(newCurrentPage: 63)

print(book)

book.updatePage(newCurrentPage: 150)

print(book)

