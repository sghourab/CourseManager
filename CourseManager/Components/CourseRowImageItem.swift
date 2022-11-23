//
//  CourseRowImageItem.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-23.
//

import SwiftUI

struct CourseRowImageItem: View {
    @State var courseName: String
    @State var imageName: String
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Image(imageName)
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                
                HStack(alignment: .top) {
                    Text(courseName)
                        .font(.title2)
                        .minimumScaleFactor(0.01)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Spacer()
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 70, height: 10)
                }
                .padding(.bottom, 15)
              
            }.frame(maxWidth: .infinity)
        }
        
        .padding(.horizontal, 10)
        .background(
            LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottomLeading)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: AppColors.shadow.opacity(0.4), radius: 5, x: 5, y: 5)
    }
}

struct CourseRowImageItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseRowImageItem(courseName: "SwiftUI Build an app for iOS15", imageName: "Course1CoverImage")
    }
}
