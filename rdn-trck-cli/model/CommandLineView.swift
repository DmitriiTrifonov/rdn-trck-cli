//
//  ComandLineView.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 07.11.2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation

protocol ComandLineView {
    associatedtype T
    static func createCLI<T>() -> T
}
