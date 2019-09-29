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
        let path = "/Library/Caches/com.mitya1234.rnd-trck-cli/bkshlf.json"
        let fm = FileManager()
        let fh = FileHandle(forReadingAtPath: path)
        if (fm.fileExists(atPath: path)) {
            fh?.write(json)
            print("has file")
        } else {
            try? fm.createDirectory(atPath: "/Library/Caches/com.mitya1234.rnd-trck-cli/", withIntermediateDirectories: false, attributes: nil)
            fm.createFile(atPath: path, contents: json, attributes: nil)
            print("no file")
        }
    }
}
