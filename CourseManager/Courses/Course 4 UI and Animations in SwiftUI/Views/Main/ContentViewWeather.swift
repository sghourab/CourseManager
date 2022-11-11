//
//  ContentViewWeather.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-09.
//

import SwiftUI

struct ContentViewWeather: View {
    var body: some View {
        HomeViewWeather()
            .navigationBarHidden(true)

    }
}

struct ContentViewWeather_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewWeather()
    }
}
