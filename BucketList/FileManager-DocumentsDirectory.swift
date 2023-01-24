//
//  FileManager-DocumentsDirectory.swift
//  Bucketlist
//
//  Created by Jake Quinter on 1/23/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
