//
//  main.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 26/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation

var bkshlf = Bookshelf()
var rdnbrd = ReadingBoard()
let bkshlfFileName = "bkshlf.json"
let rdnbrdFileName = "rndbrd.json"

func loadBookShelf() {
    FileUtil.filename = bkshlfFileName
    if let data = FileUtil.loadFile() {
        bkshlf = Bookshelf.decode(json: data)
    }
}

func loadReadingBoard() {
    FileUtil.filename = rdnbrdFileName
    if let data = FileUtil.loadFile() {
        rdnbrd = ReadingBoard.decode(json: data)
    }
}

print("Welcome to rdn trck cli")
print("Please type add book to add the new book or add reading for adding reading activity")

loadBookShelf()

print(bkshlf)

print(bkshlf.books)


var loop = true
while(loop){
    let input = readLine() ?? "error"
    switch (input) {
    case("add book"):
        let book: Book = Book.createCLI()
        bkshlf.add(book)
        FileUtil.filename = bkshlfFileName
        FileUtil.saveFile(json: bkshlf.encode())
    case("add reading"):
        let reading: Reading = Reading.createCLI()
        rdnbrd.add(reading)
        FileUtil.filename = rdnbrdFileName
        FileUtil.saveFile(json: rdnbrd.encode())
    case("exit"):
        loop = false
    default:
        print("Incorrect input. Please try again")
    }
}







