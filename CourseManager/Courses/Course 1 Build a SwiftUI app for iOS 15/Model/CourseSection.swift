//
//  CourseSection.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import Foundation

struct CourseSection: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
    var progress: CGFloat
}

