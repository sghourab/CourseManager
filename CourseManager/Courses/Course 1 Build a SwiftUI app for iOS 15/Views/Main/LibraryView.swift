//
//  LibraryView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import SwiftUI

struct LibraryView: View {
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()

            ScrollView {
                certificatesSection

                Text("History".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)

                cardsSection
            }
            .background(Image("Blob 1").offset(x: 100, y: -60))
            .navigationTitle("Library")
        }
    }

    var certificatesSection: some View {
        CertificateView()
            .frame(height: 220)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(.linearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.horizontal, 20)
                    .offset(y: -20)
            )
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(.linearGradient(colors: [.teal, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(.horizontal, 40)
                    .offset(y: -40)
            )
            .padding(20)
    }

    var cardsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(courses) { item in
                    SmallCourseItem(course: item)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
