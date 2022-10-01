//
//  CourseInformation.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import FirebaseFirestoreSwift
import Foundation

struct CourseInformation: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var url: String
    // var status: Status
    var dateOfCompletion: Date?
    var comments: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case dateOfCompletion
        case comments
    }
}

enum Status: Codable {
    case todo
    case inProgress
    case complete
}
