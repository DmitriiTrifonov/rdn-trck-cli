//
//  FileUtil.swift
//  rdn-trck-cli
//
//  Created by Dmitriy Trifonov on 29/09/2019.
//  Copyright © 2019 mitya1234. All rights reserved.
//

import Foundation


class FileUtil {
    static func loadFile() -> Data? {
        let path = "/Library/Caches/com.mitya1234.rnd-trck-cli/bkshlf.json"
        let fm = FileManager()
        if (fm.fileExists(atPath: path)) {
            let fh = FileHandle(forReadingAtPath: path)?.readDataToEndOfFile()
            return fh
        } else {
            return nil
        }
    }
    
    static func saveFile(json: Data) {
        let fileManager = FileManager.default
        let filename = "bkshlf.json"
        let appFolder = "com.mitya1234.rnd-trck-cli"
        
        let cachesURL = try! fileManager.url(for: .cachesDirectory, in: .localDomainMask, appropriateFor: nil, create: true)
        //print(cachesURL.path)
        let folderURL = cachesURL.appendingPathComponent(appFolder, isDirectory: true)
        //print(folderURL.path)
        let fileURL = folderURL.appendingPathComponent(filename, isDirectory: false)
        //print(fileURL.path)
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
