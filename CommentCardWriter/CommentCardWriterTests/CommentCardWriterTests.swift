//
//  CommentCardWriterTests.swift
//  CommentCardWriterTests
//
//  Created by Wade, Sebastian (WING) on 11/02/2020.
//  Copyright © 2020 Wade, Sebastian (WING). All rights reserved.
//

import XCTest
@testable import CommentCardWriter

class CommentCardWriterTests: XCTestCase {

    func testCommentGeneratorWithWholeNumberValuesOfStudentEvaluationProducesComment() {
        //arrange
        let subject = "Mandarin"
        let teacher = "HJRM"
        let studentEvaluation = StudentEvaluation(enjoyment: 5.0, attainment: 2.0, difficulty: 3.0, topicsToImprove: "Timing, handwriting, accent")
        let expected = Comment(subject: subject, teacherInitials: teacher, content: "I am greatly enjoying Mandarin. I feel that I am performing somewhat poorly in class. I am finding the subject to be at a suitable level of difficulty. I think that I could improve in these areas: Timing, handwriting, accent.")
        //act
        let actual = CommentGenerator.generateComment(subject: subject, teacherInitials: teacher, studentEvaluation: studentEvaluation)
        //assert
        XCTAssertEqual(expected, actual)
    }
    
    func testCommentGeneratorWithFloatValuesOfStudentEvaluationProducesComment() {
        //arrange
        let subject = "Early Modern History"
        let teacher = "JDH"
        let studentEvaluation = StudentEvaluation(enjoyment: 3.7, attainment: 4.3, difficulty: 2.1, topicsToImprove: "Timing, handwriting, use of evidence")
        let expected = Comment(subject: subject, teacherInitials: teacher, content: "I am somewhat enjoying Early Modern History. I feel that I am performing well in class. I am finding the subject to be somewhat easy. I think that I could improve in these areas: Timing, handwriting, use of evidence.")
        //act
        let actual = CommentGenerator.generateComment(subject: subject, teacherInitials: teacher, studentEvaluation: studentEvaluation)
        //assert
        XCTAssertEqual(expected, actual)
    }
}
