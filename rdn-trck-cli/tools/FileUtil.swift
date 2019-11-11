//
//  FileUtil.swift
//  rdn-trck-cli
//
//  Created by Dmitrii Trifonov on 29/09/2019.
//  Copyright © 2019 Dmitrii Trifonov. All rights reserved.
//

import Foundation


class FileUtil {
    static let fileManager = FileManager.default
    static var filename = ""
    static let appFolder = "com.mitya1234.rnd-trck-cli"
    static let cachesURL = try! fileManager.url(for: .cachesDirectory, in: .localDomainMask, appropriateFor: nil, create: true)
    static let folderURL = cachesURL.appendingPathComponent(appFolder, isDirectory: true)
    static var fileURL = folderURL.appendingPathComponent(filename, isDirectory: false)
    
    static func loadFile() -> Data? {
        print("case00")
        var output:Data? = nil
        var isDir : ObjCBool = false
        if (fileManager.fileExists(atPath: folderURL.path, isDirectory: &isDir)) {
            print("case01")
            if (isDir.boolValue) {
                print("case02")
                if (fileManager.fileExists(atPath: fileURL.path)) {
                    do {
                        output = try Data(contentsOf: fileURL)
                        print("case03")
                    } catch {
                        output = nil
                        print("case04")
                    }
                }
            }
        }
        return output
    }
    
    static func saveFile(json: Data) {
        var isDir : ObjCBool = false
        if (fileManager.fileExists(atPath: folderURL.path, isDirectory: &isDir)) {
            if (isDir.boolValue) {
                if (fileManager.fileExists(atPath: fileURL.path)) {
                    try? json.write(to: fileURL)
                } else {
                    fileManager.createFile(atPath: fileURL.path, contents: json, attributes: nil)
                }
            }
        } else {
            try? fileManager.createDirectory(atPath: folderURL.path, withIntermediateDirectories: false, attributes: nil)
            fileManager.createFile(atPath: fileURL.path, contents: json, attributes: nil)
        }
        
        
    }
}
