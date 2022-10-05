//
//  CourseInformation.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-09-29.
//

import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct CourseInformation: Identifiable, Codable {
    @DocumentID var id: String? = UUID().uuidString
    var name: String
    var url: String
    var gitHubURL: String
    var status: Status
    var dateOfCompletion: Date
    var comments: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case gitHubURL
        case status
        case dateOfCompletion
        case comments
    }
}

enum Status: String, Codable, Equatable, CaseIterable {
    case todo = "To Do"
    case inProgress = "In Progress"
    case complete = "Complete"
    
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}
