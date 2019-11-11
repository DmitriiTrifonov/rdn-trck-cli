//
//  ComandLineView.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 07.11.2019.
//  Copyright © 2019 Dmitrii Trifonov All rights reserved.
//

import Foundation

protocol CommandLineView {
    associatedtype T
    static func createCLI<T>() -> T
}
