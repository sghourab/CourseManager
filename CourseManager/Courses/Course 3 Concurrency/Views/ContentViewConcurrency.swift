//
//  ContentViewConcurrency.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-01.
//

import SwiftUI

struct ContentViewConcurrency: View {
    var body: some View {
        TabView {
            HomeViewConcurrency()
                .tabItem {
                    Image(systemName: "house")
                    Text("Learn now")
                }
        }
    }
}

struct ContentViewConcurrency_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewConcurrency()
    }
}

