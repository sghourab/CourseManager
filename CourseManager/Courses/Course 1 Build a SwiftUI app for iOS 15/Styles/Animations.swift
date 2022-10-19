//
//  Animations.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-10-11.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
