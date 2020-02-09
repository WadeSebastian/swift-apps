//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 09/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var absent: [Student] = []
    var selectedRows: [IndexPath]? 
    
    init(date: Date) {
        takenOn = date
    }
}
