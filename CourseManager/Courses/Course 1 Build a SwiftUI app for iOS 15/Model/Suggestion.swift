//
//  Suggestion.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-10-12.
//

import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}

var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]
