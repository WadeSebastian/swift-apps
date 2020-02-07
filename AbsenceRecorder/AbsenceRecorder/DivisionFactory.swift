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
}
