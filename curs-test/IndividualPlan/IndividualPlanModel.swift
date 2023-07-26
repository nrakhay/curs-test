//
//  Data.swift
//  curs-test
//
//  Created by Nurali Rakhay on 26.07.2023.
//

import Foundation
import UIKit

struct IndividualPlanModel: Codable {
    let IUPSid: String
    let Title: String
    let DocumentURL: String
    let AcademicYearId: String
    let AcademicYear: String
    let Semesters: [SemesterModel]

//    enum CodingKeys: String, CodingKey, Codable {
//        case IUPSid
//        case title = "Title"
//        case documentURL = "DocumentURL"
//        case academicYearId = "AcademicYearId"
//        case academicYear = "AcademicYear"
//        case semesters = "Semesters"
//    }
}

struct SemesterModel: Codable {
    let Number: String
    let Disciplines: [DisciplineModel]
    
//    enum CodingKeys: String, CodingKey {
//        case semesterNumber = "Number"
//        case disciplines = "Disciplines"
//    }
}

struct DisciplineModel: Codable {
    let DisciplineId: String
    let DisciplineName: DisciplineName
    let Lesson: [Lesson]
    
//    enum CodingKeys: String, CodingKey {
//        case disciplineId = "DisciplineId"
//        case disciplineName = "DisciplineName"
//        case lesson = "Lesson"
//    }
}

struct DisciplineName: Codable {
    let nameKk: String
    let nameRu: String
    let nameEn: String
}

struct Lesson: Codable {
    enum LessonTypeId: String, Codable {
        case lecture = "1", seminar = "2", laboratory = "3"
    }
    
    let Hours: String
    let RealHours: String
    
//    enum CodingKeys: String, CodingKey {
//        case lessonType = "LessonTypeId"
//        case designedHours = "Hours"
//        case realHours = "RealHours"
//    }
}



