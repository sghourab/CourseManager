//
//  Model.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-10-11.
//

import Combine
import SwiftUI

class Model: ObservableObject {
    @Published var showDetail: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
