//
//  SampleData.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-13.
//

import Foundation

struct SofaMockData {
    
    static let sofas : [Sofa] = [
        Sofa(title: "Diver Contemporary 2-piece Reversible Sectional", modelNumber: "1506357", price: "2,999.99", rating: 4.3, imagePlain: "sofa3Plain", imageWithBackground: "sofa3Background", info: "Upholstery: 100% polyester corduroy\nSolid wood and plywood construction\nSS-spring and webbing support"),
        Sofa(title: "Thomasville Contemporary 2-piece Sectional", modelNumber: "1570078", price: "1,999.99", rating: 3.2, imagePlain: "sofa1Plain", imageWithBackground: "sofa1Background", info: "Grey fabric upholstery\nTwo piece sectional plus ottoman\nStorage ottoman"),
        Sofa(title: "Annadale Contemporary 2-piece Fabric Sectional", modelNumber: "1414702", price: "2,149.99", rating: 2.5, imagePlain: "sofa2Plain", imageWithBackground: "sofa2Background", info: "Colour: grey\nFoam seat cushions\nPadded square arms\nSinuous spring suspension\nSolid wood legs – black")
    ]

}


struct CourseMockData {
    struct MockData {
        static let suggestions = [
            Suggestion(text: "SwiftUI"),
            Suggestion(text: "React"),
            Suggestion(text: "Design")
        ]
static let  topics = [
    Topic(title: "iOS Development", icon: "iphone"),
    Topic(title: "UI Design", icon: "eyedropper"),
    Topic(title: "Web development", icon: "laptopcomputer")
]
        static let featuredCourses = [
            Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animation and ...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
            Course(title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animation and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
            Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
            Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
        ]

        static let `courses` = [
            Course(title: "SwiftUI for iOS 15", subtitle: "20 sections - 3 hours", text: "Build an iOS app for iOS 15 with custom layouts, animation and ...", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
            Course(title: "UI Design for iOS 15", subtitle: "20 sections - 3 hours", text: "Design an iOS app for iOS 15 with custom layouts, animation and ...", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
            Course(title: "Flutter for designers", subtitle: "20 sections - 3 hours", text: "Flutter is a relatively new toolkit that makes it easy to build cross-platform apps that look gorgeous and is easy to use.", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
            Course(title: "React Hooks Advanced", subtitle: "20 sections - 3 hours", text: "Learn how to build a website with Typescript, Hooks, Contentful and Gatsby Cloud", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
        ]
        static let handbooks = [
            Handbook(title: "SwiftUI Handbook", subtitle: "80 sections - 9 hours", text: "A comprehensive series of tutorials covering Xcode, SwiftUI and all the layout and development techniques", logo: "Logo 1", image: "Illustration 1", colorTop: .teal, colorBottom: .blue),
            Handbook(title: "React Advanced Handbook", subtitle: "30 sections - 3 hours", text: "A comprehensive guide for an overview of the React library and all its basics", logo: "Logo 1", image: "Illustration 2", colorTop: .purple, colorBottom: .pink)
        ]
        static let courseSections = [
            CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
            CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
            CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
            CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
            CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1),
            CourseSection(title: "Advanced Custom Layout", subtitle: "SwiftUI for iOS 15", text: "Build an iOS app for iOS 15 with custom layouts...", image: "Illustration 1", background: "Background 5", logo: "Logo 2", progress: 0.5),
            CourseSection(title: "Coding the Home View", subtitle: "SwiftUI Concurrency", text: "Learn about the formatted(date:time:) method and AsyncImage", image: "Illustration 2", background: "Background 4", logo: "Logo 2", progress: 0.2),
            CourseSection(title: "Styled Components", subtitle: "React Advanced", text: "Reset your CSS, set up your fonts and create your first React component", image: "Illustration 3", background: "Background 3", logo: "Logo 3", progress: 0.8),
            CourseSection(title: "Flutter Interactions", subtitle: "Flutter for designers", text: "Use the GestureDetector Widget to create amazing user interactions", image: "Illustration 4", background: "Background 2", logo: "Logo 1", progress: 0.0),
            CourseSection(title: "Firebase for Android", subtitle: "Flutter for designers", text: "Create your first Firebase Project and download Firebase plugins for Android", image: "Illustration 5", background: "Background 1", logo: "Logo 1", progress: 0.1)
        ]

    }
}
