//
//  Handbook.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import SwiftUI

struct Handbook: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var logo: String
    var image: String
    var colorTop: Color
    var colorBottom: Color
}


