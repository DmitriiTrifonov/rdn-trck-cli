//
//  main.swift
//  rdn-trck-cli
//
//  Created by Dmitriy Trifonov on 26/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation

var bkshlf = Bookshelf()

if let data = FileUtil.loadFile() {
    bkshlf = Bookshelf.decode(json: data)
}


print("Welcome to rdn trck cli")

print(bkshlf)

let act1 = RdnActivity(firstPage: 39, lastPage: 50, title: "Глава 2", text: nil)

bkshlf.books[0]?.add(activity: act1)


//let book1 = Book(title: "Kotlin в действии", authors: ["Дмитрий Жемеров", "Светлана Исакова"], totalPages: 402)
//
//bkshlf.add(with: book1)
//
//let book2 = Book(title: "The C Programming Language", authors: ["Brian W. Kernighan", "Dennis M. Ritchie"], totalPages: 288)
//
//bkshlf.add(with: book2)

print(bkshlf.books)
//
//let data = bkshlf.encode()
//
FileUtil.saveFile(json: bkshlf.encode())






