//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by Wade, Sebastian (WING) on 06/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import Foundation

class DivisionFactory {
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        for i in 1...size {
            let student = Student(forename: "Forename\(i)", surname: "surname\(i)", birthday: Date.init())
            division.students.append(student)
        }
        return division
    }
    
    static func createDivisions() -> [Division] {
        var divisions: [Division] = []
        divisions.append(createDivision(code: "vCX-1", of: 8))
        divisions.append(createDivision(code: "vBX-2", of: 4))
        divisions.append(createDivision(code: "vDY-1", of: 16))
        divisions.append(createDivision(code: "vFH-1", of: 20))
        return divisions
    }
}
