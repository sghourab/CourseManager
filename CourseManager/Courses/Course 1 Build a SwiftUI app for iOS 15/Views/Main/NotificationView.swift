//
//  NotificationView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-11.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        ZStack {
            AppColor.background.ignoresSafeArea()
            ScrollView {
                sectionsSection
            }
            .background(Image("Blob 1").offset(x: -180, y: 300))
        }
        .navigationTitle("Notifications")
    }

    var sectionsSection: some View {
        VStack {
            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
                if index != 0 {
                    Divider()
                }
                SectionRow(section: section)
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
