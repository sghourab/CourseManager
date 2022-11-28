//
//  ProfileRow.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-10-24.
//

import SwiftUI

struct ProfileRow: View {
    @AppStorage("isLiteMode") var isLiteMode: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            profilePicture
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Stepanie Diep")
                    .font(.title2)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundColor(.white)
                Text("View Certificate")
                    .font(.footnote)
                    .foregroundColor(Color.white.opacity(0.7))
            }
            
            Spacer()
            glowIcon
        }
        .blurBackground()
    }

    var profilePicture: some View {
        ZStack {
            Image(systemName: "circle.fill")
                .font(.system(size: 66))
                .angularGradientGlow(colors: [Color(#colorLiteral(red: 0.1585651918, green: 0.3611401321, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3172824642, green: 1, blue: 0.6120585908, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.9656071606, blue: 0.1392755312, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.4030374122, blue: 0.4371414855, alpha: 1))])
                .frame(width: 66, height: 66)
                .ifMode(!isLiteMode, transform: { view in
                    view.blur(radius: 10)
                })
            VStack {
                Image("Profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 66, height: 66, alignment: .center)
                    .cornerRadius(50)
            }
            .overlay(Circle().stroke(Color.white, lineWidth: 1.0))
        }
    }
    
    var glowIcon: some View {
        ZStack {
            if !isLiteMode {
                AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1585651918, green: 0.3611401321, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3172824642, green: 1, blue: 0.6120585908, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.4030374122, blue: 0.4371414855, alpha: 1))]), center: .center, startAngle: .init(degrees: -190), endAngle: .degrees(155))
                    .blur(radius: 8)
                    .shadow(radius: 30)
                    .frame(width: 36, height: 36)
            }
            Image(systemName: "square.stack.fill")
                .linearGradientBackground(colors: [Color(#colorLiteral(red: 0.5733967525, green: 0.5994919753, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9563451731, green: 0.5479036683, blue: 0.9686274529, alpha: 1))])
                .frame(width: 36, height: 36)
                .background(Color(red: 0.121, green: 0.012, blue: 0.42).opacity(0.8))
                .mask(RoundedRectangle(cornerRadius: 12, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.white.opacity(0.7), lineWidth: 1).blendMode(.overlay))
        }
    }
}

struct ProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow()
    }
}
