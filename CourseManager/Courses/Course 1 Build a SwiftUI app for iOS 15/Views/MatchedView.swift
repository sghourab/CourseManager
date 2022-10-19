//
//  MatchView.swift
//  SwiftUIPractice1
//
//  Created by Summer Crow on 2022-10-06.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false

    var body: some View {
        ZStack {
            if !show {
            } else {}
        }
    }
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
