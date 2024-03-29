//
//  Bookshelf.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 27/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation

class Bookshelf : Codable {
    var books: [Book]
    var activities: [RdnActivity]
    
    init() {
        self.books = []
        self.activities = []
    }
    
    func add(_ book: Book) {
        books.append(book)
    }
    
    func add(_ reading: RdnActivity) {
        activities.append(reading)
    }
    
    func remove(_ book: Book) {
        books.removeAll { (b) -> Bool in
            b.id == title.id
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
        // TODO -- Change to lambda if possible
        print("The bookshelf has got this books:")
        for (index, element) in books.enumerated() {
            print("\(index+1) -- \(element.title )")
        }
        print()
    }
    
}
