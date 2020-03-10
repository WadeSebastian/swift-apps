//
//  UserDocumentManager.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 09/03/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class UserDocumentManager {
    
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
