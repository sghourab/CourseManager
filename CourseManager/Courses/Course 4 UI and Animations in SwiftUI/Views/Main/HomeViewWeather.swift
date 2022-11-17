//
//  HomeViewWeather.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-09.
//

import BottomSheet
import SwiftUI

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83 // 702/844 = position of sheet in 'top' position / overall height of screen
    case middle = 0.385 // 325/844 = position of sheet in 'middle' position / overall height of screen
}

struct HomeViewWeather: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false

    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36

                ZStack {
                    Color.weatherBackground
                        .ignoresSafeArea()

                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)

                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)

                    locationForecast

                    BottomSheetView(position: $bottomSheetPosition) {} content: {
                        ForecastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
                    }.onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        withAnimation(.easeInOut) {
                            hasDragged = bottomSheetPosition == .top ? true : false
                        }
                    }
                    TabBarWeather(action: {
                        bottomSheetPosition = .top
                    })
                    .offset(y: bottomSheetTranslationProrated * 115)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }

    private var locationForecast: some View {
        VStack(spacing: -10 * (1 - bottomSheetTranslationProrated)) {
            Text("Montreal")
                .font(.largeTitle)

            VStack {
                Text(attributedString)
                Text("H:24°   L:18°")
                    .font(.title3.weight(.semibold))
                    .opacity(1 - bottomSheetTranslationProrated)
            }

            Spacer()
        }
        .padding(.top, 51)
        .offset(y: -bottomSheetTranslationProrated * 46)
    }

    private var attributedString: AttributedString {
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n ") + "Mostly Clear")

        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: 96 - (bottomSheetTranslationProrated * (96 - 20)), weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }

        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }

        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeViewWeather_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewWeather()
            .preferredColorScheme(.dark)
    }
}
