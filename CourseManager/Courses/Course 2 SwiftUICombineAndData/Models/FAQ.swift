//
//  FAQ.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-24.
//

import Foundation

struct FAQ: Identifiable, Decodable {
    var id: Int
    var question: String
    var answer: String
}
