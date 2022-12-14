//
//  SampleWork.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-14.
//

import Foundation

struct SampleWork: Identifiable {
    var id = UUID()
    var name: String
    var description: String
}

struct SampleWorkData {
    static let sampleWork: [SampleWork] = [
        SampleWork(name: "Matched Geometry", description: "The matchedGeometryEffect() modifier was used on several views in this example. It allows the seamless animation of a view appearing at two different locations in the view hierachy. For example, the sofa image, name, price and rating all animate to different positions when the details view is opened."),
        SampleWork(name: "Custom Progress Bar", description: "With the use of the trim modifier and geometry reader, custom Progress Bars were designed in both circular and linear forms."),
        SampleWork(name: "Search bar", description: "Searchbar added to View and demonstrated searching list..."),
        SampleWork(name: "Geometry Reader", description: "The view that allows us to read its geometry and layout child views manually."),
        SampleWork(name: "Progress bar", description: "Animated progress bars in different designs"),
        SampleWork(name: "Sign in view", description: "A visually attractive sign in view"),
    ]
}
