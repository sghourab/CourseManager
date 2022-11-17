//
//  Topic.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import Foundation

struct Topic: Identifiable {
    let id = UUID()
    var title: String
    var icon: String
}

var topics = [
    Topic(title: "iOS Development", icon: "iphone"),
    Topic(title: "UI Design", icon: "eyedropper"),
    Topic(title: "Web development", icon: "laptopcomputer")
]

