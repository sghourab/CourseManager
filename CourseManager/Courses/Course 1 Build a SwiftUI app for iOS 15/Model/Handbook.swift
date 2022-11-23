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

var handbooks = [
    Handbook(title: "SwiftUI Handbook", subtitle: "80 sections - 9 hours", text: "A comprehensive series of tutorials covering Xcode, SwiftUI and all the layout and development techniques", logo: "Logo 1", image: "Illustration 1", colorTop: .teal, colorBottom: .blue),
    Handbook(title: "React Advanced Handbook", subtitle: "30 sections - 3 hours", text: "A comprehensive guide for an overview of the React library and all its basics", logo: "Logo 1", image: "Illustration 2", colorTop: .purple, colorBottom: .pink)
]
