//
//  ReadingBoard.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 11.11.2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation


class ReadingBoard: Codable {
    
    var activities: [Reading]
    
    init() {
        self.activities = []
    }
    
    func add(_ reading: Reading) {
        activities.append(reading)
    }
    
    func remove(_ reading: Reading) {
        activities.removeAll { $0.id == reading.id }
    }
    
    func encode() -> Data {
        return try! JSONEncoder().encode(self)
    }
    
    static func decode(json: Data) -> ReadingBoard {
        let decoder = JSONDecoder()
        return try! decoder.decode(ReadingBoard.self, from: json)
    }
    
    
    
}
