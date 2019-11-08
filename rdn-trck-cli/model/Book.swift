//
//  Book.swift
//  rdn trck
//
//  Created by Dmitrii Trifonov on 18/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation


struct Book: Codable {
    let id: String
    let title: String
    let authors: [String]?
    let description: String?
    let year: String?
    let publisher: String?
    let edition: Int?
    let isbn: String?
    let totalPages: Int
    var currentPage: Int
    
    
    init(id: String = UUID().uuidString,
         title: String, authors: [String]?,
         description: String? = nil, year: String? = nil,
         publisher: String? = nil, edition: Int? = nil, isbn: String? = nil,
         totalPages: Int, currentPage: Int = 1) {
        self.id = id
        self.title = title
        self.authors = authors
        self.totalPages = totalPages
        self.currentPage = currentPage
        self.description = description
        self.year = year
        self.publisher = publisher
        self.edition = edition
        self.isbn = isbn
    }
    
    mutating func updateCurrent(page: Int) {
        if (page > 0) {
            currentPage = page > totalPages ? totalPages : page
        }
    }
    
}


extension Book : CommandLineView {
    typealias T = Book
    static func createCLI<T>() -> T {
        print("Enter the title:")
        let bookTitle = readLine() ?? "The Book Title"
        print("Enter the authors separated by comma and space [Example: John Appleseed, John Smith]:")
        let bookAuthors = readLine()?.components(separatedBy: ", ") // TODO Another split mechanism
        print("Enter the book description:")
        let bookDesc = readLine()
        print("Enter the book release year:")
        let bookYear = readLine()
        print("Enter the book publisher:")
        let bookPubl = readLine()
        print("Enter the book edition:")
        let bookEd = readLine()
        print("Enter the book ISBN:")
        let bookISBN = readLine()
        print("Enter the book total number of pages:")
        let bookTotalPages = Int(readLine() ?? "0")
        let book = Book(title: bookTitle,
                        authors: bookAuthors,
                        description: bookDesc == "" ? nil : bookDesc,
                        year: bookYear == "" ? nil : bookYear,
                        publisher: bookPubl == "" ? nil : bookPubl,
                        edition: bookEd == "" ? nil : Int(bookEd ?? "0"),
                        isbn: bookISBN == "" ? nil : bookISBN,
                        totalPages: bookTotalPages ?? 1)
        print("Created a new book \(book.title) and id \(book.id)")
        return book as! T
    }
    
}


extension Array where Element == Book {
    
    func first(by id: String) -> Book? {
        return self.first(where: { $0.id == id })
    }
    
    func findBookBy(title: String) -> Book? {
        return self.first(where: { $0.title == title })
    }
}
