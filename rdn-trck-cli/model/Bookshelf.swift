//
//  Bookshelf.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 27/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation

class Bookshelf : Codable {
    var books: [Book?]
    
    init() {
        self.books = []
    }
    
    func add(with title: Book?) {
        books.append(title)
    }
    
    func remove(with title: Book) {
        books.removeAll { (b) -> Bool in
            b?.id == title.id
        }
    }
    
    func encode() -> Data {
        return try! JSONEncoder().encode(self)
    }
    
    static func decode(json: Data) -> Bookshelf {
        let decoder = JSONDecoder()
        return try! decoder.decode(Bookshelf.self, from: json)
    }
    
    func printBooksUpwards() {
        print("The bookshelf has got this books:")
        for (index, element) in books.enumerated() {
            print("\(index+1) -- \(element?.title ?? "nil")")
        }
        print()
    }
    
    
}
