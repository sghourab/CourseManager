//
//  CourseDetailsRowView.swift
//  CourseManager
//
//  Created by Summer Crow on 2022-11-28.
//

import SwiftUI

struct CourseDetailsRowView: View {
    var course = CourseInformation(name: "SwiftUI", url: "swiftUI.com", imageName: "Build SwiftUI App", progressPercentage: 0.5, gitHubURL: "", status: .complete, dateOfCompletion: Date(), comments: "great course, will be implenting")
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Course Name")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(course.name)
                    .foregroundColor(.secondary)
                Divider()
                Text("Course Link")
                    .font(.headline)
                    .fontWeight(.bold)
                if let url = URL(string: course.url) {
                    Link(course.url, destination: url)
                }
                Divider()
                Text("Status")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(course.status.localizedName)
                    .foregroundColor(.secondary)
                Divider()
            }
            VStack(alignment: .leading, spacing: 10) {
                if course.status == .complete {
                    Text("Date Completed")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(course.dateOfCompletion, style: .date)
                        .foregroundColor(.secondary)
                    Divider()
                }
                Text("Comments")
                    .font(.headline)
                    .fontWeight(.bold)
                Text(course.comments)
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CourseDetailsRowView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailsRowView()
    }
}
