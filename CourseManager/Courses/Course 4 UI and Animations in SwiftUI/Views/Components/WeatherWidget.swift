//
//  WeatherWidget.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-10.
//

import SwiftUI

struct WeatherWidget: View {
    var forecast: Forecast
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .padding(.top, 10)
                .padding(.bottom, 10)
            
            weatherContent
        }
        .padding(.horizontal, 20)
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.25, alignment: .bottom)
    }
    
    var weatherContent: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(forecast.temperature)°")
                    .font(.system(size: 64))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("H:\(forecast.high)°  L:\(forecast.low)°")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Text(forecast.location)
                        .font(.body)
                        .lineLimit(1)
                }
            }
            Spacer()
            
            VStack(alignment: .trailing, spacing: 0) {
                Image("\(forecast.icon) large")
                    .padding(.trailing, 4)
                
                Text(forecast.weather.rawValue)
                    .font(.footnote)
                    .padding(.trailing, 24)
            }
        }
        .foregroundColor(.white)
        .padding(.bottom, 20)
        .padding(.leading, 20)
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget(forecast: Forecast.cities[0])
            .preferredColorScheme(.dark)
    }
}
