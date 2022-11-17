//
//  WeatherView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-10.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""

    var searchResults: [Forecast] {
        return searchText.isEmpty ? Forecast.cities : Forecast.cities.filter { $0.location.contains(searchText)
        }
    }

    var body: some View {
        ZStack {
            Color.weatherBackground
                .ignoresSafeArea()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        WeatherWidget(forecast: forecast)
                    }
                }
            }
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay {
            NavigationBarWeather(searchText: $searchText)
        }
        .navigationBarHidden(true)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
