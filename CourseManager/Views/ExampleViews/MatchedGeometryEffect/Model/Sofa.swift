//
//  Sofa.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-12-07.
//

import SwiftUI

struct Sofa: Identifiable {
    let id = UUID()
    var title: String
    var modelNumber: String
    var price: String
    var rating: Double
    var imagePlain: String
    var imageWithBackground: String
    var info: String
}

var sofas: [Sofa] = [
    Sofa(title: "Diver Contemporary 2-piece Reversible Sectional", modelNumber: "1506357", price: "2,999.99", rating: 4.3, imagePlain: "sofa3Plain", imageWithBackground: "sofa3Background", info: "Upholstery: 100% polyester corduroy\nSolid wood and plywood construction\nSS-spring and webbing support"),
    Sofa(title: "Thomasville Contemporary 2-piece Sectional", modelNumber: "1570078", price: "1,999.99", rating: 3.2, imagePlain: "sofa1Plain", imageWithBackground: "sofa1Background", info: "Grey fabric upholstery\nTwo piece sectional plus ottoman\nStorage ottoman"),
    Sofa(title: "Annadale Contemporary 2-piece Fabric Sectional", modelNumber: "1414702", price: "2,149.99", rating: 2.5, imagePlain: "sofa2Plain", imageWithBackground: "sofa2Background", info: "Colour: grey\nFoam seat cushions\nPadded square arms\nSinuous spring suspension\nSolid wood legs – black")
]
